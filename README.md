# Dotfiles

Minimal dotfiles for Neovim, tmux, and lazygit.

This repo installs symlinks for:
- `~/.config/nvim`
- `~/.config/lazygit`
- `~/.tmux.conf`
- `~/.local/bin/t`

## Supported platforms

- Ubuntu Linux
- WSL (Ubuntu)

## Setup order (WSL first)

1. On Windows, install `PowerToys`, `Windows Terminal`, and `WSL`.
2. Inside Ubuntu/WSL, install `git` first so you can clone this repo.
3. Clone this repo, then `cd` into it.
4. Install and configure your shell manually (`fish` and `starship`).
5. From this repo root, run the bootstrap and install scripts.

Install git in Ubuntu/WSL:

```bash
sudo apt update && sudo apt install -y git
```

Shell setup references:
- Starship install guide: `https://starship.rs/guide/`

### Ubuntu / WSL (Ubuntu)

```bash
bash scripts/bootstrap-ubuntu.sh
bash install
```

`scripts/bootstrap-ubuntu.sh` installs the remaining packages with apt, including:
- `tmux`, `neovim`, `lazygit`
- `fzf`, `ripgrep`, `bc`, `make`, `build-essential`, `curl`, `xclip`
- `mise`

## Runtime management (manual)

Runtimes are intentionally not auto-installed. Install what you need manually with `mise`:

```bash
mise use -g <runtime>@<version>
```

If `mise` is not available in your shell yet, add `~/.local/bin` to your `PATH` (Ubuntu/WSL) or restart your terminal.

## First Neovim launch

Open Neovim once:

```bash
nvim
```

On first launch, `lazy.nvim` installs plugins automatically.

Note: some Mason-managed language servers and formatter tools may require extra external runtimes or binaries, depending on the languages you use.

Then run `:Mason` and install the language servers/tools you use. Common ones in this config:
- `lua_ls`
- `ts_ls`
- `vue_ls`
- `astro`
- `emmet_language_server`
- `tailwindcss`
- `eslint_d`

Recommended formatter tools:
- `stylua`
- `prettierd`
- `eslint_d`

## Font recommendation

Use a Nerd Font in your terminal for Neovim icons and statusline symbols.
