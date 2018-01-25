for file in ~/.{extra,bashrc,bash_prompt,exports,aliases,functions}; do
    [ -r "$file" ] && source "$file"
done
unset file