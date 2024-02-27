#!/usr/bin/env bash

# (The absolute path to the program is provided as the first and only argument.)
CALCULATOR=$1

# Test 06: Ensure program errors with an invalid operand
# Would a broader, more comprehensive version of this use regex to test for all (in)valid inputs?
declare -a ops=("+", "-", "*", "/")
for op in "${ops[@]}"; do 
    if ! (($CALCULATOR 1 "$op" 2)); then
        echo "ERROR! A valid run of the application with a valid operator and numbers failed"
        exit 1
    fi
done

# Test 07: Non-numeric inputs and missing operands
declare -a inputs=("a + b", "1 +", "+ 1", "1 -", "- 1","1 /", "/ 1", "1 *", "* 1")
for input in "${inputs[@]}"; do
    if $CALCULATOR $input; then
        echo "ERROR! Invalid input '$input' shouldn't succeed"
        exit 1
    fi
done

# Test 08: Addition, Subtraction, Multiplication, Division with a range of numbers
for i in {-50..50}; do
    for j in {-50..-1}{1..50}; do # Excludes 0 just in case, since dividing by 0 with the given calculator should give an error but it gives a 0
        if [[$(($CALCULATOR $i + $j)) -ne $((i + j))]]; then
            echo "ERROR! Addition of $i + $j failed to produce the expected result of $((i + j))!"
            exit 1
        fi
        if [[$(($CALCULATOR $i - $j)) -ne $((i - j))]]; then
            echo "ERROR! Subtraction of $i - $j failed to produce the expected result of $((i - j))!"
            exit 1
        fi
        if [[$(($CALCULATOR $i * $j)) -ne $((i * j))]]; then
            echo "ERROR! Multiplication of $i * $j failed to produce the expected result of $((i - j))!"
            exit 1
        fi
        if [[$(($CALCULATOR $i / $j)) -ne $((i / j))]]; then
            echo "ERROR! Division of $i / $j failed to produce the expected result of $((i - j))!"
            exit 1
        fi
    done
done
