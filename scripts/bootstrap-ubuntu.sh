#!/usr/bin/env bash

set -euo pipefail

if ! command -v apt-get >/dev/null 2>&1; then
    printf 'This script supports Ubuntu/Debian apt-based systems only.\n' >&2
    exit 1
fi

if [ "$(id -u)" -eq 0 ]; then
    SUDO=''
elif command -v sudo >/dev/null 2>&1; then
    SUDO='sudo'
else
    printf 'sudo is required when running as non-root.\n' >&2
    exit 1
fi

BASE_PACKAGES=(
    tmux
    neovim
    fzf
    ripgrep
    bc
    make
    build-essential
    curl
    xclip
)

printf 'Updating apt package index...\n'
$SUDO apt-get update

printf 'Installing base packages...\n'
$SUDO apt-get install -y "${BASE_PACKAGES[@]}"

if apt-cache show lazygit >/dev/null 2>&1; then
    printf 'Installing lazygit from apt...\n'
    $SUDO apt-get install -y lazygit
fi

if ! command -v lazygit >/dev/null 2>&1; then
    printf 'lazygit not found in apt repos, installing from GitHub release...\n'

    tmpdir="$(mktemp -d)"
    cleanup() {
        rm -rf "$tmpdir"
    }
    trap cleanup EXIT

    version="$(curl -fsSL https://api.github.com/repos/jesseduffield/lazygit/releases/latest | grep -m1 '"tag_name":' | cut -d '"' -f 4 | sed 's/^v//')"
    arch="$(dpkg --print-architecture)"

    case "$arch" in
        amd64)
            lazygit_arch='x86_64'
            ;;
        arm64)
            lazygit_arch='arm64'
            ;;
        *)
            printf 'Unsupported architecture for lazygit binary: %s\n' "$arch" >&2
            exit 1
            ;;
    esac

    archive="lazygit_${version}_Linux_${lazygit_arch}.tar.gz"
    curl -fsSL -o "$tmpdir/$archive" "https://github.com/jesseduffield/lazygit/releases/latest/download/$archive"
    tar -xf "$tmpdir/$archive" -C "$tmpdir"
    $SUDO install "$tmpdir/lazygit" /usr/local/bin/lazygit
fi

if ! command -v mise >/dev/null 2>&1; then
    printf 'Installing mise (runtime version manager)...\n'
    curl -fsSL https://mise.run | sh
fi

if grep -qi microsoft /proc/version 2>/dev/null; then
    printf 'WSL detected: tmux copy uses clip.exe fallback when available.\n'
fi

cat <<'EOF'
Bootstrap complete.

Next steps:
1) If not done already, install and configure your shell manually (for example: fish + starship)
2) bash install
3) Open nvim once to install plugins
4) Ensure mise is on your PATH (usually ~/.local/bin)
5) Install runtimes manually when you want (example: mise use -g <runtime>@<version>)
6) In nvim run :Mason and install tools you need (for example: lua_ls, ts_ls, vue_ls, astro, emmet_language_server, tailwindcss, eslint_d)
EOF
