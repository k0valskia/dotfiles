sudo apt install neovim vim i3 picom zsh kitty nitrogen
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
mv .oh-my-zsh $HOME
mv .zshrc $HOME
mv * ~/.config/
chsh -s /usr/bin/zsh
