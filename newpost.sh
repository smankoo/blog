#!/bin/bash

# Function to sanitize the post title and convert it into a valid file name
sanitize_filename() {
    local input="$1"
    
    # Remove leading and trailing whitespace
    local sanitized=$(echo "$input" | sed 's/^[ \t]*//;s/[ \t]*$//')

    # Convert to lowercase
    sanitized=$(echo "$sanitized" | tr '[:upper:]' '[:lower:]')

    # Replace non-alphanumeric characters with hyphens
    sanitized=$(echo "$sanitized" | sed 's/[^a-z0-9]/-/g')

    # Replace multiple hyphens with a single hyphen
    sanitized=$(echo "$sanitized" | sed 's/--*/-/g')

    # Remove leading and trailing hyphens
    sanitized=$(echo "$sanitized" | sed 's/^-//;s/-$//')

    echo "$sanitized"
}

# Escape special characters for sed
escape_sed() {
    echo "$1" | sed 's/[&/\]/\\&/g'
}


# Check if command line arguments were given, if so, use them as post title
post_title="$*"

# If no command line arguments given, prompt user for post title
if [ -z "$post_title" ]; then
    read -p "Enter post title: " post_title
fi

# Sanitize post title to create a valid filename
file_name=$(sanitize_filename "$post_title")

# Display the sanitized file name
# echo "Creating new post: '${post_title}' in file '${file_name}'"

file_path="content/posts/${file_name}.md"

# Uncomment the following line to actually create the post
hugo new $file_path

if [ $? -ne 0 ]; then
    echo "Error creating post: $file_path"
    exit 1
fi
    
# Ensure the file exists before modifying
if [ -f $file_path ]; then
    # Escape the post title for safe use in sed
    escaped_post_title=$(escape_sed "$post_title")

    # Use sed to replace the title in the front matter with the actual post title
    sed -i "" "s/^title:.*/title: \"$escaped_post_title\"/" "$file_path"
fi