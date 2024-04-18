#!/bin/bash

# Set the path to your bomb file
BOMB_FILE="./bomb"

# Set the path to your defuse file
DEFUSE_FILE="defuse.txt"

declare -A tried_combinations=();  # Initialize the associative array

for (( i1=0; i1<=9; i1++ )); do
    for (( i2=0; i2<=9; i2++ )); do
        for (( i3=0; i3<=9; i3++ )); do
            for (( i4=0; i4<=9; i4++ )); do
                for (( i5=0; i5<=9; i5++ )); do
                    for (( i6=0; i6<=9; i6++ )); do
                        # Construct the input string
                        input="$i1 $i2 $i3 $i4 $i5 $i6"

                        # Check if combination is already tried
                        if [[ -z "${tried_combinations[$input]}" ]]; then
                            # Mark this combination as tried
                            tried_combinations["$input"]=1

                            # Run the bomb file with the constructed input and defuse.txt as parameter
                            echo "Trying: $input"
                            output=$("$BOMB_FILE" "$DEFUSE_FILE" <<< "$input")

                            # Check if bomb is defused
                            if [[ "$output" == *"That's number 2.  Keep going!"* ]]; then
                                echo "Bomb defused! Combination: $input"
                                exit 0
                            fi
                        fi
                    done
                done
            done
        done
    done
done

