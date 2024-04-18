#!/bin/bash

# Define the mappings from characters to numbers
declare -A mappings=(
    ["m"]=0 ["a"]=1 ["d"]=2 ["u"]=3 ["i"]=4 ["e"]=5 ["r"]=6 ["s"]=7
    ["n"]=8 ["f"]=9 ["o"]=10 ["t"]=11 ["v"]=12 ["b"]=13 ["y"]=14 ["l"]=15
)

# Define the target value
target="bruins"

echo "Target: $target"

# Convert target characters to numbers based on mappings
numbers=()
for (( i=0; i<${#target}; i++ )); do
    char="${target:$i:1}"
    number="${mappings[$char]}"
    if [ -z "$number" ]; then
        echo "Character $char not found in mappings."
        exit 1
    fi
    numbers+=("$number")
done

echo "Sequence of numbers: ${numbers[*]}"

# Define the mappings from numbers to characters
alphabet="0abcdefghijklmnopqrstuvwxyz"

# Convert numbers to characters
correct_input=""
for number in "${numbers[@]}"; do
    char="${alphabet:$(($number)):1}"
    if [ -z "$char" ]; then
        echo "Number $number does not correspond to any character."
        exit 1
    fi
    correct_input+="$char"
done

echo "Correct input: $correct_input"

