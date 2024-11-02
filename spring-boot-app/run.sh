#!/bin/bash  
PID_FILE=application.pid  

# Kill existing process if running  
if [ -f $PID_FILE ]; then  
    kill -9 $(cat $PID_FILE) || true  
    rm $PID_FILE  
fi  

# Start the application  
nohup java -jar target/${JAR_NAME} --server.port=${APP_PORT} > app.log 2>&1 &  
echo $! > $PID_FILE  
sleep 10  # Give some time for the application to start  

# Check if process is running  
if ps -p $(cat $PID_FILE) > /dev/null; then  
    echo "Application started successfully"  
else  
    echo "Failed to start application"  
    exit 1  
fi