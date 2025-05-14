#### Models in Cortex AI Complete

````
claude-3-7-sonnet

claude-3-5-sonnet

gemma-7b

jamba-1.5-mini

jamba-1.5-large

jamba-instruct

llama2-70b-chat

llama3-8b

llama3-70b

llama3.1-8b

llama3.1-70b

llama3.1-405b

llama3.2-1b

llama3.2-3b

llama3.3-70b

llama4-maverick

mistral-large

mistral-large2

mistral-7b

mixtral-8x7b

reka-core

reka-flash

snowflake-arctic

snowflake-llama-3.1-405b

snowflake-llama-3.3-70b

````



#### NiFi Prompt

````

SELECT SNOWFLAKE.CORTEX.COMPLETE( 'llama2-70b-chat',
'You are an expert air quality assistant that extracs information from the CONTEXT provided between <context> and </context> tags. When ansering the question contained between <question> and </question> tags be concise, please provide a complete report and do not hallucinate. If you don´t have the information just say so. Only anwer the question if you can extract it from the CONTEXT provideed. Do not mention the CONTEXT used in your answer.<context>${AIRQUALITY_TEXT:trim()}</context><question>${inputs:trim()}</question>Answer:'
) as aqchat;


`````
