#!/bin/bash

source $HOME/.config/hypr/scripts/variables.sh

script_dir="$(dirname "$(readlink -f "$0")")"
background_file="$script_dir/background.txt"

get_background() {
    # Check if the file exists
    if [ ! -f "$background_file" ]; then
        echo "Error: File '$background_file' not found."
        return 1
    fi

    # Display the current content of the file
    echo "Current content of '$background_file':"
    cat "$background_file"
}

set_background() {
    # Check if the required arguments are provided
    if [ $# -lt 1 ]; then
        echo "Usage: $0 set_background <new_string>"
        return 1
    fi

    new_wallpaper="$1"

    # Replace the content of the file with the new string
    echo "$new_wallpaper" > "$background_file"
    monitor=`hyprctl monitors | grep Monitor | awk '{print $2}'`

    hyprctl hyprpaper unload all
    hyprctl hyprpaper preload "$new_wallpaper" 
    hyprctl hyprpaper wallpaper "$monitor, $new_wallpaper"
}

select_background() {
    # Use find to get a list of all image files in the folder
image_files=$(find "$WALLPAPERS_PATH" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" \))

    # Check if there are any image files
    if [ -z "$image_files" ]; then
        echo "No image files found in $pictures_folder"
        exit 1
    fi

    # Use Rofi to display the list of image files (show only filenames)
    selected_image=$(echo "$image_files" | xargs -n 1 basename | rofi -dmenu -i -p "Select an image:")

    # Check if the user selected a file
    if [ -z "$selected_image" ]; then
        echo "No image selected."
        exit 1
    fi
    
    new_wallpaper=$WALLPAPERS_PATH$selected_image

    # Replace the content of the file with the new string
    echo "$new_wallpaper" > "$background_file"
    monitor=`hyprctl monitors | grep Monitor | awk '{print $2}'`
    
    hyprctl hyprpaper unload all
    hyprctl hyprpaper preload "$new_wallpaper" 
    hyprctl hyprpaper wallpaper "$monitor, $new_wallpaper"
}

# Check if the script is run with the correct arguments
if [ "$#" -eq 0 ]; then
    echo "Usage: $0 [get_background | set_background <new_string>]"
    exit 1
fi

# Check the command provided and call the appropriate function
case "$1" in
    "get_background")
        get_background
        ;;
    "set_background")
        set_background "${@:2}"
        ;;
    "select_background")
        select_background 
        ;;
    *)
        echo "Invalid command. Usage: $0 [get_background | set_background <new_string> | select_background]"
        exit 1
        ;;
esac

