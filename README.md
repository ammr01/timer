# Timer Script

## Overview

This simple Bash script, named "timer," serves as a timer for command execution, providing insights into the duration and exit status of the executed command. The script captures the start and finish times, calculates the execution time, and displays a formatted result.

## Usage

```bash
./timer <command-to-execute>
```

Replace `<command-to-execute>` with the command you want to time. The script will output the execution status code, the time taken for execution, and a visual representation of the result.

## Features

- **Execution Time Calculation**: Captures the start and finish times to calculate the total execution time.
  
- **Visual Result Presentation**: Displays a visual representation of the result, including the status code, execution time, and a horizontal line for visual separation.

- **Signal Handling**: Handles interruption signals (SIGINT and SIGTERM) to gracefully terminate the timed command and display the result.

## Example

```bash
./timer sleep 5
```

This example times the execution of the `sleep 5` command and provides a visual representation of the result.

## Notes

- If no command is provided, the script exits gracefully.

- The script traps interrupt signals (Ctrl+C) and termination signals to handle premature termination of the timed command.
