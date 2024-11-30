#!/bin/bash

# Function for Ubuntu/Debian/Mint setup
setup_ubuntu_debian() {
    echo "Setting up development environment for Ubuntu/Debian/Mint..."

    # Update and install packages
    sudo apt update && sudo apt upgrade -y
    sudo apt install -y zsh git curl fonts-powerline vim gcc g++ clang python3 python3-pip \
        build-essential cmake make libtool pkg-config libboost-all-dev dconf-cli

    # Install oh-my-zsh
    if ! command -v zsh &> /dev/null; then
        echo "Zsh is not installed. Installing..."
        sudo apt install -y zsh
    fi

    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        echo "Installing Oh My Zsh..."
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
        chsh -s $(which zsh)
    fi

    # Set oh-my-zsh theme
    if [ ! -f "$HOME/.zshrc" ]; then
        touch "$HOME/.zshrc"
    fi
    sed -i 's/^ZSH_THEME=.*/ZSH_THEME="agnoster"/' ~/.zshrc

    # Install Python libraries
    pip3 install --upgrade pip
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
    sudo pacman -S --noconfirm zsh git curl powerline-fonts vim gcc clang python python-pip \
        base-devel cmake libtool boost dconf

    # Install oh-my-zsh
    if ! command -v zsh &> /dev/null; then
        echo "Zsh is not installed. Installing..."
        sudo pacman -S --noconfirm zsh
    fi

    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        echo "Installing Oh My Zsh..."
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
        chsh -s $(which zsh)
    fi

    # Set oh-my-zsh theme
    if [ ! -f "$HOME/.zshrc" ]; then
        touch "$HOME/.zshrc"
    fi
    sed -i 's/^ZSH_THEME=.*/ZSH_THEME="agnoster"/' ~/.zshrc

    # Install Python libraries
    pip install --upgrade pip
    pip install scipy numpy matplotlib scikit-rf

    # Configure Vim
    cat <<EOL >> ~/.vimrc
set tabstop=4
set shiftwidth=4
set expandtab
set number
EOL

    echo "Arch Linux setup completed!"
}

# Dracula theme setup
setup_dracula_theme() {
    echo "Setting up Dracula theme for the terminal..."

    # GNOME Terminal
    if [ "$(basename "$SHELL")" == "bash" ] || [ "$(basename "$SHELL")" == "zsh" ]; then
        echo "Configuring Dracula theme for GNOME Terminal..."
        git clone https://github.com/dracula/gnome-terminal ~/dracula-gnome-terminal
        cd ~/dracula-gnome-terminal
        ./install.sh
        cd ..
        rm -rf ~/dracula-gnome-terminal
    fi

    # KDE Konsole
    if command -v konsole &> /dev/null; then
        echo "Configuring Dracula theme for KDE Konsole..."
        mkdir -p ~/.local/share/konsole
        git clone https://github.com/dracula/konsole ~/dracula-konsole
        cp ~/dracula-konsole/Dracula.colorscheme ~/.local/share/konsole/
        rm -rf ~/dracula-konsole
    fi

    # XFCE Terminal
    if command -v xfce4-terminal &> /dev/null; then
        echo "Configuring Dracula theme for XFCE Terminal..."
        mkdir -p ~/.config/xfce4/terminal/colorschemes
        wget https://raw.githubusercontent.com/dracula/xfce-terminal/master/Dracula.theme -O ~/.config/xfce4/terminal/colorschemes/Dracula.theme
    fi

    echo "Dracula theme setup completed! Please restart your terminal for changes to take effect."
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

# Setup Dracula theme
setup_dracula_theme
