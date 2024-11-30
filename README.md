# Development Environment Setup Script

This script automates the setup of a development environment for Linux systems. It supports Ubuntu/Debian/Mint and Arch Linux distributions. The script installs necessary tools, configures your terminal and editor, and prepares the system for embedded and general-purpose programming.

---

## Features
- **Zsh with Oh My Zsh**: Includes Powerline fonts and sets the `agnoster` theme.
- **Vim Configuration**: Configures Vim with:
  - Tab width set to 4 spaces
  - Line numbers enabled
- **Dracula Terminal Theme**:
  - Automatically configures the Dracula theme for:
    - GNOME Terminal
    - KDE Konsole
    - XFCE4 Terminal
- **Development Tools**:
  - GCC, Clang, and build-essential packages
  - Boost Libraries (`libboost-all-dev` or `boost`)
  - Git
- **Python Environment**:
  - Python 3 and `pip3`
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
   
3. **Run the script**:
  ```bash
  ./setup_dev_env.sh
  ```

4. **Select the Dracula Theme: For terminal-specific instructions**:

-GNOME Terminal: Select the Dracula profile in Preferences > Profiles.

-KDE Konsole: Apply the Dracula theme in Settings > Edit Current Profile > Appearance.

-XFCE4 Terminal: Activate the Dracula theme in Preferences > Colors.
 
