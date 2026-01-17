#!/bin/bash

# User-Friendly Menu Script
# Presents a menu of system tasks and executes the chosen option

while true; do
  echo "============================"
  echo "      System Task Menu       "
  echo "============================"
  echo "1) Check disk space"
  echo "2) Show system uptime"
  echo "3) List users"
  echo "0) Exit"
  echo "----------------------------"

  read -r -p "Choose an option: " choice
  echo

  case "$choice" in
    1)
      echo "Disk space:"
      df -h
      ;;
    2)
      echo "System uptime:"
      uptime
      ;;
    3)
      echo "Users (from /etc/passwd):"
      cut -d: -f1 /etc/passwd
      ;;
    0)
      echo "Exiting. Bye."
      break
      ;;
    *)
      echo "Invalid option. Please choose 0, 1, 2, or 3."
      ;;
  esac

  echo
  read -r -p "Press Enter to return to the menu..." _
  echo
done
