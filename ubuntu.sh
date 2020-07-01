sudo add-apt-repository -y ppa:neovim-ppa/stable
sudo apt-get upgrade -y
sudo apt-get update -y
sudo apt-get install -y zsh sqlite3 libsqlite3-dev vim-gtk autojump neovim gcc htop

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb
sudo dpkg -i ripgrep_11.0.2_amd64.deb
rm -rf ripgrep_11.0.2_amd64.deb

git clone --depth 1 https://github.com/LHY-iS-Learning/.dotfiles.git ~/.dotfiles


ZSH="$HOME/.dotfiles/oh-my-zsh" sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs


curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup component add rust-src


git config --global user.name LHY-iS-Learning
git config --global user.email hongyi.lyu95@gmail.com
