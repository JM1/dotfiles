# 2021-2022 Jakob Meng, <jakobmeng@web.de>
# vim:set fileformat=unix tabstop=8 shiftwidth=4 expandtab autoindent:
# kate: end-of-line unix; space-indent on; indent-width 4;

alias ssh_ephemeral_known_hosts='ssh -o "UserKnownHostsFile=/dev/null"'
alias ssh_no_known_hosts_file='ssh -o "UserKnownHostsFile=/dev/null" -o "StrictHostKeyChecking=no"'
alias scp_no_known_hosts_file='scp -o "UserKnownHostsFile=/dev/null" -o "StrictHostKeyChecking=no"'
alias ssh_force_password='ssh -o PreferredAuthentications=password -o PubkeyAuthentication=no'

# Print hexadecimal fingerprint of SSH server
# Ref.: https://unix.stackexchange.com/questions/126908/get-ssh-server-key-fingerprint
alias ssh_fingerprint='nmap -p T:22 --script ssh-hostkey'

# SSH for remote decryption of encrypted root filesystems via dropbear
alias ssh_initramfs='ssh -o UserKnownHostsFile=~/.ssh/known_hosts.initramfs'
