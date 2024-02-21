# Use the official Microsoft SQL Server image
FROM mcr.microsoft.com/mssql/server:2019-latest

# Temporarily switch to root to create directory and adjust permissions
USER root

# Create a directory within the SQL container
RUN mkdir -p /usr/src/app && \
    chown -R mssql: /usr/src/app

# Set the working directory
WORKDIR /usr/src/app

# Switch back to the mssql user
USER mssql

# Expose port 1441 for SQL Server
EXPOSE 1441

# Use the entrypoint script to start SQL Server, initialize the database, and optionally process the CSV
ENTRYPOINT ["./entrypoint.sh"]
