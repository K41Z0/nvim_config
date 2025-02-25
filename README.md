# Neovim Configuration with Lua Plugins

A custom Neovim setup using Lua, featuring a collection of plugins and various other configurations.

## Table of Contents

- [Requirements](#requirements)
- [Installation](#installation)
  - [MacOS or Linux](#macos-or-linux)
  - [Windows](#windows)

## Requirements

- [Neovim](https://github.com/neovim/neovim/releases) >= **0.9.0** (needs to be built with **LuaJIT**)
- [Git](https://git-scm.com/downloads) >= **2.19.0** (for partial clones support)
- a [Nerd Font](https://www.nerdfonts.com/) (v3.0 or greater)
- a [C compiler](https://github.com/nvim-treesitter/nvim-treesitter#requirements) for `nvim-treesitter`.
- a [fzf](https://github.com/junegunn/fzf) (v0.25.1 or greater) is a general-purpose command-line fuzzy finder
- a [lazygit](https://github.com/jesseduffield/lazygit) simple terminal UI for git commands
- a terminal that supports true color and _undercurl_:
  - [kitty](https://github.com/kovidgoyal/kitty) **_(Linux & MacOS)_**
  - [wezterm](https://github.com/wez/wezterm) **_(Linux, MacOS & Windows)_**
  - [alacritty](https://github.com/alacritty/alacritty) **_(Linux, MacOS & Windows)_** :dragon:
  - [iTerm2](https://iterm2.com/) **_(MacOS)_**

## Installation

### MacOS or Linux

- Make a backup of your current Neovim files:

  ```bash
  # required
  mv ~/.config/nvim{,.bak}
    
  # optional but recommended
  mv ~/.local/share/nvim{,.bak}
  mv ~/.local/state/nvim{,.bak}
  mv ~/.cache/nvim{,.bak}
  ```

- Clone the config:

  ```bash
  git clone https://github.com/K41Z0/nvim_config ~/.config/nvim
  ```

- Remove the .git folder, so you can add it to your own repo later

  ```bash
  rm -rf ~/.config/nvim/.git
  ```

- Start Neovim!

  ```bash
  nvim
  ```

### Windows

- Make a backup of your current Neovim files:

  ```powershell
  # required
  Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.bak

  # optional but recommended
  Move-Item $env:LOCALAPPDATA\nvim-data $env:LOCALAPPDATA\nvim-data.bak
  ```

- Clone the config:

  ```bash
  git clone https://github.com/K41Z0/nvim_config $env:LOCALAPPDATA\nvim
  ```

- Remove the .git folder, so you can add it to your own repo later

  ```bash
  Remove-Item $env:LOCALAPPDATA\nvim\.git -Recurse -Force
  ```

- Start Neovim!
  
  ```bash
  nvim
  ```
