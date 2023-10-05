# Introduction

Linux Disk Space Tracker

## Inquiry

```
A bash script that collects disk space with the following features:
1. date and time that the command is run is added to the table
2. disk space used is in bytes is added to the table
3. Each time the script is run,  that row is inserted above the closing </table> tag
4. compatible with sed version 4.8-1ubuntu2
5. write verbose output of the script to local logging.txt file during the command execution

```

### Results

You can create a Bash script that collects disk space information and adds it to an HTML table while meeting the specified requirements. Below is a script that accomplishes this:

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

Make sure to create an HTML file named `disk_space_report.html` with the following content before running the script:

```html

<!DOCTYPE html>
<html>
<head>
  <title>Disk Space Report</title>
</head>
<body>
  <table>
    <tr>
      <th>Date and Time</th>
      <th>Disk Space Used (bytes)</th>
    </tr>
  </table>
</body>
</html>

```

This script will run the `df` command to collect disk space information, convert the usage to bytes, add a new row with date and time, and insert it into the HTML table. It also logs verbose output to `logging.txt` as specified. Please make sure to adjust the file paths and permissions as needed.