# Introduction

Linux Disk Space Tracker

## Inquiry

```
A bash script that collects disk space with the following features:
1. date that the command is run is added to the csv file
2. time that the command is run is added to the csv file
3. disk space used in bytes is added to the csv file
4. the csv file has has labels at the top row of the following: date, time, used disk space (bytes)
5. Each time the script is run,  that row is inserted at the bottom row of the csv file
6. compatible with sed version 4.8-1ubuntu2
7. write verbose output of the script to local logging.txt file during the command execution

```

### Results

You can create a Bash script that collects disk space information and logs it to a CSV file with the specified features. Here's a sample script for achieving this:

```bash
#!/bin/bash

# Define the path to the CSV file
csv_file="disk_space.csv"

# Get the current date and time
current_date=$(date +"%Y-%m-%d")
current_time=$(date +"%H:%M:%S")

# Get disk space used in bytes
disk_space_used=$(df --output=used / | tail -n 1)

# Check if the CSV file exists; if not, create it with headers
if [ ! -e "$csv_file" ]; then
    echo "date,time,used_disk_space_bytes" > "$csv_file"
fi

# Add the current data to the CSV file
echo "$current_date,$current_time,$disk_space_used" >> "$csv_file"

# Log verbose output to a local logging.txt file
log_file="logging.txt"
echo "Script started at $(date +"%Y-%m-%d %H:%M:%S")" > "$log_file"
echo "Collected disk space information:" >> "$log_file"
echo "Date: $current_date" >> "$log_file"
echo "Time: $current_time" >> "$log_file"
echo "Used Disk Space (bytes): $disk_space_used" >> "$log_file"
echo "Script finished at $(date +"%Y-%m-%d %H:%M:%S")" >> "$log_file"

echo "Disk space information collected and logged to $csv_file."
```

Make sure you save this script to a file, make it executable with `chmod +x script.sh`, and then you can run it using `./script.sh`. It will create or update the CSV file, add the necessary headers if needed, and log the information to a separate `logging.txt` file. This script is compatible with most common versions of `sed`, including the one you mentioned.