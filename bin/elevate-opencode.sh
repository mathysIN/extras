#!/bin/bash
# Run opencode with root while keeping your environment

cd "${1:-$(pwd)}" && sudo -E bash -c "export HOME=$HOME; export USER=$USER; exec opencode"
