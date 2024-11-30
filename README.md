# Development Environment Setup Script

This script automates the setup of a development environment for Linux systems. It supports Ubuntu/Debian/Mint and Arch Linux distributions. The script installs necessary tools, configures your terminal and editor, and prepares the system for embedded and general-purpose programming.

---

## Features
- **Zsh with Oh My Zsh**: Includes Powerline fonts and sets the `agnoster` theme.
- **Vim Configuration**: Configures Vim with:
  - Tab width set to 4 spaces
  - Line numbers enabled
- **Darcula Terminal Theme**: Reminder to manually install and configure.
- **Development Tools**:
  - GCC, Clang, and build-essential packages
  - Boost Libraries (`libboost-all-dev` or `boost`)
  - Git
- **Python Environment**:
  - Python 2 & Python 3
  - `pip2` & `pip3`
  - Common Python libraries: `scipy`, `numpy`, `matplotlib`, `scikit-rf`

---

## Supported Distributions
- **Ubuntu/Debian/Mint**
- **Arch Linux**

---

## How to Use
1. **Download the Script**:
   Save the script as `setup_dev_env.sh` in your preferred directory.

2. **Make the Script Executable**:
   ```bash
   chmod +x setup_dev_env.sh
