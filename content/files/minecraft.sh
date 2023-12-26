#!/bin/bash

# Function to display messages in a consistent format
display_message() {
    echo -e "\n====================================="
    echo "$1"
    echo "====================================="
}

# Check if the OS is Arch Linux
if [ -f "/etc/arch-release" ]; then
    display_message "Detected Arch Linux"

    # List of packages to uninstall
    packages_to_uninstall=(
        prismlauncher
        prismlauncher-git
        prismlauncher-qt5
        prismlauncher-qt5-bin
        prismlauncher-qt5-git
        prismlauncher-bin
        multimc-bin
        multimc-git
        multimc5
        pollymc-qt5-git 
        polymc-qt5-git
        polymc-qt5 
        polymc-qt5-bin
        polymc-bin
        polymc-git
        polymc
    )

    # Uninstall listed packages
    for package in "${packages_to_uninstall[@]}"; do
        if pacman -Qs "^$package$" &>/dev/null; then
            display_message "Uninstalling $package Removing the other version of Prism Luncher"
            yes | sudo pacman -Rns "$package" --noconfirm
        fi
    done

    # Check if yay is available
    if command -v yay &> /dev/null; then
        display_message "Using yay to install prismlauncher-bin"
        yay -S prismlauncher-bin --noconfirm
    elif command -v paru &> /dev/null; then
        display_message "Using paru to install prismlauncher-bin"
        paru -S prismlauncher-bin --noconfirm
    else
        display_message "yay and paru not found, falling back to manual installation process"

        # Clone and install prismlauncher-bin
        git clone https://aur.archlinux.org/prismlauncher-bin.git
        cd prismlauncher-bin || exit
        yes | makepkg -si --noconfirm
        cd .. || exit
    fi
fi


# Check if the OS is Fedora
if [ -f "/etc/fedora-release" ]; then
    display_message "Detected Fedora"
    sudo dnf copr disable polymc/polymc -y
    sudo dnf remove polymc -y
    sudo dnf copr enable g3tchoo/prismlauncher -y
    sudo dnf install prismlauncher -y
fi

# Check if the OS is Debian or Ubuntu
if [ -f "/etc/debian_version" ] || [ -f "/etc/lsb-release" ]; then
    display_message "Detected Debian or Ubuntu"
    
    # Use nala if available, fallback to apt, then apt-get
    if command -v nala &> /dev/null; then
        package_manager="nala"
    elif command -v apt &> /dev/null; then
        package_manager="apt"
    elif command -v apt-get &> /dev/null; then
        package_manager="apt-get"
    else
        display_message "No package manager found. Exiting."
        exit 1
    fi
    
    display_message "Using package manager: $package_manager"

    # Install prerequisites
    $package_manager update
    $package_manager install -y curl gnupg

    # Configure prebuilt-mpr repository
    curl -q 'https://proget.makedeb.org/debian-feeds/prebuilt-mpr.pub' | gpg --dearmor | sudo tee /usr/share/keyrings/prebuilt-mpr-archive-keyring.gpg 1> /dev/null
    echo "deb [signed-by=/usr/share/keyrings/prebuilt-mpr-archive-keyring.gpg] https://proget.makedeb.org prebuilt-mpr $(lsb_release -cs)" | sudo tee /etc/$package_manager/sources.list.d/prebuilt-mpr.list

    # Install prismlauncher
    $package_manager update
    yes | $package_manager remove multimc        # Automatically confirm the removal
    yes | $package_manager remove prismlauncher  # Automatically confirm the removal
    $package_manager install prismlauncher -y
fi

display_message "Minecraft was installed successfully."
