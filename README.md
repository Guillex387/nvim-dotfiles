# nvim-dotfiles

This is my personal configuration of neovim with lua.

> **Note**: this neovim config is not stable, and does not have maintance.

## Installation

Before to install the config, you need to install these tools:

### git

The main tool to install is [git](https://git-scm.com/), if you don't have it installed yet.

### packer

To manage plugins I use [packer.nvim](https://github.com/wbthomason/packer.nvim):

If you use Arch linux distros, packer has an AUR package:

```sh
yay -S nvim-packer-git
```

For other linux distros and MacOs:

```sh
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

For windows:

```sh
git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"
```

### ripgrep

As a dependency for telescope, [install ripgrep tool](https://github.com/BurntSushi/ripgrep?tab=readme-ov-file#installation).

### languages servers

All language intellisense configured, are automatically installed, but the typescript intellisense
needs to install [nodejs](https://nodejs.org/) and [npm](https://www.npmjs.com/) before.

Finally to install the config:

```sh
# Remove the prev config
rm -rf ~/.config/nvim/*
# Install this repo config
git clone --depth 1 https://github.com/Guillex387/nvim-dotfiles.git ~/.config/nvim
```

## Captures

![caputure](assets/capture.png)

## License

Guillex387/nvim-dotfiles Copyright (c) 2024 Guillex387. All rights reserved.

Licensed under the [MIT](LICENSE) license.
