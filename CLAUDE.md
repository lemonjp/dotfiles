# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

Personal dotfiles tracked in git and **symlinked into `$HOME`**. `setup.sh` walks every dotfile under `~/dotfiles` and creates a symlink at `$HOME/<file>`, so editing a file here directly affects the live config once linked. There is no build, test, or lint step — changes are verified by launching the target program (vim, tmux).

## Install / bootstrap

```sh
sh -x ./setup.sh                                   # symlink dotfiles into $HOME
sh -x ./.vim/scripts/setup                         # clone Vundle + run :PluginInstall
sh -x ./.vim/scripts/installer.sh ~/.cache/dein    # fetch dein.vim into ~/.cache/dein
```

Inside vim: `:PluginInstall` (Vundle) and `:call dein#install()` (dein) install plugins. On macOS, `brew install reattach-to-user-namespace` and launch tmux with `tmux -u -2` to avoid vim/tmux rendering issues.

## Vim configuration architecture

`.vimrc` is just a loader; real config lives in `.vim/` and is sourced in this order:
`vundle.vim` → `config.vim` → `mappings.vim` → `dein.vim` → `plugins.vim`.

Three plugin systems coexist (be aware which one owns a given plugin before editing):
- **Vundle** (primary) — plugins live in `.vim/vundle_plugins/*.vim`, installed to `.vim/bundle/`.
- **dein** — only manages deoplete/neosnippet, configured inline in `.vim/dein.vim`, installed to `~/.cache/dein` (not in this repo).
- **native packages** — `.vim/pack/github/start/` (e.g. copilot.vim), auto-loaded by vim with no manager.

### The `vundle_plugins/*.vim` dual-source pattern (important)

Each file in `.vim/vundle_plugins/` is sourced **twice**, and the top guard decides what runs:

```vim
if exists('g:vundle_installing_plugins')
  Plugin 'author/name'   " install phase: only register the plugin
  finish
endif
" config phase: mappings, settings, let g:... go here
```

- `vundle.vim` sets `g:vundle_installing_plugins`, loops the files to collect `Plugin` declarations, then unsets it.
- `plugins.vim` loops the same files again (guard now false) so the configuration below `finish` runs.

So when adding a plugin: create `.vim/vundle_plugins/<name>.vim` following this pattern, put the `Plugin '...'` line inside the guard and all config after the `finish`. Drop-in extra config can also go in `.vim/vundle_plugins/custom/*.vim` (sourced during the install loop only).

## Conventions

- Leader and localleader are both `<Space>` (set in `mappings.vim`).
- Default indent is 2-space expandtab; `.java`/`.php` switch to 4 (autocmds in `config.vim`). `.editorconfig` overrides JS/CSS/HTML to 4-space.
- `config.vim` auto-strips trailing whitespace on save (`BufWritePre * :%s/\s\+$//e`).
- tmux prefix is remapped to `C-t` (`.tmux.conf`); reload config with prefix + `r`.

## Notes for editing

- `.vim/CLAUDE.md` and `.vim/vundle_plugins/CLAUDE.md` are auto-generated claude-mem context files — do not hand-edit them.
- `.vim/bundle/`, `.vim/pack/`, and `~/.cache/dein` hold third-party plugin code; treat them as vendored/external, not project source.
- `.tmux.conf.win` is a Windows variant of the tmux config.
