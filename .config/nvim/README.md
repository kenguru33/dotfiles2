# nvim-config

Neovim configuration with Lua

## Features

- Easy language server installation
- Autocompletion
- Formatting
- Linting
- Syntax highlighting with Treesitter
- Fuzzy finder functionality with Telescope
- UndoTree
- Nice looking :-)

![screenshot.png](https://github.com/kenguru33/nvim-config/blob/master/screenshot.png)

## Installation

**Prerequirements**

ripgrep (rg) - used by telescope

```bash
brew install rg
```

git - packer

```bash
brew install git
```

nodejs

```bash
brew install node
```

Typescript compiler (tsc) - Used by tsserver

```bash
npm install -g tsc
```

stylua - lua formatting

```bash
brew install stylua
```

prettier - formatting for many language

```bash
npm install -g prettier
```

NeoVim

```bash
brew install neovim
```

**NeoVim Setup**

Pull config from git:

```bash
git clone https://github.com/kenguru33/nvim-config.git ~/.config/nvim
```

Run headless installation

```bash
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
```

Congratulation! You now have å fully configured nvim setup.

Start nvim

```bash
nvim
```
