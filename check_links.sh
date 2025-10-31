#!/bin/bash

# Directory to start the search
root_dir="$1"

if [ -z "$root_dir" ]; then
  echo "Usage: $0 <root_directory>"
  exit 1
fi

# Find all markdown files in the directory tree
md_files=$(find "$root_dir" -type f -name '*.md')

# Function to check for broken links
check_links() {
  local file="$1"

  # Refined regex to capture correct markdown links with .md inside balanced parentheses
  links=$(grep -oP '(?<=\()([^\)\s]+\.md)(?=\))' "$file" | grep -vE '^(https?|mailto)://')
  ref_links=$(grep -oP '^\[[^]]+\]:\s*([^[:space:]]+\.md)' "$file" | awk -F': ' '{print $2}')

  # Combine and get unique links
  links_all=$(echo -e "$links\n$ref_links" | sort | uniq)

  # Check existence of each link relative to the markdown file directory
  while read -r link; do
      # Skip if link is empty or whitespace only
    if [[ -z "$link" || "$link" =~ ^[[:space:]]+$ ]]; then
      continue
    fi
    
    dir=$(dirname "$file")
    target_path=$(realpath -m "$dir/$link")

    if [ ! -f "$target_path" ]; then
      echo "Broken link in $file: $link"
    fi
  done <<< "$links_all"
}

# Iterate over all markdown files and check links
for md in $md_files; do
  check_links "$md"
done

