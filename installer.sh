sudo apt update && upgrade
sudo apt install -y xorg i3 nitrogen firefox ranger vim neovim kitty neofetch zsh picom ruby discord
sudo gem install colorls
sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
sudo mv .zshrc ~/.zshrc
sudo mv .p10k.zsh ~/.p10k.zsh
sudo mv * ~/.config/
sudo chsh -s /bin/zsh
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
nvim +PackerSync
