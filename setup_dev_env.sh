#!/bin/bash

# Function for Ubuntu/Debian/Mint setup
setup_ubuntu_debian() {
    echo "Setting up development environment for Ubuntu/Debian/Mint..."

    # Update and install packages
    sudo apt update && sudo apt upgrade -y
    sudo apt install -y zsh git curl fonts-powerline vim gcc g++ clang python2 python3 python3-pip python-pip \
        build-essential cmake make libtool pkg-config libboost-all-dev

    # Install oh-my-zsh
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
        chsh -s $(which zsh)
    fi

    # Set oh-my-zsh theme
    sed -i 's/^ZSH_THEME=.*/ZSH_THEME="agnoster"/' ~/.zshrc

    # Install Python libraries
    pip2 install --upgrade pip
    pip3 install --upgrade pip
    pip2 install scipy numpy matplotlib scikit-rf
    pip3 install scipy numpy matplotlib scikit-rf

    # Configure Vim
    cat <<EOL >> ~/.vimrc
set tabstop=4
set shiftwidth=4
set expandtab
set number
EOL

    echo "Ubuntu/Debian/Mint setup completed!"
}

# Function for Arch Linux setup
setup_arch() {
    echo "Setting up development environment for Arch Linux..."

    # Update and install packages
    sudo pacman -Syu --noconfirm
    sudo pacman -S --noconfirm zsh git curl powerline-fonts vim gcc clang python python-pip python2 \
        base-devel cmake libtool boost

    # Install oh-my-zsh
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
        chsh -s $(which zsh)
    fi

    # Set oh-my-zsh theme
    sed -i 's/^ZSH_THEME=.*/ZSH_THEME="agnoster"/' ~/.zshrc

    # Install Python libraries
    pip2 install --upgrade pip
    pip3 install --upgrade pip
    pip2 install scipy numpy matplotlib scikit-rf
    pip3 install scipy numpy matplotlib scikit-rf

    # Configure Vim
    cat <<EOL >> ~/.vimrc
set tabstop=4
set shiftwidth=4
set expandtab
set number
EOL

    echo "Arch Linux setup completed!"
}

# Darcula terminal theme setup (placeholder message)
setup_darcula_theme() {
    echo "Please install and set the Darcula terminal theme manually."
}

# Detect OS and run setup
if [ -f /etc/os-release ]; then
    . /etc/os-release
    case "$ID" in
        ubuntu|debian|linuxmint)
            setup_ubuntu_debian
            ;;
        arch)
            setup_arch
            ;;
        *)
            echo "Unsupported Linux distribution: $ID"
            ;;
    esac
else
    echo "Unable to detect OS. Make sure you're running a supported Linux distribution."
fi

# Prompt for Darcula theme
setup_darcula_theme
