#!/bin/bash

# Path to your bomb file
BOMB_FILE="./bomb"

# Path to your defuse.txt file
DEFUSE_FILE="defuse.txt"

# Brute-force loop
for (( i1=0; i1<=20; i1++ )); do
    for (( i2=0; i2<=20; i2++ )); do
        # Construct the input string
        input="$i1 $i2"

        # Run the bomb file with the constructed input and defuse.txt as parameter
        echo "Trying: $input"
        output=$("$BOMB_FILE" "$DEFUSE_FILE" <<< "$input")

        # Check if bomb is defused
        if [[ "$output" == *"Wow! You've defused the secret stage!"* ]]; then
            echo "Bomb defused! Combination: $input"
            exit 0
        fi
    done
done

echo "Failed to defuse the bomb."

