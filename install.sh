#!/usr/bin/env bash
set -e

DOTFILES="$HOME/.dotfiles"

# ── Prerequisites ─────────────────────────────────────────────
echo "==> Installing prerequisites..."

# Homebrew selbst, falls noch nicht da
if ! command -v brew &>/dev/null; then
  echo "  installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew trust nikitabobko/tap
brew trust proxmark/proxmark3

brew tap nikitabobko/tap
brew tap jesseduffield/lazygit

brew install \
  ripgrep node \
  zsh-syntax-highlighting \
  lazygit \
  fzf fd bat eza tlrc \
  thefuck zoxide

#brew install --cask aerospace

# ── Symlinks ──────────────────────────────────────────────────
echo "==> Symlinking dotfiles..."

link() {
  local src="$DOTFILES/$1"
  local dst="$HOME/$2"
  mkdir -p "$(dirname "$dst")"
  ln -sf "$src" "$dst"
  echo "  linked: $dst"
}

#link "vim/.vimrc"      ".vimrc"
#link "tmux/.tmux.conf" ".tmux.conf"
#link "iterm2/com.googlecode.iterm2.plist" \
     #"Library/Preferences/com.googlecode.iterm2.plist"

echo "==> Done!"
