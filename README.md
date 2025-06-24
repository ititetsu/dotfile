# 設定

```sh
git clone https://github.com/ititetsu/dotfile.git $HOME/.config
git submodule init
git submodule update

sudo apt install zsh fzf zoxide

# Node.js
# nvmをダウンロードしてインストールする：
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
# シェルを再起動する代わりに実行する
\. "$HOME/.nvm/nvm.sh"
# Node.jsをダウンロードしてインストールする：
nvm install 22

# oh-my-zsh
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
# zsh-autosuggestions
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# zsh-syntax-highlighting
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

ln -s $HOME/.config/.zsh/zshrc $HOME/.zshrc
ln -s $HOME/.config/git/.gitconfig $HOME/.gitconfig
ln -s ~/.config/tmux/tmux.conf ~/.tmux.conf
ln -s ~/.config/tmux/tmux.conf.local ~/.tmux.conf.local

chsh -s $(which zsh)
```
> [!TIP]
> Powerlevel10kはinstallが終わらない時がある
> 
> WSLではinstallが終わらない問題は発生しないので、WSLで作成し ①コピー②実行権限付与 を行うとよい
>
> https://github.com/romkatv/powerlevel10k?tab=readme-ov-file#how-do-i-install-powerlevel10k-on-a-machine-without-internet-access


## 独自のコマンド

### tmuxの起動
```bash
tmuxg
```
起動時に上にnvim、下に左右分割でターミナルを配置する。
> oh-my-tmuxを利用している
https://github.com/gpakosz/.tmux
