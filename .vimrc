syntax on
set t_Co=256
colorscheme navajo
colors navajo
set mouse=a
set background=light
set autoindent
set cmdheight=2
set ruler
set nu
set tabstop=2
set guioptions-=T
let &termencoding=&encoding
set encoding=UTF-8 fileencodings=.
set nocompatible
set cursorline
set ttyfast
set ruler
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set laststatus=2
set backspace=indent,eol,start
set relativenumber
set undofile
let mapleader=","
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %
set list
"set listchars=tab:▸\ ,eol:¬
set listchars=tab:»·,eol:¶

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-P> :call PhpDocSingle()<CR>
vnoremap <C-P> :call PhpDocRange()<CR>

hi CursorLine cterm=NONE ctermbg=white ctermfg=NONE guibg=white guifg=NONE

nmap<silent> <F1> :call NumberToggle()<CR>

function! NumberToggle()
	if exists("&rnu")
		if&number
			setlocal relativenumber
		else
			if&relativenumber
				setlocal norelativenumber
			else
				setlocal number
			endif
		endif
	else
		if&number
			setlocal nonumber
		else
			setlocal number
		endif
	endif
endfunction
