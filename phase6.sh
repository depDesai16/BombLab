#!/bin/bash

# Path to your bomb file
BOMB_FILE="./bomb"

# Path to your defuse.txt file
DEFUSE_FILE="defuse.txt"

# Brute-force loop
for (( i1=0; i1<=6; i1++ )); do
    for (( i2=0; i2<=6; i2++ )); do
        for (( i3=0; i3<=6; i3++ )); do
            for (( i4=0; i4<=6; i4++ )); do
                for (( i5=0; i5<=6; i5++ )); do
                    for (( i6=0; i6<=6; i6++ )); do
                        # Construct the input string
                        input="$i1 $i2 $i3 $i4 $i5 $i6"

                        # Run the bomb file with the constructed input and defuse.txt as parameter
                        echo "Trying: $input"
                        output=$("$BOMB_FILE" "$DEFUSE_FILE" <<< "$input")

                        # Check if bomb is defused
                        if [[ "$output" == *"Congratulations! You've defused the bomb!"* ]]; then
                            echo "Bomb defused! Combination: $input"
                            exit 0
                        fi
                    done
                done
            done
        done
    done
done

echo "Failed to defuse the bomb."
