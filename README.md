# Personal dotfiles and scripts

> [!WARNING]  
> This is deprecated in favour of [dotfiles](https://github.com/danielmichaels/dotfiles) which uses [chezmoi](https://chezmoi.io) to manage dotfiles.

These are my custom files and scripts. They are probably tightly coupled to my systems and interests.

## Requirements

- [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)
- [vim-plug](https://github.com/junegunn/vim-plug)
- [zsh-autosuggestions & zsh-syntax-hightlighter](https://gist.github.com/dogrocker/1efb8fd9427779c827058f873b94df95)
- [i3](https://i3wm.org)
- [i3status-rust](https://github.com/greshake/i3status-rust)

## Setup symlinks

These are done from the top level of the directory.

**Note**

Running `setup` will execute the following commands. Must be run from the root of this directory.

```sh
ln -sf "$PWD/.zshrc" ~/
ln -sf "$PWD/.vimrc" ~/
# need to setup a PATH directive for scripts (done inside .zshrc)
ln -sf "$PWD/scripts" ~/.local/bin/scripts
ln -sf "$PWD/i3" ~/.config 
ln -sf "$PWD/i3status-rust" ~/.config 
# may need to mkdir -p ~/.screenlayout first
ln -sf "$PWD/default-i3.sh" ~/.screenlayout/
```

## Setup Exports

The following are needed in `.zshrc` (already in my `.zshrc` file) for `newx` to work.

```sh
export SCRIPTS="$HOME/.local/bin/scripts"
export PATH=~/.local/bin/scripts:~/.local/bin:$PATH
```

### Inspired by

[rwxrob](https://github.com/rwxrob) and his pretty sweet [setup](https://github.com/rwxrob/dot). 
