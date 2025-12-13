# Dotfiles (GNU Stow)

This repo is managed with GNU Stow. Each top-level folder is a “package”.
Stow creates symlinks from the package contents into $HOME.

Repo location (example):
- `~/Code/dotfiles`

Target:
- $HOME (usually ~)

Layout (example)

```
dotfiles/
  nvim/
    .config/nvim/init.lua
  tmux/
    .tmux.conf
  bashrc/
    .bashrc
```
## Basic usage

Stow (link) one package
  `stow -v -d ~/Code/dotfiles -t ~ nvim`

Stow all packages (link everything)
  `stow -v -d ~/Code/dotfiles -t ~ */`

Preview (dry-run)
Add -n to see what would happen:
  `stow -n -v -d ~/Code/dotfiles -t ~ nvim`
  `stow -n -v -d ~/Code/dotfiles -t ~ */`

Updating after changes

## Restow (recommended)
Use after renames/moves inside a package, or when links are out of sync.
Unlinks what stow owns, then relinks.
  `stow -v -R -d ~/Code/dotfiles -t ~ nvim`

Restow everything (unlink + relink ALL; recommended for syncing)
  `stow -v -R -d ~/Code/dotfiles -t ~ */`

Removing / unlinking

Unlink one package (unstow)
  `stow -v -D -d ~/Code/dotfiles -t ~ nvim`

Unlink ALL packages (unstow everything)
  `stow -v -D -d ~/Code/dotfiles -t ~ */`

Relinking ALL

Relink ALL packages (stow everything)
  `stow -v -d ~/Code/dotfiles -t ~ */`

## Common gotchas

- “existing target is not owned by stow” means a real file (or non-stow
  symlink) exists at the target path. Backup/remove it first, or use --adopt
  carefully.
- Prefer always using -d ~/Code/dotfiles -t ~ so commands work from any CWD.
- Relative symlink targets are OK (e.g. ~/.bashrc -> Code/dotfiles/...);
  readlink -f ~/.bashrc shows the resolved absolute path.

