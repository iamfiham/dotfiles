#!/bin/bash

DOTFILES_DIR="$HOME/.dotfiles"
BRANCH=main

# Go to dotfiles directory
cd "$DOTFILES_DIR" || {
    echo "[ERROR] Dotfiles directory not found at $DOTFILES_DIR"
    exit 1
}

# Show git status
echo -e "\n[INFO] Git status:"
git status

# Add all changes
echo -e "\n[INFO] Staging files..."
git add .

# Commit with user message
echo -e "\n[INFO] Commiting files..."
read -rp "Enter commit message: " COMMIT_MSG

if ! git commit -m "$COMMIT_MSG"; then
    echo -e "\n[WARNING] Nothing to commit or commit failed."
fi

# Push to remote
echo -e "\n[INFO] Pushing to origin/$BRANCH..."
if git push origin "$BRANCH"; then
    echo -e "\n[SUCCESS] Dotfiles pushed to GitHub."
else
    echo -e "\n[ERROR] Git push failed. Check your network or authentication."
    exit 1
fi
