sudo hostname KeanuCodespaces
rm -rf ~/.oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone --recurse-submodules https://github.com/keanuplayz/dotfiles ~/.dotfiles
echo "source ~/.dotfiles/zsh/zshrc" >> ~/.zshrc
echo "export DOTFILES_DISABLE_WELCOME = 1" >> ~/.zshrc
pip install colorama psutil distro
echo "zsh" >> ~/.bashrc
source ~/.bashrc
