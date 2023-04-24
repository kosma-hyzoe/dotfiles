# if not nvim
# wget https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
# mv nvim.appimage nvim
# chmod u+x nvim
# mv -f nvim /usr/bin

ln -f vim/vimrc ~/.vimrc
ln -f vim/init.vim ~/.config/nvim
ln -f vim/bindingsrc ~/.vim
ln -f vim/pluginrc ~/.vim
ln -f vim/vscodevimrc ~/.vscodevimrc

ln -f alacritty/alacritty.yml ~/.config/alacritty
ln -f tmux/tmux.conf ~/.tmux.conf

mkdir -p ~/.config/lf
ln -f lf/lfrc ~/.config/lf

ln -f zsh/zshrc ~/.zshrc
mkdir -p ~/.config/zsh
ln -f zsh/aliasrc ~/.config
ln -f zsh/shortcutrc ~/.config
git clone https://github.com/sindresorhus/pure.git ~/.config/zsh/pure 2> /dev/null
