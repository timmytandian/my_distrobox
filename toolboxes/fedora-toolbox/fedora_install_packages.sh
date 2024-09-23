#!/bin/bash

# Install Starship prompt
install_starship() {
  echo "Installing Starship prompt..."
  curl -sS https://starship.rs/install.sh | sh -s -- --yes
}

# Install Chezmoi
install_chezmoi() {
  echo "Installing Chezmoi..."
  sh -c "$(curl -fsLS get.chezmoi.io/lb)" 
}

# Install GoMono Nerd Font
install_nerd_fonts() {
  echo "Installing GoMono Nerd Font..."
  font_dir="$HOME/.local/share/fonts"
  mkdir -p "$font_dir"
  
  curl -fLo "$font_dir/Go-Mono.zip" https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Go-Mono.zip
  unzip "$font_dir/Go-Mono.zip" -d "$font_dir/GoMono"
  
  echo "GoMono Nerd Font installed in $font_dir/GoMono"
}

# Refresh font cache (Linux)
refresh_fonts() {
  echo "Refreshing font cache..."
  fc-cache -fv
}

# Main script
main() {
  install_starship
  install_chezmoi
  install_nerd_fonts
  refresh_fonts
  echo "Installation completed!"
}

# Run the main function
main
