#!/bin/bash

# Start SQL Server in the background
/opt/mssql/bin/sqlservr &

# Wait for SQL Server to start and be ready to accept connections
until /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P '51Iw!k%&7?6yZ' -Q "SELECT 1" &> /dev/null
do
    echo "Waiting for SQL Server to start..."
    sleep 2
done

echo "SQL Server is running and ready."


# Check if the CSV file exists and process it
if [ -f /usr/src/app/init_db.sql ] && [ -f /usr/src/app/Student.csv ]; then
    echo "Initializing database and importing CSV data..."
    # Run the SQL script to initialize the database
    /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P '51Iw!k%&7?6yZ' -i init_db.sql
else
    echo "One or more required files do not exist."
fi

# Keep the container running
wait
