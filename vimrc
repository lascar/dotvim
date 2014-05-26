execute pathogen#infect()
set laststatus=2
set statusline=
set statusline +=%1*\ %n\ %*            "buffer number
set statusline +=%4*\ %<%F%*            "full path
set statusline +=%2*%m%*                "modified flag
set statusline +=%1*%=%5l%*             "current line
set statusline +=%2*/%L%*               "total lines
set writebackup
set backup
set hidden
set tabstop=2
set expandtab
filetype plugin indent on
filetype on
let mapleader = ","
set paste
" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir
if has('autocmd')
  filetype plugin indent on
  autocmd Filetype ruby setlocal ts=2 sts=2 sw=2 et
  autocmd Filetype javascript setlocal ts=2 sts=2 sw=2 et
  autocmd Filetype php setlocal ts=4 sts=4 sw=4 et
endif

" Keep undo history across sessions by storing it in a file
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif
if has('persistent_undo')
  let myUndoDir = expand(vimDir . '/undodir')
  " No console pops up
  call system('mkdir ' . myUndoDir)
  let &undodir = myUndoDir
  set undofile
endif
