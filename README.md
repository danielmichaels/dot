# Personal dotfiles and scripts

These are my custom files and scripts. They are probably tightly coupled to my systems and interests.

## Setup symlinks

These are done from the top level of the directory.

```sh
# need to setup a PATH directive for scripts (done inside .zshrc)
ln -sf "$PWD/scripts" ~/.local/bin/scripts
ln -sf "$PWD/i3" ~/.config 
ln -sf "$PWD/i3status-rust" ~/.config 
# may need to mkdir -p ~/.screenlayout first
ln -sf "$PWD/default-i3.sh" ~/.screenlayout/
```
