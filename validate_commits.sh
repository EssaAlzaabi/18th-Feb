#!/bin/bash

# Get the last 5 commits
commits=$(git log -n 5 --pretty=format:"%s")

# Expected commit message format (example: JIRA-123: Commit message)
format_regex="^JIRA-[0-9]+: .+"

# Validate each commit message
invalid_commits=()
for commit in $commits; do
    if [[ ! $commit =~ $format_regex ]]; then
        invalid_commits+=('$commit')
    fi
done

# Print results
if [ ${#invalid_commits[@]} -eq 0 ]; then
    echo "All commit messages are valid."
else
    echo "Invalid commit messages:";
    for invalid in ${invalid_commits[@]}; do
        echo "- $invalid"
    done
fi
