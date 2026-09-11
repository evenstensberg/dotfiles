#!/usr/bin/env sh

FROM_REPO="webpack/security-wg"
TO_REPO="webpack/working-groups"

gh issue list -s open -L 500 --json number -R "$FROM_REPO" | \
    jq -r '.[] | .number' | \
    while read issue; do
        gh issue transfer "$issue" "$TO_REPO" -R "$FROM_REPO"
        sleep 3
    done
