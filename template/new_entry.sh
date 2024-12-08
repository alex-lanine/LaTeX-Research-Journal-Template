#!/bin/bash

# Get the current date in yymmdd format
current_date=$(date +%y%m%d)

# Get the current date in a human-readable format (e.g., June 14, 2024)
human_date=$(date +"%B %d, %Y")

# Define the directory where the new file will be created
content_dir="content"

# Define the new file name
new_file="${content_dir}/${current_date}.tex"

# Define the journal file name
journal_file="researchlog.tex"

# Check if the file already exists
if [ -e "$new_file" ]; then
    echo "File ${new_file} already exists."
    exit 1
fi

# Create the new .tex file with boilerplate LaTeX code
cat <<EOT > "$new_file"
\chapter*{${human_date}}
\addcontentsline{toc}{chapter}{${human_date}}


EOT

echo "New entry created: ${new_file}"

# Open the new .tex file in VS Code
code "$new_file"

# Add the new \input{} line directly above %end of entries
tmp_file=$(mktemp)

awk -v new_input="\\\\input{content/${current_date}}" '
/%end of entries/ {
    print new_input  # Insert the new line above %end of entries
}
{ print }
' "$journal_file" > "$tmp_file"

# Overwrite the original journal file with the updated one
mv "$tmp_file" "$journal_file"

echo "Updated ${journal_file} with new input line."
