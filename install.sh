#!/bin/bash
# Simple install - just symlinks files to home

cd "$(dirname "$0")"

# Backup existing
[ -f "$HOME/.bashrc" ] && cp "$HOME/.bashrc" "$HOME/.bashrc.backup.$(date +%s)"

# Symlink configs
ln -sf "$(pwd)/.bashrc" "$HOME/.bashrc"

# Setup bin
mkdir -p "$HOME/bin"
ln -sf "$(pwd)/bin/elevate-opencode.sh" "$HOME/bin/"

echo "Installed. Run: source ~/.bashrc"
