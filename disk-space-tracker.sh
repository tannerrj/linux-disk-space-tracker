```bash

#!/bin/bash

# Function to log verbose output to logging.txt
log_verbose() {
  echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> logging.txt
}

# Check if logging.txt exists, and create it if not
if [ ! -f logging.txt ]; then
  touch logging.txt
fi

# Run the df command to get disk space information and store it in a variable
df_output=$(df -h)

# Get the current date and time
current_datetime=$(date '+%Y-%m-%d %H:%M:%S')

# Convert disk space usage to bytes
disk_usage_bytes=$(df --output=used -B 1 | awk 'NR==2')

# Add a new row to the HTML table with date, time, and disk space usage
new_row="<tr><td>$current_datetime</td><td>$disk_usage_bytes</td></tr>"

# Insert the new row above the closing </table> tag in the HTML file
sed -i "/<\/table>/i $new_row" disk_space_report.html

# Log verbose output
log_verbose "Disk space information collected and added to the table."

echo "Disk space information collected and added to the table."

```