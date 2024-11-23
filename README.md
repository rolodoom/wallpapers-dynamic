# Rolo's Dynamic Wallpaper Collection

I've collected a lot of wallpapers and sometimes a don't even remember where I got them, so I decided to put them the here.

This script allows you to easily install or uninstall dynamic wallpapers and their associated XML files for GNOME.

## Features

- Install dynamic wallpapers to `/usr/share/backgrounds/dyn-wallpapers`.
- Install XML files to `/usr/share/gnome-background-properties/`.
- Uninstall and remove the dynamic wallpapers and XML files from the system.

## Usage

### Show Help

To display the usage information and available options, run the script with the `-h` flag or without any options:

```bash
./install.sh
```

or

```bash
./install.sh -h
```

This will display the help message, which provides details about the script's options.

### Install the Wallpapers and XML Files

To install the wallpapers and XML files, use the `-i` option:

```bash
./install.sh -i
```

This will copy the contents of the `backgrounds/dyn-wallpapers` directory to `/usr/share/backgrounds/dyn-wallpapers` and the XML files from the `gnome-background-properties` directory to `/usr/share/gnome-background-properties/`.

### Uninstall the Wallpapers and XML Files

To uninstall the files and remove the `dyn-wallpapers` folder from `/usr/share/backgrounds/`, run the script with the `-u` option:

```bash
./install.sh -u
```

This will remove all XML files that were copied from the local `gnome-background-properties` folder and the `dyn-wallpapers` folder from `/usr/share/backgrounds/`.

## Script Options

- `-i` : Install the wallpapers and XML files to the system.
- `-u` : Uninstall the wallpapers and remove the `dyn-wallpapers` folder from the system.
- `-h` : Display this help message.

## Notes

- Make sure you have the necessary permissions (e.g., root or sudo) to copy files to `/usr/share/`.
- The script assumes that the `backgrounds/dyn-wallpapers` and `gnome-background-properties` directories exist and contain the appropriate files.

## Origin?

Most of these wallpapers were included in various Linux distributions I've been testing.

## Ownership

Mostly the images are from Linux distros, but I'm just not shure. If you find an image hosted in this repository that is yours and of limited use, please let me know and I will remove it.
