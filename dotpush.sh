#!/bin/bash

DOTFILES_DIR="$HOME/.dotfiles"
BRANCH=main

# colors
BG_COLOR="\033[48;2;52;204;252m"
FG_BLACK="\033[01;30m"

RESET="\033[00m"

# Go to dotfiles directory
cd "$DOTFILES_DIR" || {
    echo -e "\n${BG_COLOR}${FG_BLACK}[ERROR]${RESET} Dotfiles directory not found at $DOTFILES_DIR"
    exit 1
}

# Show git status
echo -e "\n${BG_COLOR}${FG_BLACK}[INFO]${RESET} Git status:"
git status

# Add all changes
echo -e "\n${BG_COLOR}${FG_BLACK}[INFO]${RESET} Staging files..."
git add .

# Commit with user message
echo -e "\n${BG_COLOR}${FG_BLACK}[INFO]${RESET} Commiting files..."
read -rp "Enter commit message: " COMMIT_MSG

if ! git commit -m "$COMMIT_MSG"; then
    echo -e "\n${BG_COLOR}${FG_BLACK}[WARNING]${RESET} Nothing to commit or commit failed."
fi

# Push to remote
echo -e "\n${BG_COLOR}${FG_BLACK}[INFO]${RESET} Pushing to origin/$BRANCH..."

if git push origin "$BRANCH"; then
    echo -e "\n${BG_COLOR}${FG_BLACK}[SUCCESS]${RESET} Dotfiles pushed to GitHub.\n"
else
    echo -e "\n${BG_COLOR}${FG_BLACK}[ERROR]${RESET} Git push failed.\n"
    exit 1
fi
