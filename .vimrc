set nocompatible

source /usr/share/vim/google/google.vim
behave mswin
source $VIMRUNTIME/mswin.vim

set ignorecase
set smartcase
set scrolloff=3
set visualbell
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set textwidth=0
set hlsearch
set paste
set incsearch
set number
set autoread
set laststatus=2
set statusline=%<%f\ %y%m%=%-14.(%l,%c%V%)\ %P

if &termencoding ==# 'utf-8' || &encoding ==# 'utf-8'
  let &listchars = "tab:\u21e5 ,trail:\u2423,extends:\u25b6,precedes:\u25c0,nbsp:\u00b7"
endif

filetype plugin indent on
syntax on
if has('gui_running')
"  set background=dark
"  colorscheme solarized
   let g:molokai_original = 1
   colorscheme molokai
else
"  set background=dark
"  colorscheme jellybeans
   let g:molokai_original = 1
   colorscheme molokai
endif

"Glug youcompleteme-google

" If multiple files are given on command line, open each one in new tab
au VimEnter * nested tab sball

" Enable 80 column highlight for code files
au BufWinEnter *.c,*.cc,*.cpp,*.h set colorcolumn=81,82,83
au BufWinLeave *.c,*.cc,*.cpp,*.h set colorcolumn=

" Highlight trailing whitespace
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
highlight ExtraWhitespace ctermbg=red guibg=red

autocmd BufWinEnter dumpstate* set nowrap

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

inoremap <C-Del> <C-O>cw
nnoremap <C-Del> cw
inoremap <C-W> <C-O>b<C-O>ve
nnoremap <C-W> i<C-O>b<C-O>ve

nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>

nnoremap <F3>     n
inoremap <F3>     <C-g>n
nnoremap <S-F3>   N
inoremap <S-F3>   <C-g>N

snoremap <silent> <Tab> <C-o>>gv<C-g>
snoremap <silent> <S-Tab> <C-o><gv<C-g>

snoremap <C-S-f> <C-o>ygv<Esc>:%s/<C-r>"/

inoremap <silent> <C-e> <Esc>:Unite -start-insert grep:.<CR>
nnoremap <silent> <C-e> :Unite -start-insert grep:.<CR>



"NeoBundle Scripts-----------------------------
if has('vim_starting')
  " Required:
  set runtimepath+=/usr/local/google/home/servolk/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('/usr/local/google/home/servolk/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'Shougo/unite.vim'

" Required:
call neobundle#end()


" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------
