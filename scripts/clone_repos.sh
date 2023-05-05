#!/bin/bash
# ©2023 JFTF
# JFTF-Dev organization repository clone script
# Prerequisites
# Ubuntu 22.04+
# Version 1.0

ORG="Java-Functional-Testing-Framework"

# Get a list of all repositories in the organization
REPO_LIST=$(curl -s "https://api.github.com/orgs/$ORG/repos?per_page=1000" | grep -o 'git@[^"]*')

# Print the list of repositories
echo "Cloning the following repositories from $ORG:"
echo "$REPO_LIST"

# Loop through each repository and clone it if it doesn't already exist
for REPO in $REPO_LIST
do
    REPO_NAME=$(echo "$REPO" | cut -d "/" -f 2 | cut -d "." -f 1)
    if [ "$REPO_NAME" != "JFTF-Dev" ] && [ ! -d "../../$REPO_NAME" ]; then
        echo "Cloning $REPO"
        git clone $REPO "../../$REPO_NAME"
    fi
done

