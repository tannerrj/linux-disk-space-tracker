# Linux Disk Space Tracker

## Description

Disk Space Tracker is a Bash script that checks disk space in bytes, writes the information to an HTML table, and appends the data to the table in an HTML file every time it's run.

## Installation

### Requirements

No special requirements are needed to run this script, but it is helpful to have git installed to download all the related code for Linux Disk Space Tracker.

## Usage

Once the software is downloaded or pulled via git, run the script:

```Bash

sh disk-space-tracker.sh

```

## Workflow Summary

This Bash script performs the following tasks:

 1. It defines the path to a CSV file named `disk_space.csv.`
 2. It gets the current date and time and stores them in the variables `current_date` and `current_time`.
 3. It calculates the amount of disk space used in bytes by running the `df` command and extracting the `used` column value for the root directory (/). The result is stored in the `disk_space_used` variable.
 4. It checks if the CSV file (`disk_space.csv`) exists. If it does not exist, it creates the file and adds a header line with the column names: `date,` `time,` and `used_disk_space_bytes.`
 5. It appends the current date, time, and the calculated disk space usage to the CSV file, creating a new row with this data.
 6. It logs verbose output to a local `logging.txt` file, including the start time, collected disk space information, and the script's finish time.
 7. Finally, it prints a message to the console indicating that disk space information has been collected and logged to the `disk_space.csv` file.

Overall, this script is designed to collect disk space usage information for the root directory, store it in a CSV file, and create a log file with detailed information about the process. It provides a basic form of system monitoring and record-keeping for disk space usage.

## Guidelines

### Description: Questions to Consider

 * What is the app for?
   * Anyone looking to track and log disk space utilization over time due to system updates, software installations, regular use, and/or data hoarding.
 * What was your motivation?
   * Working on a gaming project called [Crossfire](https://sourceforge.net/projects/crossfire/), I was creating docs on how to install the game client. Given the game client can run IoT devices where disk space can be a premium, I wanted to show and track how much disk space is necessary for downloading source code and install dependencies for each step. This way the user can see and plan accordingly for installing the client.
 * What problem does it solve?
   * I think this helps with planning and avoiding a problem of running out of available disk space, or during the purchase and build process not getting a SSD with enough capacity to run the OS and other desired applications.

## Installation:

No special requirements beyond a working Linux installation is required.

## Usage:

TODO: Provide instructions and examples for use. Include screenshots as needed.

## Contributing

Contributions are welcome. Creating a fork on this code base is also welcome.

## Questions:

I can be reached via [tannerrj GitHub Profile](https://github.com/tannerrj)

## License:

MIT License
