download:
	@echo "Installing dependencies for configuration..."

	@echo "Installing Alacritty themes into ~/.local/share/alacritty/alacritty-theme..."
	@git clone https://github.com/alacritty/alacritty-theme ~/.local/share/alacritty/alacritty-theme

	@echo "Installing TPM(Tmux package manager) into ~/.local/share/tmux/plugins/tpm..."
	@git clone https://github.com/tmux-plugins/tpm ~/.local/share/tmux/plugins/tpm

	@echo "Installing Oh-My-Zsh into ~/.local/share/omz..."
	@sh -c "ZSH=~/.local/share/omz $$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh) --keep-zshrc --unattended"
	@rm ~/.zshrc

	@echo "Installing custom plugins..."
	@git clone https://github.com/zsh-users/zsh-autosuggestions ~/.local/share/omz/custom/plugins/zsh-autosuggestions
	@git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ~/.local/share/omz/custom/plugins/fast-syntax-highlighting

	@echo "Dependencies are installed."
	@echo "Run make install to install configuration"

install: download
	@echo "make install"
	@echo "Install configuration..."

	@echo "Installing alacritty config..."
	@mkdir -p ~/.config/alacritty
	@stow -t ~/.config/alacritty alacritty

	@echo "Installing ghostty config..."
	@mkdir -p ~/.config/ghostty
	@stow -t ~/.config/ghostty ghostty

	@echo "Installing NeoVim config..."
	@mkdir -p ~/.config/nvim
	@stow -t ~/.config/nvim nvim

	@echo "Installing scripts..."
	@mkdir -p ~/.local/scripts
	@stow -t ~/.local/scripts scripts

	@echo "Installing tmux config..."
	@mkdir -p ~/.config/tmux
	@stow -t ~/.config/tmux tmux

	@echo "Installing zsh config..."
	@stow -t ~ zsh

uninstall:
	@echo "Uninstall configuration..."
	@rm ~/.config/alacritty -rf
	@rm ~/.config/ghostty -rf
	@rm ~/.config/nvim -rf
	@rm ~/.local/scripts -rf
	@rm ~/.config/tmux -rf
	@rm ~/.zshrc

	@echo "Deleting dependencies..."
	@rm -rf ~/.local/share/alacritty
	@rm -rf ~/.local/share/tmux
	@rm -rf ~/.local/share/omz
