#!/bin/bash

# Function to display the menu
show_menu() {
    clear
    echo "-------------------------------"
    echo " Main Menu "
    echo "-------------------------------"
    echo "1. Display Date and Time"
    echo "2. List Files"
    echo "3. Display Free Disk Space"
    echo "4. Display System Uptime"
    echo "5. Exit"
    echo "-------------------------------"
    echo -n "Enter your choice [1-5]: "
}

# Function to read the user's choice
read_choice() {
    #The read command is used to capture the user's input.
    #   -r option prevents backslashes from being interpreted as escape characters.
    #choice is the variable where the input will be stored.

    read -r choice
    case $choice in
        1) display_date_time ;;
        2) list_files ;;
        3) display_free_disk_space ;;
        4) display_system_uptime ;;
        5) exit 0 ;;
        *) echo "Invalid choice!" && sleep 2 ;;
    esac
}

# Function to display date and time
display_date_time() {
    echo "Current date and time: $(date)"
    pause
}

# Function to list files
list_files() {
    echo "Files in current directory:"
    ls -lah
    pause
}

# Function to display free disk space
display_free_disk_space() {
    echo "Free disk space:"
    df -h
    pause
}

# Function to display system uptime
display_system_uptime() {
    echo "System uptime:"
    uptime
    pause
}

# Function to pause and wait for user to press a key
pause() {
    echo
    read -n 1 -s -r -p "Press any key to continue..."
    read: The command used to capture user input.
#-n 1:ead should only wait for a single character of input.
#-s: makes the input silent, meaning the character pressed by the user will not be displayed on the screen.
#-r: This option prevents backslashes from being interpreted as escape characters.
#-p "Press any key to continue...": This option displays a prompt message to the user. The user sees this message and knows they need to press a key to proceed.
}

# Main logic
while true; do
    show_menu
    read_choice
done
