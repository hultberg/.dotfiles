" Import plugins
source ~/.vim/plugins.vim

set shell=/bin/bash

syntax on

set backspace=indent,eol,start
let mapleader=','
set nonumber
set autowriteall
set complete=.,w,b,u

set visualbell
set t_vb=

" Show matching bracet
set showmatch


" -------------- Visuals --------------

colorscheme atom-dark-256
set t_CO=256
set linespace=20

" Highlight line nr column
highlight LineNr ctermbg=bg

" Highlight folder column
highlight foldcolumn ctermbg=bg

" Add padding... :-P
set foldcolumn=2

" -------------- Search --------------
set hlsearch
set incsearch




" -------------- Mappings --------------

" Go to end of line
nmap <Leader><Leader>e $
nmap <Leader><Leader>s 0

" Shortcut for escape
ino jj <esc>

" Shortcut to edit vimrc
nmap <Leader>ev :tabedit $MYVIMRC<cr>
nmap <Leader>ep :tabedit ~/.vim/plugins.vim<cr>

" Close tab like chrome-ish
nmap <Leader>w :tabclose<cr>

" Open tab like chrome-ish
nmap <Leader>t :tabedit<cr>

" NERDTree
nmap <Leader>nt :NERDTreeToggle<cr>

" Remove search highlight
nmap <Leader><space> :nohlsearch<cr>

" Run gulp
nmap <Leader>gu :!gulp<cr>
nmap <Leader>gs :!gulp style<cr>
nmap <Leader>gw :!gulp webpack:local<cr>

" NPM
nmap <Leader>nb :!npm run build<cr>

" Map recent used
nmap <C-E> :CtrlPMRUFiles<cr>


" -------------- Splits --------------
set splitbelow
set splitright

nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>


" -------------- Editor stuff ----------------

" Indent stuff
set autoindent
set cindent
set shiftwidth=4
set tabstop=4

" -------------- Plugins --------------

"/
"/ CtrlP
"/
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:15,result:15'

nmap <C-r> :CtrlPBufTag<cr>
nmap <C-e> :CtrlPMRUFiles<cr>
nmap <Leader>f :tag<space>
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
let g:ctrlp_show_hidden = 1

"/
"/ NERDTree
"/
let NERDTreeHijackNetrw = 0

"/
"/ Greplace
"/
"set grepprg=arg

"let g:grep_cmd_opts = '--line-numbers --noheading'


"/
"/ PHPDocumentor
"/
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <leader>d :call pdv#DocumentWithSnip()<CR>

" -------------- Backup --------------

set backup
set backupdir=~/.vim/backup/

set swapfile
set directory=~/.vim/swap/

set undodir=~/.vim/undo/
set undofile

" -------------- Auto-command --------------

augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
	autocmd BufWritePost plugins.vim source ~/.vimrc
	autocmd BufWritePost plugins.vim :PluginInstall
	autocmd BufWritePost plugins.vim :bd \[Vundle]\ Installer
augroup END

augroup phptabs
	autocmd!
	autocmd Filetype php setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
augroup END


