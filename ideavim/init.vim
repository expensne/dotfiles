source ~/dotfiles/ideavim/profile/basic/init.vim

if exists('g:idea')
    source ~/dotfiles/ideavim/profile/idea/init.vim
elseif exists('g:vscode')
    " source ~/.config/ideavim/profile/vscode/init.vim
else
    " source ~/.config/ideavim/profile/shell/init.vim
endif

