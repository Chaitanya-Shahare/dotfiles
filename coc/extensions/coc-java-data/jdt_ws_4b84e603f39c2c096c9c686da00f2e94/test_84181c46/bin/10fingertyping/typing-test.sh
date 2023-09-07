#!/bin/bash

# Check if ncurses and gnuplot are installed
command -v tput > /dev/null || { echo "Please install ncurses by running 'sudo apt install ncurses-bin' or equivalent."; exit 1; }
command -v gnuplot > /dev/null || { echo "Please install gnuplot by running 'sudo apt install gnuplot' or equivalent."; exit 1; }

# Variables
TEST_DURATION=30
WORD_LIST=("apple" "banana" "cat" "dog" "elephant" "fish" "grape" "hat" "ice cream" "jungle")
line_count=5
line_length=10
current_line=0
current_char=0
total_words_typed=0
correct_words_typed=0
incorrect_words_typed=0
total_chars_typed=0
correct_chars_typed=0
incorrect_chars_typed=0
start_time=0
end_time=0
wpm_history=()

# Generate random lines
function generate_lines() {
  lines=()
  for ((i=0; i<line_count; i++)); do
    line=""
    for ((j=0; j<line_length; j++)); do
      word_index=$((RANDOM % ${#WORD_LIST[@]}))
      line+=" ${WORD_LIST[word_index]}"
    done
    lines+=("${line# }")
  done
}

# Display lines
function display_lines() {
  tput clear
  tput cup 0 0

  for line in "${lines[@]}"; do
    echo "$line"
  done
}

# Display cursor
function display_cursor() {
  tput cup $((current_line + 2)) $((current_char + 1))
}

# Update cursor position
function update_cursor() {
  if ((current_char >= line_length)); then
    current_char=0
    ((current_line++))

    if ((current_line == line_count)); then
      current_line=0
      generate_lines
    fi

    display_lines
  fi

  display_cursor
}

# Draw graph
function draw_graph() {
  local data_file="wpm_data.txt"
  echo -e "Time\tWPM" > "$data_file"

  local time_elapsed=0
  for ((i=0; i<${#wpm_history[@]}; i++)); do
    echo -e "$time_elapsed\t${wpm_history[i]}" >> "$data_file"
    time_elapsed=$((time_elapsed + 1))
  done

  gnuplot -e "set term dumb; set title 'WPM vs Time'; set xlabel 'Time (s)'; set ylabel 'WPM'; plot '$data_file' with lines notitle"
  rm "$data_file"
}

# Calculate words per minute
function calculate_wpm() {
  local time_elapsed=$((end_time - start_time))
  local wpm=$((correct_words_typed * 60 / time_elapsed))
  wpm_history+=($wpm)
}

# Display test statistics
function display_statistics() {
  local total_words_typed=$((correct_words_typed + incorrect_words_typed))
  local average_wpm=$((total_words_typed * 60 / TEST_DURATION))

  tput cup 0 0
  echo "Time Left: $((TEST_DURATION - end_time + start_time)) seconds"

  tput cup 0 $((line_length + 10))
  echo "Average WPM: $average_wpm"

  tput cup $((line_count + 5)) 0
  draw_graph
}

# Main function
function main() {
  tput clear
  tput civis    # Hide cursor
  tput smcup    # Save screen state

  generate_lines
  display_lines
  display_statistics

  start_time=$(date +%s)

  while true; do
    read -rsn1 key

    if [[ $key == $'\e' ]]; then    # Escape key pressed, end the test
      end_time=$(date +%s)
      calculate_wpm
      display_statistics
      break
    elif [[ $key == "${lines[current_line]:current_char:1}" ]]; then    # Correct key pressed
      tput setaf 2    # Set text color to green
      ((correct_chars_typed++))
      ((correct_words_typed += current_char == line_length - 1))
    else    # Incorrect key pressed
      tput setaf 1    # Set text color to red
      ((incorrect_chars_typed++))
      ((incorrect_words_typed += current_char == line_length - 1))
    fi

    tput cup $((current_line + 2)) $((current_char + 1))
    echo -n "${lines[current_line]:current_char:1}"

    ((current_char++))
    ((total_chars_typed++))
    ((total_words_typed += current_char == line_length))

    update_cursor
  done

  tput cnorm    # Restore cursor visibility
  tput rmcup    # Restore saved screen state
  tput reset    # Reset terminal
}

main
