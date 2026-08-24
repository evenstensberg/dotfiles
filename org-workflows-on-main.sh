#!/bin/bash

ORG="webpack"

# Colors (disabled when not writing to a terminal)
if [ -t 1 ]; then
    BOLD=$'\033[1m'; DIM=$'\033[2m'; RESET=$'\033[0m'
    GREEN=$'\033[32m'; RED=$'\033[31m'; YELLOW=$'\033[33m'; CYAN=$'\033[36m'
else
    BOLD=""; DIM=""; RESET=""; GREEN=""; RED=""; YELLOW=""; CYAN=""
fi

# Check if logged into GitHub CLI
gh auth status || exit 1

# List all repositories in the organization
repos=$(gh repo list "$ORG" --limit 100 --json name --jq '.[].name')

failed=()
ok=0

while read -r repo; do
    [ -n "$repo" ] || continue

    # Date of the last commit pushed to main
    updated=$(gh api "repos/$ORG/$repo/commits/main" 2>/dev/null | jq -r '.commit.committer.date // empty')

    # Fetch branch status; a null/empty state means no status checks -> treat as success
    state=$(gh api "repos/$ORG/$repo/commits/main/status" 2>/dev/null | jq -r '.state // empty')

    if [ -z "$state" ] || [ "$state" = "null" ]; then
        state="success"
    fi

    # 2026-08-20T14:33:02Z -> 2026-08-20 14:33 UTC
    if [ -n "$updated" ]; then
        when="${updated//T/ }"
        when="last push to main ${when%:*Z} UTC"
    else
        when="no main branch"
    fi

    case "$state" in
        success)
            ok=$((ok + 1))
            color="$GREEN"; mark="✔"
            ;;
        failure|error)
            failed+=("https://github.com/$ORG/$repo/commits/main")
            color="$RED"; mark="✖"
            ;;
        *)
            color="$YELLOW"; mark="•"
            ;;
    esac

    printf '%s%s%s %-40s %s%-8s%s %s%s%s\n' \
        "$color" "$mark" "$RESET" "$ORG/$repo" \
        "$color" "$state" "$RESET" \
        "$DIM" "$when" "$RESET"
done <<< "$repos"

echo ""
if [ ${#failed[@]} -eq 0 ]; then
    printf '%s%s✔ All %d repositories are green on main%s\n' "$BOLD" "$GREEN" "$ok" "$RESET"
else
    printf '%s%s✖ %d failing repositor%s%s\n' "$BOLD" "$RED" "${#failed[@]}" \
        "$([ ${#failed[@]} -eq 1 ] && echo y || echo ies)" "$RESET"
    for url in "${failed[@]}"; do
        printf '  %s%s%s\n' "$CYAN" "$url" "$RESET"
    done
    printf '%s%d passing%s\n' "$DIM" "$ok" "$RESET"
fi
