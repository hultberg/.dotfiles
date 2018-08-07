# Alias for ssh and mosh
alias ssh="command -v keychain > /dev/null && start-keychain -q; ssh"
alias mosh="command -v keychain > /dev/null && start-keychain -q; mosh"

KEYCHAIN_SSH_KEYS=""
KEYCHAIN_GPG_KEYS=""

# Allow to override variables over
if [[ -e "~/.keychain.keys" ]]; then
	source "~/.keychain.keys"
fi

start-keychain() {
	if command -v gpg-agent > /dev/null; then
		eval $(keychain --eval --agents gpg,ssh "$@" $KEYCHAIN_SSH_KEYS $KEYCHAIN_GPG_KEYS)
	else
		eval $(keychain --eval --agents ssh "$@" $KEYCHAIN_SSH_KEYS $KEYCHAIN_GPG_KEYS)
	fi
}

stop-keychain() {
	keychain --stop all
}

