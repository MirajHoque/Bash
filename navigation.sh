#!/bin/bash

# Array of menu options
options=("Display Date and Time" "List Files" "Display Free Disk Space" "Display System Uptime" "Exit")

# Function to draw the menu
#displays the menu and highlights the currently selected option.
#selected parameter indicates the index of the currently highlighted menu item

draw_menu() {
    #The draw_menu function takes one parameter, $1, which represents the index of the currently selected menu option.
    #local selected=$1 stores this parameter in a local variable selected for use within the function.
    local selected=$1
    
    clear
    echo "-------------------------------"
    echo " Main Menu "
    echo "-------------------------------"

    #options is the name of the array.
    #@ is used to refer to all elements of the array.
    # (!) is used to refer to the indices of the array elements rather than the values.

    for i in "${!options[@]}"; do
        if [ "$i" -eq "$selected" ]; then
            echo "> ${options[i]}"
        else
            echo "  ${options[i]}"
        fi
    done
    echo "-------------------------------"
    echo "Use arrow keys to navigate, Enter to select"
}

# Functions for each menu option
display_date_time() {
    clear
    echo "Current date and time: $(date)"
    pause
}

list_files() {
    clear
    echo "Files in current directory:"
    ls -lah
    pause
}

display_free_disk_space() {
    clear
    echo "Free disk space:"
    df -h
    pause
}

display_system_uptime() {
    clear
    echo "System uptime:"
    uptime
    pause
}

pause() {
    echo
    read -n 1 -s -r -p "Press any key to continue..."
}

# Main loop
selected=0
while true; do
    draw_menu $selected

    # Capture user input
    read -s -n 1 key
    case "$key" in
        $'\x1b')  # ESC key (beginning of an arrow key sequence) |epresents the ESC key, which is the beginning of an arrow key sequence.
            read -s -n 2 key # Read the next two characters
            case "$key" in
                '[A') # Up arrow
                    ((selected--))
                    if [ $selected -lt 0 ]; then
                        selected=$((${#options[@]} - 1))
                    fi
                    ;;
                '[B') # Down arrow
                    ((selected++))
                    if [ $selected -ge ${#options[@]}; then
                        selected=0
                    fi
                    ;;
            esac
            ;;
        '') # Enter key
            case $selected in
                0) display_date_time ;;
                1) list_files ;;
                2) display_free_disk_space ;;
                3) display_system_uptime ;;
                4) exit 0 ;;
            esac
            ;;
    esac
done




# ----------------------------------------------------------------------------------------------------------------
                                          Updated Script
# ----------------------------------------------------------------------------------------------------------------


#!/bin/bash

# Array of menu options
options=("Display Date and Time" "List Files" "Display Free Disk Space")

# Function to draw the menu
drawMenu() {
  local selected=$1
  clear

  echo "-------------------------"
  echo "Main Menu"
  echo "-------------------------"

  for i in "${!options[@]}"; do
    if [ "$i" -eq "$selected" ]; then
      echo "> ${options[i]}"
    else
      echo "  ${options[i]}"
    fi
  done

  echo "-------------------------"
  echo "Use arrow keys to navigate, Enter to select"
}

# Function for each menu option
displayDateTime() {
  clear
  echo "Current Date and Time: $(date)"
  pause
}

listFiles() {
  clear
  echo "Files in Current Directory:"
  ls -lah
  pause
}

displayFreeDiskSpace() {
  clear
  echo "Free Disk Space:"
  df -h
  pause
}

pause() {
  echo
  read -n 1 -s -r -p "Press any key to continue..."
}

# Main loop
selected=0
while true; do
  drawMenu $selected

  # Capture user input
  read -s -n 1 key

  case "$key" in
    $'\x1b') # ESC key (beginning of an arrow key sequence)
      read -s -n 2 key # Read the next two characters

      case "$key" in
        '[A') # Up arrow
          ((selected--))
          if [ $selected -lt 0 ]; then
            selected=$((${#options[@]} - 1))
          fi
          ;;
        '[B') # Down arrow
          ((selected++))
          if [ $selected -ge ${#options[@]} ]; then
            selected=0
          fi
          ;;
      esac
      ;;
    '') # Enter key
      case $selected in
        0) displayDateTime ;;
        1) listFiles ;;
        2) displayFreeDiskSpace ;;
      esac
      ;;
  esac
done
