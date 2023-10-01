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