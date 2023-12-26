#!/bin/bash
set -e

# Function to display messages in a consistent format
display_message() {
    echo -e "\n====================================="
    echo "$1"
    echo "====================================="
}

# Detect Linux distribution
if command -v zypper &> /dev/null; then
    # openSUSE
    sudo zypper prismlauncher -y
elif command -v dnf &> /dev/null; then
    # Fedora
    sudo dnf copr disable polymc/polymc -y
    sudo dnf remove polymc -y
    sudo dnf copr enable g3tchoo/prismlauncher -y
    sudo dnf install prismlauncher -y
elif command -v apt &> /dev/null; then
    # Debian or Ubuntu
    sudo apt update
    sudo apt install -y curl gnupg
    curl -q 'https://proget.makedeb.org/debian-feeds/prebuilt-mpr.pub' | gpg --dearmor | sudo tee /usr/share/keyrings/prebuilt-mpr-archive-keyring.gpg 1> /dev/null
   # echo "deb [signed-by=/usr/share/keyrings/prebuilt-mpr-archive-keyring.gpg] https://proget.makedeb.org prebuilt-mpr $(lsb_release -cs)" | sudo tee /etc/apt/sources.list.d/prebuilt-mpr.list
    echo "deb [signed-by=/usr/share/keyrings/prebuilt-mpr-archive-keyring.gpg] https://proget.makedeb.org prebuilt-mpr bookworm" | sudo tee /etc/apt/sources.list.d/prebuilt-mpr.list
    sudo apt update
    sudo apt purge multimc -y || true
    sudo apt purge prismlauncher -y || true
    sudo apt install prismlauncher -y
elif command -v yay &> /dev/null; then
    # Arch Linux
    sudo pacman -Rns --noconfirm prismlauncher || true
    sudo pacman -Rns --noconfirm prismlauncher-git || true
    sudo pacman -Rns --noconfirm prismlauncher-qt5 || true
    sudo pacman -Rns --noconfirm prismlauncher-qt5-bin || true
    sudo pacman -Rns --noconfirm prismlauncher-qt5-git || true
    sudo pacman -Rns --noconfirm prismlauncher-bin || true
    sudo pacman -Rns --noconfirm multimc-bin || true
    sudo pacman -Rns --noconfirm multimc-git || true
    sudo pacman -Rns --noconfirm multimc5 || true
    sudo pacman -Rns --noconfirm pollymc-qt5-git || true
    sudo pacman -Rns --noconfirm polymc-qt5-git || true
    sudo pacman -Rns --noconfirm polymc-qt5 || true
    sudo pacman -Rns --noconfirm polymc-qt5-bin || true
    sudo pacman -Rns --noconfirm polymc-bin || true
    sudo pacman -Rns --noconfirm polymc-git || true
    sudo pacman -Rns --noconfirm polymc || true
    yay -S --noconfirm prismlauncher
elif command -v paru &> /dev/null; then
    # Arch Linux
    sudo pacman -Rns --noconfirm prismlauncher || true
    sudo pacman -Rns --noconfirm prismlauncher-git || true
    sudo pacman -Rns --noconfirm prismlauncher-qt5 || true
    sudo pacman -Rns --noconfirm prismlauncher-qt5-bin || true
    sudo pacman -Rns --noconfirm prismlauncher-qt5-git || true
    sudo pacman -Rns --noconfirm prismlauncher-bin || true
    sudo pacman -Rns --noconfirm multimc-bin || true
    sudo pacman -Rns --noconfirm multimc-git || true
    sudo pacman -Rns --noconfirm multimc5 || true
    sudo pacman -Rns --noconfirm pollymc-qt5-git || true
    sudo pacman -Rns --noconfirm polymc-qt5-git || true
    sudo pacman -Rns --noconfirm polymc-qt5 || true
    sudo pacman -Rns --noconfirm polymc-qt5-bin || true
    sudo pacman -Rns --noconfirm polymc-bin || true
    sudo pacman -Rns --noconfirm polymc-git || true
    sudo pacman -Rns --noconfirm polymc || true
    paru -S --noconfirm prismlauncher
else
    echo "Unsupported distribution. Please install flatpak and curl manually."
    exit 1
fi

display_message "Prism Luncher was installed successfully."

# Downloads Minecraft 1.20.4 with perfromace modes and 1.20.1 with optfine
# Detect the user's home directory
user_home=$(eval echo ~"$USER")

# Define the URL for downloading minecraft.tar.gz
minecraft_url="https://www.dropbox.com/scl/fi/whwsruso1dk6y1kyndpca/minecraft.tar.gz?rlkey=9npj1olyt0l0azya1rxt4njwe&dl=1"

# Define the extraction directory
extract_dir="$user_home/.local/share/PrismLauncher"

# Download the minecraft.tar.gz file
echo "Downloading Minecraft..."
wget -O minecraft.tar.gz "$minecraft_url"

# Check if the download was successful
if [ $? -eq 0 ]; then
    echo "Minecraft has been successfully downloaded."
else
    echo "Error: Failed to download Minecraft. Please check the URL and try again."
    exit 1
fi

# Check if the extraction directory exists, create it if not
if [ ! -d "$extract_dir" ]; then
    mkdir -p "$extract_dir"
fi

# Extract the tar.gz file to the specified directory
tar -xzf minecraft.tar.gz -C "$extract_dir"

# Check if the extraction was successful
if [ $? -eq 0 ]; then
    echo "Minecraft has been successfully extracted to $extract_dir"
else
    echo "Error: Failed to extract Minecraft to $extract_dir"
    exit 1
fi

# Clean up: Remove the downloaded zip file
rm -f minecraft.tar.gz

display_message "Minecraft was installed successfully."