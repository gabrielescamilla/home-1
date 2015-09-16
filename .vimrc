syntax on
set nocompatible
" Set tab character to 4 spaces
set tabstop=4
" Always show tabs
set showtabline=2
" Set << and >> to move 4 spaces (1 tab)
set shiftwidth=4
set background=dark
set nobackup
set autoindent
" Set up a huge history and undo cache
set history=1000
set undolevels=1000
" Show the changed line count for commands
set report=0
" Show the command as you type it
set showcmd
" Confirm closing unsaved files
set confirm
" Begin searching immediately
set incsearch
" Hilight the search results
set hlsearch
" Don't do spell-checking by default
set nospell
" Enable mouse support
set mouse=a
" Case insensitive search by default, but switch to case sensitive when searching with uppercase
set ignorecase
set smartcase
" Case insensitive tab completion
if exists("&wildignorecase")
	set wildignorecase
endif
" Paste-mode where there is no autoindentation
set pastetoggle=<F12>
" Give 5 lines of space between the cursor and the top/bottom when scrolling
set scrolloff=5
" Persistent undo
set undofile
" Set the dir to store all the swap files
set directory=$HOME/.vim/swap,.
" And all the undo files
set undodir=$HOME/.vim/undo,.
" But then disable them anyway
set noswapfile
" Show line numbers
set number
set numberwidth=1 " But keep it narrow
" Make the line number relative
"set relativenumber
" Make spaces easier to see
set listchars=tab:.\ ,trail:.
set list
" Set up the font for gvim
set guifont=Liberation\ Mono\ 9
" Set the statusline
set statusline=%F%m%r%h%w\ [Format:\ %{&ff}]\ [Type:\ %Y]\ [Position:\ (%4l,\ %3v)\ %p%%]\ [Lines:\ %L]%=[Git\ branch:\ %{GitBranchInfoTokens()[0]}]
" Always show it
set laststatus=2
" Command-line menu for completion
set wildmenu
" Match the longest first and tab through the remaining choices
set wildmode=longest:full,full
" Suffixes that get lower priority when doing tab completion for filenames
" These are files we are not likely to want to edit or read
set suffixes=.bak,~,.swp,.swo,.swn,.swm,.o,.d,.info,.aux,.dvi,.pdf,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.pyc,.pyd,.dll,.bin,.exe
" Wrap searching around the EOF and BOF
set wrapscan
" New windows to below or right
set splitbelow
set splitright
" Highlight the current line (but only in gvim, it looks terrible in normal vim)
if has('gui_running')
	set cursorline
	set lines=40
	set columns=120
endif
" Hide the toolbar in gvim
set guioptions-=T
" Set up ack
let g:ackprg="ack -H --nocolor --nogroup --column"
" Prepare tagbar
let g:tagbar_autofocus=1
"let g:tagbar_autoclose=1
" Folding
set foldmethod=syntax
set foldlevel=1
set foldminlines=5
" Fold perl
let perl_fold = 1
let perl_fold_blocks = 1
" Don't Fold PHP
let php_fold = 0
" Set leaderkey to be comma
let mapleader = ","
" Bind ,k to grep for the last searched string
nnoremap <leader>k :grep -r <C-R>/ .<CR>:cw<CR>
" bind K to grep word under cursor
nnoremap K :grep -r "\b<C-R><C-W>\b" .<CR>:cw<CR>
" Use ag if it exists instead of grep for :grep
if executable('ag')
	set grepprg=ag\ --nogroup\ --nocolor
endif
" Paste/copy using pbcopy/pbpaste (which are mapped over ssh)
nmap <F1> :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
imap <F1> <Esc>:set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
nmap <F2> :.w !pbcopy<CR><CR>
"vmap <F2> :w !pbcopy<CR><CR>
" Make it work with the actual selection instead of the entire line
vmap <F2> :call system('pbcopy', getline("'<")[getpos("'<")[2]-1:getpos("'>")[2]-1])<CR>:echo ""<CR>


" Remap the arrow keys to ijkl
map i <Up>
map j <Left>
map k <Down>
noremap h i
" And map them with control to navigate splits
nnoremap <C-i> <C-w>k
nnoremap <C-j> <C-w>h
nnoremap <C-k> <C-w>j
nnoremap <C-l> <C-w>l
" Create hotkeys to create splits
nnoremap <C-h> <C-w>s
nnoremap <C-u> <C-w>v

nnoremap <F8> :TagbarToggle<CR>

" Hotkeys
" Set Control - n to return to normal mode in insert mode and visual mode
imap <c-n> <esc>
vmap <c-n> <esc>
" And jj in insert mode
inoremap jj <ESC>

map <leader>nt :NERDTree<cr>
map <leader>g :GundoToggle<cr>
map <leader>tn :tabnew<cr>
map <leader>w :w<cr>
map <leader>e :edit 
" ;e to reload all current buffers
map ;e :set noconfirm<cr>:bufdo e!<cr>:set confirm<cr>
map <leader>q :q<cr>
map <leader>p "+gp
map <leader>P "+gP
" yank/put to special register (to avoid the automatically handled one)
map <leader>sy "ry
map <leader>sp "rp
map <leader>sP "rP
" Copy to X clipboard with ,y
map <leader>y "+y
" ,x to de-highlight from the search
map <leader>x :nohlsearch<cr>
map <leader>m :!mkdir -p %:h<cr>
" ;y to yank the whole buffer to the X clipboard
map ;y :%y<space>+<cr>
" ;q to close all tabs and quit entirely
map ;q :quitall<cr>
" ;wq to write and quit
map ;wq :w<cr>:q<cr><cr>
" r to repeat search
map r /<CR>
" Command-line navigation
cnoremap <C-x> <Right>
cnoremap <C-z> <Left>
" Alt+Left/Right to switch tabs
nnoremap <A-Left> gT
nnoremap <A-Right> gt
" Control+Tab (+Shift, for reverse direction) to switch through tabs
nnoremap <C-Tab> gt
nnoremap <C-S-Tab> gT
" Control+t for new tab
nnoremap <C-t> :tabnew<CR>
" Run the current file in a perl window
map ;p :!perl "%"
" Build the current file as a PDF and open it with evince
map ;pdf :!pdf "%" && evince "`dirname '%'`/`basename '%' .tex`.pdf"<cr>
" Map w!! to sudo write
cmap w!! w !sudo tee % > /dev/null
" Make ; work like :
nnoremap ; :

colorscheme wombat

call pathogen#infect()
Helptags

silent! source ~/.vimrc_local

autocmd FileType php let php_noShortTags=1

autocmd FileType php hi MatchParen ctermbg=blue guibg=lightblue

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

hi MatchParen cterm=none ctermbg=none ctermfg=white

au BufNewFile,BufReadPost .z*,zsh*,zlog*	so $HOME/.vim/syntax/zsh.vim
set tabpagemax=40
