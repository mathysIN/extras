#!/bin/bash
# Install - sources extras instead of replacing .bashrc

cd "$(dirname "$0")"

# Copy extras file
cp "$(pwd)/.bashrc_extras" "$HOME/.bashrc_extras"

# Add source line to existing .bashrc if not already there
if ! grep -q "source ~/.bashrc_extras" "$HOME/.bashrc" 2>/dev/null; then
    echo "" >> "$HOME/.bashrc"
    echo "# Load extras from dotfiles repo" >> "$HOME/.bashrc"
    echo "source ~/.bashrc_extras" >> "$HOME/.bashrc"
fi

# Setup bin
mkdir -p "$HOME/bin"
ln -sf "$(pwd)/bin/elevate-opencode.sh" "$HOME/bin/"

# Setup opencode config
mkdir -p "$HOME/.config/opencode"
cp "$(pwd)/AGENTS.md" "$HOME/.config/opencode/"

echo "Installed. Run: source ~/.bashrc"
