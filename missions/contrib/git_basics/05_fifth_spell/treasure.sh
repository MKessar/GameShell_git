#!/bin/bash

# Initial and final grade
grade=4
final_grade=15

# ANSI color codes
RED="\033[31m"
YELLOW="\033[33m"
GREEN="\033[32m"
RESET="\033[0m"

# Function to generate a random spark line of given length
spark_line() {
    length=$1
    line=""
    for i in $(seq 1 $length); do
        r=$((RANDOM % 6))
        if [ $r -eq 0 ]; then
            line="${line}*"
        elif [ $r -eq 1 ]; then
            line="${line}+"
        elif [ $r -eq 2 ]; then
            line="${line}o"
        elif [ $r -eq 3 ]; then
            line="${line}~"
        else
            line="${line} "
        fi
    done
    echo "$line"
}

# Function to get color for grade
grade_color() {
    if [ $1 -lt 7 ]; then
        echo -e "$RED"
    elif [ $1 -le 12 ]; then
        echo -e "$YELLOW"
    else
        echo -e "$GREEN"
    fi
}

# Function to draw the bigger scroll with sparks around the grade
draw_scroll() {
    clear

    scroll_width=50
    spark_width=$((scroll_width - 4))

    echo "    _________________________________________________"
    echo "   /                                                 \\"
    echo "  /          Spell Writing Class Test                \\"
    echo " |                                                   |"
    echo " |                                                   |"

    # Sparks above the grade
    echo " |  $(spark_line $spark_width)   |"

    # The grade line with sparks on both sides
    side_spark_left=$(spark_line $(( (spark_width-5)/2 )) )
    side_spark_right=$(spark_line $(( (spark_width-5)/2 )) )
    color=$(grade_color $grade)
    printf " |  %s %b%2d/20%b %s  |\n" "$side_spark_left" "$color" "$grade" "$RESET" "$side_spark_right"

    # Sparks below the grade
    echo " |  $(spark_line $spark_width)   |"

    # Extra empty lines for bigger scroll
    for i in {1..4}; do
        echo " |                                                   |"
    done

    echo " \\___________________________________________________/"
}

# Animation: increase the grade
while [ $grade -le $final_grade ]; do
    draw_scroll
    grade=$((grade + 1))
    sleep 0.3
done

# Final display
clear
echo "    ______________________________________________"
echo "   /                                              \\"
echo "  /             Spell Writing Class Test          \\"
echo " |                                                |"
echo " |                                                |"
echo " |                                                |"
echo " |                                                |"
echo " |                                                |"
echo " |                                                |"
final_color=$(grade_color $final_grade)
echo -e " |                  ${final_color}$final_grade/20${RESET}                         |"
echo " |                                                |"
echo " \\________________________________________________/"

