# .dotfiles

This repository contains the dotfiles for my development environment.

## Before Installation

- Update package information:
    ```sh
    sudo apt update
    ```

- Install `git`, `curl`, and `wget` (if they aren't installed already):
    ```sh
    sudo apt install -y git curl wget
    ```

- Ensure `zsh` is installed:
    ```sh
    sudo apt install -y zsh
    ```
    Confirm by running `zsh --version`.

- Set `zsh` as your default shell:
    ```sh
    chsh -s $(which zsh)
    ```
    Log out and log back in after. Confirm by running `echo $SHELL`. Expect to see `/bin/zsh` or similar.


## Installation

Install the dotfiles by running the following command:

**curl**
```sh
curl -fsSL https://raw.githubusercontent.com/akabinds/.dotfiles/master/install.sh | zsh
```

**wget**
```sh
wget -q -O - https://raw.githubusercontent.com/akabinds/.dotfiles/master/install.sh | zsh
```
