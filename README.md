# .dotfiles

This repository contains the dotfiles for my development environment.

## Before Installation

- 1 Update package information
    ```sh
    sudo apt update
    ```

- 2 Ensure that you have `zsh` installed and have properly set it as your default shell before running the install script
    **Step 1**:
    ```sh
    sudo apt install zsh
    ```
    You can verify the installation was successful by running `zsh --version`.

    **Step 2**:
    ```sh
    chsh -s $(which zsh)  
    ```

    **Step 3**:
    Logout and log back in. After logging back in, you can verify that it is now your default shell by running `echo $SHELL`. The expected result is `/bin/zsh` or similar.

- 3 Ensure that `git` is installed (if it isn't already):
    ```sh
    sudo apt install git
    ```

## Installation

Install the dotfiles by running the following command:

**curl**
```sh
curl -Ls https://raw.githubusercontent.com/akabinds/.dotfiles/master/install.sh | bash
```

**wget**
```sh
wget -q -O - https://raw.githubusercontent.com/akabinds/.dotfiles/master/install.sh | bash
```
