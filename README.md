# config

Personal dotfiles and config files imported from the old Dropbox-backed setup into a fresh Git history.

## Layout

- `home/` contains files and directories that should be linked into `$HOME`.
- `home/.config-mac/` is the active macOS config directory and is linked as both `~/.config` and `~/.config-mac`.
- `install` creates or updates those symlinks.

## Install

Preview changes first:

```sh
./install --dry-run
```

Apply them:

```sh
./install --apply
```

When applying, existing files or symlinks are moved into `~/.config-backups/<timestamp>/` before new links are created.

## Import Notes

This repository intentionally starts with fresh history rather than the old Dropbox repo history. The old history contained private auth material, so it should not be pushed to GitHub as-is.

Imported:

- committed files from `/Users/benji/Dropbox/Benji/dotfiles`
- committed Karabiner files from `/Users/benji/Dropbox/Benji/dotfiles/.config-mac/karabiner`
- live fish config from `/Users/benji/Dropbox/Benji/dotfiles/.config-mac/fish`, excluding generated `fish_variables`

Excluded:

- `.ssh/`, `.aws/`, `.pypirc`, GitHub auth hosts, OpenAI tokens, certs, and other private/auth state
- generated caches, app state, Vim plugin installs, scripts, and old Dropbox attic material
- old `.git` histories from the Dropbox-backed repos
