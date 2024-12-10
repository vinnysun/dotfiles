#!/usr/bin/bash

set +ex

if [ -z "$HOME" ]; then
  echo "\$HOME is not set: $HOME"
  exit 1
fi

# thanks chatgpt
BACKUP="$HOME/.dotfiles_backup"
mkdir -p $BACKUP

files=$(find -maxdepth 1 -type f -name ".*")
for file in $files; do
  echo $file
  base=$(basename "$file")
  if [ "$base" = "." ] || [ "base" = ".." ]; then
    continue
  fi

  dest="$HOME/$base"
  if [ -e "$dest" ] && [ ! -L "$dest" ]; then
    echo "moving $dest to $BACKUP"
    mv "$dest" "$BACKUP"
  fi

  ln -sf "$PWD/$base" "$dest"
done


