#!/bin/bash  

# Start the application  
nohup java -jar target/hello-world-spring-1.0.0.jar --server.port=3001 > app.log 2>&1 &  

sleep 40  # Give some time for the application to start  
