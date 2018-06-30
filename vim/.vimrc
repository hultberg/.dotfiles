" Import plugins
source ~/.vim/plugins.vim

set shell=zsh\ -l
"set rtp+=/usr/bin/fzf

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

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set guioptions-=l 
set guioptions-=b 
set guioptions-=h 
set guioptions-=R 
set guioptions-=e 
set guiheadroom=0

" -------------- Visuals --------------

" colorscheme atom-dark-256
colorscheme minimalist
set t_CO=256
set linespace=5
set guifont=Fira\ Code\ 11

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

" Save when I forgot to open vim as sudo.
" https://stackoverflow.com/a/7078429
cmap w!! w !sudo tee > /dev/null %

nnoremap bu :buffers<CR>:buffer<Space>

" Shortcut for escape
ino <C-J> <esc>

" Shortcut to edit vimrc
nmap <Leader>ev :tabedit $MYVIMRC<cr>
nmap <Leader>ep :tabedit ~/.vim/plugins.vim<cr>

" Close tab like chrome-ish
nmap <Leader>w :tabclose<cr>

" Open tab like chrome-ish
nmap <Leader>t :tabedit<cr>

nmap <C-P> :FZF<cr>
imap <C-P> :FZF<cr>

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

augroup filetypedetect
  " Mail
  autocmd BufRead,BufNewFile *mutt-*              setfiletype mail
augroup END

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

augroup vimfiles
	autocmd FileType vue syntax sync fromstart
	autocmd BufNewFile,BufRead *.vue set ft=vue
augroup END


