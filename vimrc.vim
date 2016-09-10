" Import plugins
source ~/.vim/plugins.vim

syntax on

set backspace=indent,eol,start
let mapleader=','
set nonumber
set autowriteall
set complete=.,w,b,u

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

inoremap { {}<esc>i
inoremap [ []<esc>i
inoremap ( ()<esc>i

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
nmap <Leader>n :NERDTreeToggle<cr>

" Remove search highlight
nmap <Leader><space> :nohlsearch<cr>

" Map symbols
nmap <C-R> :CtrlPBufTag<cr>

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

if exists("g:ctrlp_user_command")
	unlet g:ctrlp_user_command
endif

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/vendor,*/node_modules,*/bower_components

"/
"/ NERDTree
"/
let NERDTreeHijackNetrw = 0

"/
"/ Greplace
"/
set grepprg=arg

let g:grep_cmd_opts = '--line-numbers --noheading'


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


