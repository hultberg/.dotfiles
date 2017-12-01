
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'Vundlevim/Vundle.vim'
Plugin 'tpope/vim-vinegar'
Plugin 'scrooloose/nerdtree'
Plugin 'junegunn/fzf.vim'
Plugin 'rking/ag.vim'
Plugin 'skwp/greplace.vim'
Plugin 'tpope/vim-surround'
Plugin 'StanAngeloff/php.vim'
Plugin 'ervandew/supertab'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'tobyS/vmustache'
Plugin 'tobyS/pdv'
Plugin 'posva/vim-vue'
Plugin 'lumiliet/vim-twig'
"Plugin 'jiangmiao/auto-pairs'
Plugin 'dikiaap/minimalist'

" Vundle end
call vundle#end()
filetype plugin indent on    " required
