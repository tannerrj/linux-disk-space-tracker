# Linux Disk Space Tracker

## Description

Disk Space Tracker is a Bash script that checks disk space in bytes, writes the information to an HTML table, and appends the data to the table in an HTML file every time it's run.

## Installation

### Requirements

No special requirements are needed to run this script, but it is helpful to have git install so download all the related code for Linux Disk Space Tracker.

## Usage

Once the software is downloaded or pulled via git, run the script:

```Bash
sh disk-space-tracker.sh
```

## Workflow Summary

This script first checks if the HTML file (`disk_space_report.html`) exists. If it doesn't exist, it creates a basic HTML structure with a table to store the data. It then gets the current date and runs the `df` command to check the disk space used in bytes. Finally, it appends this information to the HTML table and saves it to the HTML file.

Each time you run the script, it will add a new row to the HTML table with the current date, the command executed, and the disk space used in bytes. This way, you can continuously monitor disk space usage and keep a historical record in the HTML file.

## Guidelines


### Description: Questions to Consider**
    * What is the app for?
    * What was your motivation?
    * Why did you build this project?
    * What problem does it solve?

## Installation:

TODO: What are the steps required to install your project? Provide a step-by-step description of how to get the development environment running.

## Usage:

TODO: Provide instructions and examples for use. Include screenshots as needed.

## Contributing

Contributions are welcome. Creating a fork on this code base is also welcome.

## Questions:

[tannerrj GitHub Profile](https://github.com/tannerrj)

## License:

MIT License
