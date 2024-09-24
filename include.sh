#!/bin/sh
#
# Author: Shiro Yami
#
# Example: ./include.sh placeholder parent.html child.html output.html


function include() {
    local placeholder="$1"
    local parent="$2"
    local child="$3"
    local output="$4"

    local content=$(<"$parent")
    local child_content=$(<"$child")

    local escaped_content=$(printf '%s\n' "$content" | sed 's/[\/&]/\\&/g')
    local escaped_child_content=$(printf '%s\n' "$child_content" | sed 's/[\/&]/\\&/g')

    # Replace the placeholder in the parent content with the child contentn
    sed -e "s|{{ $placeholder }}|$escaped_child_content|g" "$parent" > "$output"
    

}



PLACEHOLDER="$1"
PARENT="$2"
CHILD="$3"
OUTPUT="$4"

include "$PLACEHOLDER" "$PARENT" "$CHILD" "$OUTPUT"