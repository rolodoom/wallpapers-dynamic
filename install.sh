#!/bin/bash

# Define source and target directories
BACKGROUND_SRC="backgrounds/dyn-wallpapers"
BACKGROUND_TARGET="/usr/share/backgrounds/dyn-wallpapers"
GNOME_BG_SRC="gnome-background-properties"
GNOME_BG_TARGET="/usr/share/gnome-background-properties"

# Function to display help message
show_help() {
    echo "Usage: $0 [-i for install] [-u for uninstall] [-h for help]"
    echo
    echo "Options:"
    echo "  -i  Install the wallpapers and XML files"
    echo "  -u  Uninstall the wallpapers and remove the dyn-wallpapers folder"
    echo "  -h  Display this help message"
    echo
    echo "This script manages the installation and uninstallation of dynamic wallpapers and"
    echo "their associated XML files for GNOME backgrounds."
}

# Function to install the files
install() {
    # Check if the source directories exist
    if [ ! -d "$BACKGROUND_SRC" ]; then
        echo "Source directory '$BACKGROUND_SRC' does not exist!"
        exit 1
    fi
    
    if [ ! -d "$GNOME_BG_SRC" ]; then
        echo "Source directory '$GNOME_BG_SRC' does not exist!"
        exit 1
    fi

    # Create target directories if they do not exist
    sudo mkdir -p "$BACKGROUND_TARGET"
    sudo mkdir -p "$GNOME_BG_TARGET"

    # Copy the contents of wallpapers to the target directory
    sudo cp -r "$BACKGROUND_SRC/"* "$BACKGROUND_TARGET/"

    # Copy the XML files to the target directory
    for xml_file in "$GNOME_BG_SRC"/*.xml; do
        if [ -f "$xml_file" ]; then
            sudo cp "$xml_file" "$GNOME_BG_TARGET/"
        fi
    done

    echo "Installation complete!"
}

# Function to uninstall the files
uninstall() {
    # Check if the source directory exists
    if [ ! -d "$GNOME_BG_SRC" ]; then
        echo "Source directory '$GNOME_BG_SRC' does not exist!"
        return 1
    fi
    
    # Get a list of all XML files in the source directory
    files_in_source=()
    for xml_file in "$GNOME_BG_SRC"/*.xml; do
        if [ -f "$xml_file" ]; then
            basename_xml=$(basename "$xml_file")
            files_in_source+=("$basename_xml")
        fi
    done

    # Loop through the files in the source directory and remove the corresponding files from the target directory
    for file in "${files_in_source[@]}"; do
        full_path="$GNOME_BG_TARGET/$file"
        
        # If the file exists in the target directory, delete it
        if [ -f "$full_path" ]; then
            sudo rm -f "$full_path"
        fi
    done

    # Remove the dyn-wallpapers folder from /usr/share/backgrounds if it exists
    if [ -d "$BACKGROUND_TARGET" ]; then
        sudo rm -rf "$BACKGROUND_TARGET"
    fi
}

# Parse command-line options
while getopts "iuh" opt; do
    case $opt in
        i)
            install
            exit 0
            ;;
        u)
            uninstall
            exit 0
            ;;
        h)
            show_help
            exit 0
            ;;
        *)
            show_help
            exit 1
            ;;
    esac
done

# If no options are provided, display help by default
show_help
