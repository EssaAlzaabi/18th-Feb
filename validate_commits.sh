#!/bin/bash

# Script to validate commit messages

# Regex pattern for commit messages
pattern='^\[ISSUE-[0-9]+\] .+$'

if [[ "$1" =~ $pattern ]] ; then
    echo "Valid commit message"
    exit 0
else
    echo "Invalid commit message. Format: [ISSUE-<number>] <message>"
    exit 1
fi
