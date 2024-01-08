#!/bin/bash
# Author : user
# OS : Debian 12 x86_64
# Date : 08-Jan-2024
# Project Name : timer


handle_any(){

    if [ -n "$pid" ]; then
        kill "-$1" $pid
        wait $pid
        status_code=$?
        finish_time=$(date +%s.%N)
        execute_time=$(echo "$finish_time - $start_time" | bc -l)    
        print_result $status_code $execute_time         
        exit $?
    fi
}

print_result(){
    if [ "$#" -ne 2 ]; then
        {>&2 echo "Error : Few arguments to print_result() function."; return 2;}
    fi
  
    local status_code=$1
    local execute_time=$2

    # Get the number of columns in the terminal
    col=$(tput cols)

    # Construct the pattern
    pattern=""

    for ((i = 0; i < col; i++)); do
        pattern+="═"
    done
    if [ $status_code -eq 0 ]; then
        color="32m"
    else
        color="31m" 
    fi

    # Print the pattern
    echo ""
    echo -e "\033[$color$pattern\033[m"
    echo -e " status code :\033[1;$color $status_code\033[m "
    echo -e "  executed in \033[1m$execute_time s\033[m"
    echo -e "\033[$color$pattern\033[m"
    return 0

}

if [ $# -eq 0 ]; then
    exit 0
fi
trap 'handle_any 2' SIGINT
trap 'handle_any 15' SIGTERM
start_time=$(date +%s.%N)
(setsid $@) &
pid=$!
wait $pid
status_code=$?
finish_time=$(date +%s.%N)
execute_time=$(echo "$finish_time - $start_time" | bc -l)    

print_result $status_code $execute_time || exit $?




