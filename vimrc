" Enable Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.local/lib/python2.7/site-packages/powerline/bindings/vim/
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'powerline/powerline'
call vundle#end()
filetype plugin indent on

set ai
set number
set ruler
set ts=2
set shiftwidth=2
set expandtab
set bs=2
set laststatus=2

" Syntax highlighting
syntax enable
set t_Co=256
colorscheme gruvbox
set background=dark

" Fast buffer switch
nnoremap <C-b> :bprevious<CR>
nnoremap <C-n> :bnext<CR>

" NERDTree
nnoremap <F3> :NERDTreeToggle<CR>

" quickfix
nnoremap <F5> :copen<CR>
nnoremap <F6> :cclose<CR>
nnoremap <F7> :cp<CR>
nnoremap <F8> :cn<CR>

set nocp
filetype plugin on
filetype on

" Make the quickfix window use the full width
au FileType qf wincmd J

" Enable mouse support
set mouse=a

" taglist settings
let Tlist_Auto_Open=0
let Tlist_Use_Right_Window=1
nnoremap <F4> :TlistToggle<CR>

" YCM settings
set completeopt-=preview
let g:ycm_add_preview_to_completeopt=0

" Close buffers like taglist etc. automatically on :q or :x
function! CheckLeftBuffers()
  if tabpagenr('$') == 1
    let i = 1
    while i <= winnr('$')
      if getbufvar(winbufnr(i), '&buftype') == 'help' ||
          \ exists('t:NERDTreeBufName') &&
          \   bufname(winbufnr(i)) == t:NERDTreeBufName ||
          \ getbufvar(winbufnr(i), '&buftype') == 'quickfix' ||
          \ bufname(winbufnr(i)) == '__Tag_List__'
        let i += 1
      else
        break
      endif
    endwhile
    if i == winnr('$') + 1
      qall
    endif
    unlet i
  endif
endfunction
autocmd BufEnter * call CheckLeftBuffers()

" Highlight cursor line and right margin
set cursorline
hi CursorLine cterm=NONE ctermbg=236
hi CursorLineNr cterm=NONE ctermbg=237
if v:version > 703
  set cc=81
  hi ColorColumn ctermbg=236
endif

" GVIM settings
if has("gui_running")
  colorscheme codeschool
  set guioptions-=T
  set guioptions-=m
  set lines=35			" number of lines (height of window)
  set columns=110		" number of columns (width of window)
endif

