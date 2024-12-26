#!/bin/bash

# Function to create symlinks
create_symlinks() {
    # Base directory containing add-ons with bin and lib folders
    ADDONS_BASE_DIR="/userdata/system/add-ons"

    # Loop through each subdirectory in the add-ons base directory
    for addon_dir in "$ADDONS_BASE_DIR"/*; do
        # Check if this is a directory and contains a 'bin' folder
        if [ -d "$addon_dir/bin" ]; then
            echo "Found bin folder in: $addon_dir"

            # Loop through all executables in the bin folder
            for bin_file in "$addon_dir/bin"/*; do
                if [ -f "$bin_file" ] && [ -x "$bin_file" ]; then
                    # Create a symlink in /usr/bin if it doesn't already exist
                    symlink_target="/usr/bin/$(basename "$bin_file")"
                    if [ ! -L "$symlink_target" ]; then
                        echo "Creating symlink: $symlink_target -> $bin_file"
                        ln -s "$bin_file" "$symlink_target"
                    else
                        echo "Symlink already exists: $symlink_target. Skipping."
                    fi
                fi
            done
        fi

        # Check if this is a directory and contains a 'lib' folder
        if [ -d "$addon_dir/lib" ]; then
            echo "Found lib folder in: $addon_dir"

            # Loop through all files in the lib folder
            for lib_file in "$addon_dir/lib"/*; do
                if [ -f "$lib_file" ]; then
                    # Create a symlink in /usr/lib if it doesn't already exist
                    symlink_target="/usr/lib/$(basename "$lib_file")"
                    if [ ! -L "$symlink_target" ]; then
                        echo "Creating symlink: $symlink_target -> $lib_file"
                        ln -s "$lib_file" "$symlink_target"
                    else
                        echo "Symlink already exists: $symlink_target. Skipping."
                    fi
                fi
            done
        fi
    done

    echo "Symlink creation completed!"
}

# Function to remove symlinks
remove_symlinks() {
    # Base directory containing add-ons with bin and lib folders
    ADDONS_BASE_DIR="/userdata/system/add-ons"

    # Loop through each subdirectory in the add-ons base directory
    for addon_dir in "$ADDONS_BASE_DIR"/*; do
        # Check if this is a directory and contains a 'bin' folder
        if [ -d "$addon_dir/bin" ]; then
            echo "Found bin folder in: $addon_dir"

            # Loop through all executables in the bin folder
            for bin_file in "$addon_dir/bin"/*; do
                if [ -f "$bin_file" ] && [ -x "$bin_file" ]; then
                    # Remove the symlink from /usr/bin if it exists
                    symlink_target="/usr/bin/$(basename "$bin_file")"
                    if [ -L "$symlink_target" ]; then
                        echo "Removing symlink: $symlink_target"
                        rm "$symlink_target"
                    else
                        echo "Symlink does not exist: $symlink_target. Skipping."
                    fi
                fi
            done
        fi

        # Check if this is a directory and contains a 'lib' folder
        if [ -d "$addon_dir/lib" ]; then
            echo "Found lib folder in: $addon_dir"

            # Loop through all files in the lib folder
            for lib_file in "$addon_dir/lib"/*; do
                if [ -f "$lib_file" ]; then
                    # Remove the symlink from /usr/lib if it exists
                    symlink_target="/usr/lib/$(basename "$lib_file")"
                    if [ -L "$symlink_target" ]; then
                        echo "Removing symlink: $symlink_target"
                        rm "$symlink_target"
                    else
                        echo "Symlink does not exist: $symlink_target. Skipping."
                    fi
                fi
            done
        fi
    done

    echo "Symlink removal completed!"
}

# Function to check the status of symlinks
check_status() {
    # Base directory containing add-ons with bin and lib folders
    ADDONS_BASE_DIR="/userdata/system/add-ons"

    echo "Checking the status of symlinks..."

    # Loop through each subdirectory in the add-ons base directory
    for addon_dir in "$ADDONS_BASE_DIR"/*; do
        # Check if this is a directory and contains a 'bin' folder
        if [ -d "$addon_dir/bin" ]; then
            echo "Found bin folder in: $addon_dir"

            # Loop through all executables in the bin folder
            for bin_file in "$addon_dir/bin"/*; do
                if [ -f "$bin_file" ] && [ -x "$bin_file" ]; then
                    # Check if the symlink exists
                    symlink_target="/usr/bin/$(basename "$bin_file")"
                    if [ -L "$symlink_target" ]; then
                        echo "Symlink exists: $symlink_target"
                    else
                        echo "Symlink does not exist: $symlink_target"
                    fi
                fi
            done
        fi

        # Check if this is a directory and contains a 'lib' folder
        if [ -d "$addon_dir/lib" ]; then
            echo "Found lib folder in: $addon_dir"

            # Loop through all files in the lib folder
            for lib_file in "$addon_dir/lib"/*; do
                if [ -f "$lib_file" ]; then
                    # Check if the symlink exists
                    symlink_target="/usr/lib/$(basename "$lib_file")"
                    if [ -L "$symlink_target" ]; then
                        echo "Symlink exists: $symlink_target"
                    else
                        echo "Symlink does not exist: $symlink_target"
                    fi
                fi
            done
        fi
    done
}

# Infinite loop to keep the service running
while true; do
    case "$1" in
        start)
            echo "Starting symlink creation..."
            create_symlinks
            ;;
        stop)
            echo "Stopping symlink creation..."
            remove_symlinks
            ;;
        status)
            echo "Checking status of symlinks..."
            check_status
            ;;
        *)
            echo "Usage: $0 {start|stop|status}"
            exit 1
            ;;
    esac

    # Sleep for a certain period before the next check (e.g., 60 seconds)
    sleep 10
done
