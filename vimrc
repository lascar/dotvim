execute pathogen#infect()
" colored statusline  Green in normal mode, and Magenta in insert mode
" first, enable status line always
set laststatus=2

" now set it up to change the status line based on mode
if version >= 700
  au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl guisp=Magenta
  au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse
endif
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set writebackup
set backup
set hidden
set tabstop=2
set expandtab
filetype plugin indent on
filetype on
let mapleader = "\\"
set paste
set number
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
  set  t_Co=256
  colorscheme pencil
  set background=light
  let g:airline_theme = 'pencil'
  let g:pencil_higher_contrast_ui = 0   " 0=low (def), 1=high
endif
if has('persistent_undo')
  let myUndoDir = expand(vimDir . '/undodir')
  " No console pops up
  call system('mkdir ' . myUndoDir)
  let &undodir = myUndoDir
  set undofile
endif
noremap <Leader>t :!ctags --tag-relative -Rf.git/tags.$$ --exclude=.git --exclude=log --exclude=public --exclude=app/stylesheets * $(rvm gemset dir)/*;fg;mv .git/tags.$$ .git/tags;rm -f .git/tags.$$<CR><CR>
nmap <F8> :TagbarToggle<CR>
nnoremap <silent> <F7> :NERDTreeToggle<CR>
