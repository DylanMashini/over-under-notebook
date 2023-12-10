#!/bin/bash

echo "Updating Output.pdf"

# Temporary file to hold the concatenation
temp_file=$(mktemp)

# echo -e "---\noutput:\n pdf_document:\n	includes:\n	    before_body: CoverPage.tex\n---\n\`{=latex}\includepdf{CoverPage.pdf}\`" >> "$temp_file"
echo -e "---" >> "$temp_file"
echo -e "header-includes: |" >> "$temp_file"
echo -e "    \usepackage{pdfpages}" >> "$temp_file"
echo -e "toc: true\n" >> "$temp_file"
echo -e "include-before: \includepdf{./CoverPage.pdf}" >> "$temp_file"
echo -e "---\n" >> "$temp_file"


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

rm "$temp_file"

echo "Done!"
