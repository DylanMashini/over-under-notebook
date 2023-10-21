#!/bin/bash

# Temporary file to hold the concatenation
temp_file=$(mktemp)

# Iterate through all markdown files in the current directory
for file in *.md; do
    # Ensure that each file starts on a new page by appending a page break
    echo -e "\n\pagebreak\n" >> "$temp_file"
    # Concatenate the current file content to the temporary file
    cat "$file" >> "$temp_file"
done

# Now convert the concatenated markdown to a desired format, e.g., PDF
# Output the result to output.pdf
pandoc "$temp_file" -o output.pdf -f markdown-implicit_figures --toc --toc-depth=1

# Remove the temporary file
rm "$temp_file"
