execute pathogen#infect()
set sessionoptions-=options

" colored statusline  Green in normal mode, and Magenta in insert mode
" first, enable status line always
set laststatus=2
" now set it up to change the status line based on mode
if version >= 700
  au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl guisp=Magenta
  au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse
endif
set statusline=%m%F%h%w\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set colorcolumn=80
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
" vim fugitive
set diffopt+=vertical
" za to expand or close fold
" dotvim as vimdir and leader key ------------------ {{{
let vimDir = '$HOME/dotvim'
let &runtimepath.=','.vimDir
let mapleader = "\<Space>"
" }}}
" nerdtree and ctags ------------------ {{{
noremap <silent> <F9> :!ctags --tag-relative -Rf.git/tags.$$ --exclude=.git --exclude=log --exclude=public --exclude=node_modules --exclude=app/stylesheets * $(echo $GEM_HOME)/*;fg;mv .git/tags.$$ .git/tags;rm -f .git/tags.$$<CR><CR>
nnoremap <silent> <F8> :TagbarToggle<CR>
nnoremap <silent> <F7> :NERDTreeToggle<CR>
" }}}
" move between split windows ------------------ {{{
nnoremap <silent> <leader>2 <C-W><C-S>
nnoremap <silent> <leader>3 <C-W><C-W>
nnoremap <silent> <leader>4 <C-W>o
nnoremap <silent> <leader>5 :buffers<CR>:buffer<Space>
nnoremap <silent> <leader>6 <C-W>r
nnoremap <silent> <leader>9:bn<CR>
" }}}
" Vimscript file setting ------------------ {{{
augroup filetype_vim
  if has('autocmd')
    autocmd!
    filetype plugin indent on
    autocmd Filetype vim setlocal foldmethod=marker
    autocmd Filetype ruby setlocal ts=2 sts=2 sw=2 et
    autocmd Filetype python setlocal ts=4 sts=4 sw=4 et
    autocmd Filetype html setlocal ts=2 sts=2 sw=2 et
    autocmd Filetype javascript setlocal ts=4 sts=4 sw=4 et
    autocmd Filetype php setlocal ts=4 sts=4 sw=4 et
  endif
augroup END
" }}}
" http://astonj.com/wp-content/uploads/2012/06/codeschool.vim2_.zip
" codeschool ---------------------------- {{{
augroup codeschool
  color codeschool
  autocmd User Rails let b:surround_{char2nr('-')} = "<% \r %>" " displays <% %> correctly
  :set cpoptions+=$ " puts a $ marker for the end of words/lines in cw/c$ commands
augroup END
" }}}
syntax enable
set  t_Co=256
" Keep undo history across sessions by storing it in a file
" persistent_undo ---------------------------- {{{
augroup persistent_undo
  if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " No console pops up
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
  endif
augroup END
" }}}
nnoremap Q <Nop>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
inoremap <c-u> <esc>vawUea
inoremap <c-l> <esc>vawuea
iabbrev @@ pascal.carrie@gmail.com
function Str(str)
  let b:str = "console.log('" . a:str . " : ' + JSON.stringify(" . a:str . "));"
  return b:str
endfunction
