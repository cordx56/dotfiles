git config --global init.defaultBranch main
## user
git config --global user.email "cordx56@cordx.cx"
git config --global user.name "CHISEN Kaoru"
git config --global user.signingkey "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDMWey4e7S7JyB3Id/R0GmWsm28hti/91+ve82MgOXVn"
## signing
git config --global commit.gpgsign true
git config --global gpg.format ssh
## alias
git config --global alias.s status
git config --global alias.b branch
git config --global alias.w switch
git config --global alias.r "restore --staged"
git config --global alias.d diff
git config --global alias.a add
git config --global alias.c commit
git config --global alias.l "log --all --graph --decorate --pretty=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%ai%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an <%ae>%C(reset)'"
