#!/bin/bash

echo "Updating Output.pdf"

# Temporary file to hold the concatenation
temp_file=$(mktemp)

# Iterate through all markdown files in the current directory
for file in *.md; do
    # Ensure that each file starts on a new page by appending a page break
    echo -e "\n\pagebreak\n" >> "$temp_file"
    # Concatenate the current file content to the temporary file
    cat "$file" >> "$temp_file"
done

sed -i '' -E '/!\[.*\]\(.*\)\{ width=/! s/(!\[.*\]\(.*\))/```{=latex}\n\\begin{center}\n```\n\1{ width=75% }\n```{=latex}\n\\end{center}\n```/g' "$temp_file"

# Now convert the concatenated markdown to a desired format, e.g., PDF
# Output the result to output.pdf
pandoc "$temp_file" -o output.pdf -f markdown-implicit_figures --toc --toc-depth=1

rm "$temp_file"

echo "Done!"
