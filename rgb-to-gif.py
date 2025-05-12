#!/usr/bin/env python3
import time
from datetime import datetime
import subprocess
import argparse
from PIL import Image
import os
import boto3
import paho.mqtt
import paho.mqtt.client as mqttClient
from botocore.client import Config
from kafka import KafkaProducer
from kafka.errors import KafkaError
import json

MAX_FRAMES = 60           # Large sizes get big quick!
SKIP_FRAMES = 2           # Frames to skip before starting recording
OUTPUT_SIZE = (240, 320)  # Multiple of (24, 32)
FPS = 4                   # Should match the FPS value in examples/rawrgb.cpp
RAW_RGB_PATH = "/opt/demo/mlx90640-library/examples/rawrgb"
SERVER_IP = str("192.168.1.1")

frames = []

parser = argparse.ArgumentParser()
parser.add_argument('--frames', type=int, help='Number of frames to capture.', default=MAX_FRAMES)
parser.add_argument('--fps', type=int, help='Framerate to capture. Default: 4',
                    choices=[1, 2, 4, 8, 16, 32, 64], default=FPS)
parser.add_argument('--skip', type=int, help='Frames to skip. Default: 2', default=SKIP_FRAMES)
args = parser.parse_args()

fps = args.fps
max_frames = args.frames
skip_frames = args.skip

if not os.path.isfile(RAW_RGB_PATH):
    raise RuntimeError("{} doesn't exist, did you forget to run \"make\"?".format(RAW_RGB_PATH))

print("""rgb-to-gif.py - output a gif using ./rawrgb command.

Use ./rawrgb to grab frames from the MLX90640
and render them into a gif.

You must have built the "rawrgb" executable first with "make"

Press Ctrl+C to save & exit!

""")

try:
    with subprocess.Popen(["sudo", RAW_RGB_PATH, "{}".format(fps)], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE) as camera:
        while True:
            # Despite the docs, we use read() here since we want to poll
            # the process for chunks of 2304 bytes, each of which is a frame
            frame = camera.stdout.read(2304)
            size = len(frame)
            print("Got {} bytes of data!".format(size))

            if skip_frames > 0:
                time.sleep(1.0 / fps)
                skip_frames -= 1
                continue

            # Convert the raw frame bytes into a PIL image and resize
            image = Image.frombytes('RGB', (32, 24), frame)

            frames.append(image)
            print("Frames: {}".format(len(frames)))
            if len(frames) == max_frames:
                break

            time.sleep(1.0 / fps)

except KeyboardInterrupt:
    pass
finally:
    if len(frames) > 1:
        master = Image.new('RGB', (32, 24 * len(frames)))
        for index, image in enumerate(frames):
            master.paste(image, (0, 24 * index))
        master = master.convert('P', dither=False, palette=Image.ADAPTIVE, colors=256)

        for index, image in enumerate(frames):
            image = image.convert('P', dither=False, palette=master.palette)
            # image = image.quantize(method=3, palette=master)
            image = image.transpose(Image.ROTATE_270).transpose(Image.FLIP_LEFT_RIGHT)
            image = image.resize(OUTPUT_SIZE, Image.NEAREST)
            frames[index] = image

        filedir = "/opt/demo/images/"
        filename = 'mlx90640-{}.gif'.format(
            datetime.now().strftime("%Y-%m-%d-%H-%M-%S"))
        print("Saving {} with {} frames.".format(filename, len(frames)))
        frames[0].save(
            str(filedir) + str(filename),
            save_all=True,
            append_images=frames[1:],
            duration=1000 // fps,
            loop=0,
            include_color_table=True,
            optimize=True,
            palette=master.palette.getdata())
        ### where to upload file
        S3_URL = "http://" + str(SERVER_IP) + ":9000"
        GHOST_BUCKET = "images"
        try:
            s3 = boto3.resource('s3',endpoint_url=S3_URL,aws_access_key_id='minioadmin',aws_secret_access_key='minioadmin',
                                config=Config(signature_version='s3v4'))

            s3.Bucket(GHOST_BUCKET).upload_file(str(filedir) + str(filename),filename)

        except Exception as e:
            print("S3 error")
            print(e)
        print(filename)            
        image_url = str(S3_URL) + "/images/" + str(filename)
        print(image_url)
        kkey = str( datetime.now().strftime("%Y-%m-%d-%H-%M-%S") )     
        kproducer = KafkaProducer(value_serializer=lambda v: json.dumps(v).encode('utf-8'), bootstrap_servers=[str(SERVER_IP) + str(":19092")],retries=3   ) 
        kproducer.send("scan", image_url)
        kproducer.flush()

        row = { }
        row['uuid'] = kkey
        row['filename'] = filename
        row['imageurl'] = image_url
        json_string = json.dumps(row)

        if paho.mqtt.__version__[0] > '1':
             client = mqttClient.Client(mqttClient.CallbackAPIVersion.VERSION1)
        else:
             client = mqttClient.Client()
        client.connect("192.168.1.1", 1883, 60)
        client.publish("scan", payload=json_string, qos=0, retain=True)


        print("Sent " + str(kkey) + ":" + str(image_url))

