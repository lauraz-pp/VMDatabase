# Initializing SQL Server for the AI Lectures

1. Clone or download the repo. Unzip the folder, if necessary.
    ```
    git clone git@github.com:lauraz-pp/VMDatabase.git
    ```

2. Move to the folder `VMDatabase`.
    ```
    cd VMDatabase
    ```

3. In the folder `~/VMDatabase`, run the following command to grant permissions to the files to be executable.
    ```
    chmod +x vm-create-and-run-container.sh InitDB/entrypoint.sh
    ```

4. Create docker image (Note: make sure Docker is running):
    ```
    sudo docker build -t vm-dababase-image:latest .
    ```

5. Create and run database container:
    ```
    ./vm-create-and-run-container.sh
    ```
