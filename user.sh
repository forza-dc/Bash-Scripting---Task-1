#!/bin/bash

log_file="auth.log"
output_file="invalid_user.sh"

# Extract invalid user names and count occurrences
invalid_users=$(grep -oP "Invalid user \K\S+" "$log_file" | sort | uniq -c)

# Generate the shell script content
script_content="#!/bin/bash\n\n"
script_content+="invalid_users=\$(cat <<EOF\n$invalid_users\nEOF\n)\n\n"
script_content+="echo -e \"Invalid User Statistics:\\n\$invalid_users\""

# Save the script content to the output file
echo -e "$script_content" > "$output_file"