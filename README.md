# Initializing SQL Server for the AI Lectures

1. Download the repo. Unzip the folder, if necessary.
2. Move to the folder `VMDatabase`.
3. In `VMDatabase`, run the following command to grant permissions to the files to be executable.
    ```
    ~/VMDatabase $ chmod +x vm-create-and-run-container.sh InitDB/entrypoint.sh
    ```

4. Create docker image (Note: make sure Docker is running):
    ```
    ~/VMDatabase $ sudo docker build -t vm-dababase-image:latest .
    ```

5. Create and run database container:
    ```
    ~/VMDatabase $ ./vm-create-and-run-container.sh
    ```
