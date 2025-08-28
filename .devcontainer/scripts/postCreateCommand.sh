#!/bin/sh
set -e

usage=$'create new project usage
nest new [Project Name] --directory .
NOTE: you should set "--directory . " create project files in current directory "workspaces" in this conatiner.
'

if [ -f package.json ] ; then
  npm install;
else
  echo "$usage"
fi

# 自動將歡迎訊息加入 /home/node/.bashrc（僅加入一次）
WELCOME_SNIPPET='source /workspace/.devcontainer/scripts/welcome_message.sh'
BASHRC=/home/node/.bashrc
if ! grep -Fxq "$WELCOME_SNIPPET" "$BASHRC"; then
  echo "$WELCOME_SNIPPET" >> "$BASHRC"
fi
