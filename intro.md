# Introduction

Linux Disk Space Tracker

## Inquiry

User
```
Show me a bash script that runs a disk space check in bytes and writes that info to a html table that includes the previous command, date, disk space used and continuously adds this information to the table
```

### Results

Certainly! Here's a Bash script that checks disk space in bytes, writes the information to an HTML table, and appends the data to the table in an HTML file every time it's run:

```bash
#!/bin/bash

# Define the HTML file to store the table data
html_file="disk_space_report.html"

# Check if the HTML file exists; if not, create it with a basic structure
if [ ! -f "$html_file" ]; then
    echo "<html><head><title>Disk Space Report</title></head><body>" > "$html_file"
    echo "<h1>Disk Space Report</h1>" >> "$html_file"
    echo "<table border='1'>" >> "$html_file"
    echo "<tr><th>Date</th><th>Command</th><th>Disk Space Used (Bytes)</th></tr>" >> "$html_file"
    echo "</table>" >> "$html_file"
    echo "</body></html>" >> "$html_file"
fi

# Get the current date and time
current_date=$(date +"%Y-%m-%d %H:%M:%S")

# Run the disk space check and capture the output in bytes
disk_space_used=$(df --output=used / | awk 'NR==2 {print $1}')

# Append the data to the HTML table
echo "<tr><td>$current_date</td><td>df --output=used /</td><td>$disk_space_used</td></tr>" >> "$html_file"

# Close the HTML table
echo "</table>" >> "$html_file"

echo "Disk space check complete. Data added to $html_file."
```

This script first checks if the HTML file (`disk_space_report.html`) exists. If it doesn't exist, it creates a basic HTML structure with a table to store the data. It then gets the current date and runs the `df` command to check the disk space used in bytes. Finally, it appends this information to the HTML table and saves it to the HTML file.

Each time you run the script, it will add a new row to the HTML table with the current date, the command executed, and the disk space used in bytes. This way, you can continuously monitor disk space usage and keep a historical record in the HTML file.
