execute pathogen#infect()

" colored statusline  Green in normal mode, and Magenta in insert mode
" first, enable status line always
set laststatus=2
" now set it up to change the status line based on mode
if version >= 700
  au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl guisp=Magenta
  au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse
endif
set statusline=%m%F%h%w\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set writebackup
set backup
set hidden
set number
set history=1000
set autoindent
set shiftwidth=2
set expandtab
set tabstop=2
set softtabstop=2
" long line wrap but move on jk on visual line, g to switch to default behaviour
set wrap
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" move between split windows
nnoremap <silent> <F3> <C-W><C-W>
" for choosing buffer
nnoremap <silent> <F5> :buffers<CR>:buffer<Space>

" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir
filetype plugin indent on
filetype on
let mapleader = "-"
if has('autocmd')
  filetype plugin indent on
  autocmd Filetype ruby setlocal ts=2 sts=2 sw=2 et
  autocmd Filetype php setlocal ts=4 sts=4 sw=4 et
  autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
  autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
  autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr> v
endif
syntax enable
set  t_Co=256
" colorscheme en ubuntu
" blue default desert evening morning pablo shine torte darkblue delek elflord koehler murphy peachpuff ron slate zellner
" colorscheme morning
" codeschool http://astonj.com/wp-content/uploads/2012/06/codeschool.vim2_.zip
color codeschool
set guifont=Monaco:h12
autocmd User Rails let b:surround_{char2nr('-')} = "<% \r %>" " displays <% %> correctly
:set cpoptions+=$ " puts a $ marker for the end of words/lines in cw/c$ commands
" end codeschool
" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
  let myUndoDir = expand(vimDir . '/undodir')
  " No console pops up
  call system('mkdir ' . myUndoDir)
  let &undodir = myUndoDir
  set undofile
endif
" noremap <Leader>t :!ctags --tag-relative -Rf.git/tags.$$ --exclude=.git --exclude=log --exclude=public --exclude=node_modules --exclude=app/stylesheets * $(echo $GEM_HOME)/*;fg;mv .git/tags.$$ .git/tags;rm -f .git/tags.$$<CR><CR>
noremap <Leader>t :!ctags --tag-relative -Rf.git/tags.$$ --exclude=.git --exclude=log --exclude=public --exclude=node_modules --exclude=app/stylesheets * $(echo $GEM_HOME)/*;fg;mv .git/tags.$$ .git/tags;rm -f .git/tags.$$<CR><CR>
nnoremap <silent> <F8> :TagbarToggle<CR>
nnoremap <silent> <F7> :NERDTreeToggle<CR>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
inoremap <c-u> <esc>vawUea
inoremap <c-l> <esc>vawuea
iabbrev @@ pascal.carrie@gmail.com
