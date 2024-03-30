#!/usr/bin/env bash

# Check if the user provided a file to run
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <file_to_run_in_server>"
    exit 1
fi

file_to_run=$1
server_ip="54.166.91.36"
user="ubuntu"
ssh_key="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQD3lAUyvbKVnmmwDT5he8uOA3cOYhSLp0op1e7KyRZoiFZuf6tUpJ143LlanLY/uRxuHdm0ya1UtaLQCAfxHJqeo+XEbopJVivr60GfTj5fckQTyM7yKQPX7bw4cXKRbp6m+cMDcZC2hdPsiO2gR++oxG/du7GZSYnLsCHxZMMdWImVyqdbKzrX9uZiwFF4oLgWTc4AHvoGzRTc6Zx8hM0dohjhyeFXr4QCGwi6RPGXfSDrY0Z5K9+LiIrMhNSo18YoKACfSNClbSOPJDB7jONOhNzNCMrIWcF+eYIcXQd2viEZhwilReccV4gaS1smGvA9gdrhcGNPtLpuw30cYVv+gz6YPG1yCSfRdL/+vfeiV0ObAjCcPdn9TrjFhPm+3lz2RFf2KT18H6SQlcH/wiPoI/Ibxn9GU9hYDTRMZLUZS8xdFR7jwTfbLMldWtofg0ivqt5Dw9PTgCc84ZHOXD6G0p3+Qf+BDdWbnoIanYpE5CMBl2d7k36wVNmg/4Dtydk"

# Check if the file exists locally
if [ ! -f "$file_to_run" ]; then
    echo "Error: File '$file_to_run' not found."
    exit 1
fi

# Copy the file to the server
scp -i "$ssh_key" "$file_to_run" "$user@$server_ip:~/" || {
    echo "Error: Failed to copy file to the server."
    exit 1
}

# Execute the file on the server
ssh -i "$ssh_key" "$user@$server_ip" "./$file_to_run" || {
    echo "Error: Failed to execute the file on the server."
    exit 1
}
