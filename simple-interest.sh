#!/usr/bin/env bash
# Calculate simple interest using an annual percentage rate and time in years.
set -euo pipefail

read_number() {
    local prompt="$1" value
    printf '%s' "$prompt" >&2
    if ! IFS= read -r value; then
        printf 'Error: input is required.\n' >&2
        return 1
    fi
    if [[ ! "$value" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
        printf 'Error: enter a nonnegative number.\n' >&2
        return 1
    fi
    printf '%s' "$value"
}

principal=$(read_number 'Enter the principal amount: ')
rate=$(read_number 'Enter the annual rate of interest (percent): ')
time=$(read_number 'Enter the time period in years: ')

awk -v p="$principal" -v r="$rate" -v t="$time" \
    'BEGIN { printf "The simple interest is: %.2f\n", p * r * t / 100 }'
