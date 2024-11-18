shared_hook_file="$HOME/.zsh_hook"

# update hook file permission
if [ ! -f "$shared_hook_file" ]; then
    touch "$shared_hook_file"
fi
chmod 600 "$shared_hook_file"

# update $SSH_AUTH_SOCK
if [[ -n "$SSH_AUTH_SOCK" ]]; then
    tmp="$(cat "$shared_hook_file" | grep -v "export SSH_AUTH_SOCK=")"
    echo "export SSH_AUTH_SOCK=$SSH_AUTH_SOCK" > "$shared_hook_file"
    echo "$tmp" >> "$shared_hook_file"
fi
