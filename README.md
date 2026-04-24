# Dotfiles

## Prerequisites
- git (to checkout/manage this repo)
- gnu stow (Used to create symlinks for .bashrc)

## Setup
1. Initiate git repo in .config and sync with this repo:
    ```
    cd ~/.config
    git init -b master
    git remote add -f origin git@github.com:alebahn/.config.git
    git reset --mixed origin/master
    git restore .gitignore INSTALL
    ```

2. Install
    ```
    $ ./INSTALL
    ```

3. Now check your repository for which files need merged and committed and which ones need restored with `git status`
