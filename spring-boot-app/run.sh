#!/bin/bash  

# Start the application  
nohup java -jar target/${JAR_NAME} --server.port=${APP_PORT} > app.log 2>&1 &  

sleep 40  # Give some time for the application to start  
