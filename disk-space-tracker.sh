#!/bin/bash

# Script: disk-space-tracker.sh
# Author: Rick Tanner via ChatGPT
# Description: This script that checks disk space in bytes, writes the information to an HTML table, and appends the data to the table in an HTML file every time it's run.
# Project URL: https://github.com/tannerrj/linux-disk-space-tracker
# License: MIT License


# Step 1: Define the path to the CSV file
csv_file="disk_space.csv"

# Step 2: Get the current date and time
current_date=$(date +"%Y-%m-%d")
current_time=$(date +"%H:%M:%S")

# Step 3: Get disk space used in bytes
disk_space_used=$(df --output=used / | tail -n 1)

# Step 4: Check if the CSV file exists; if not, create it with headers
if [ ! -e "$csv_file" ]; then
    echo "date,time,used_disk_space_bytes" > "$csv_file"
fi

# Step 5: Add the current data to the CSV file
echo "$current_date,$current_time,$disk_space_used" >> "$csv_file"

# Step 6: Log verbose output to a local logging.txt file
log_file="logging.txt"
echo "Script started at $(date +"%Y-%m-%d %H:%M:%S")" > "$log_file"
echo "Collected disk space information:" >> "$log_file"
echo "Date: $current_date" >> "$log_file"
echo "Time: $current_time" >> "$log_file"
echo "Used Disk Space (bytes): $disk_space_used" >> "$log_file"
echo "Script finished at $(date +"%Y-%m-%d %H:%M:%S")" >> "$log_file"

# Step 7: Indicate the script has finished running
echo "Disk space information collected and logged to $csv_file."
