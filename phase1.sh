#!/bin/bash

# Function to check if the output contains the target phrase
check_output() {
    if [[ "$1" == *"Phase 1 defused. How about the next one?"* ]]; then
        return 0
    else
        return 1
    fi
}

# Main function to brute-force each line from strings bomb output
brute_force() {
    local strings_output=$(strings bomb)
    
    while IFS= read -r line; do
        # Skip empty lines
        if [[ -z "$line" ]]; then
            continue
        fi
        
        echo "Trying: $line"
        output=$(echo "$line" | ./bomb)
        
        if check_output "$output"; then
            echo "Bomb defused! Input line: $line"
            exit 0
        fi
    done <<< "$strings_output"
    
    echo "Failed to defuse the bomb."
}

# Call the brute_force function
brute_force

