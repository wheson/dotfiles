if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/wheson/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/wheson/.cache/dein')
  call dein#begin('/Users/wheson/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/wheson/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })
  
  call dein#add('Shougo/deoplete.nvim')
  let g:deoplete#enable_at_startup = 1

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

set encoding=utf-8
scriptencoding utf-8

set fileencoding=utf-8
set fileencodings=ucs-boms,utf-8,euc-jp,cp932
set fileformats=unix,dos,mac
set ambiwidth=double

let g:python3_host_prog = $PYENV_ROOT . '/shims/python3'

syntax on
colorscheme iceberg 
set number
tnoremap <Esc> <C-\><C-n>

set clipboard+=unnamed

inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
inoremap { {}<LEFT>

" 隣接した{}で改行したらインデント
function! IndentBraces()
    let nowletter = getline(".")[col(".")-1]    " 今いるカーソルの文字
    let beforeletter = getline(".")[col(".")-2] " 1つ前の文字

    " カーソルの位置の括弧が隣接している場合
    if nowletter == "}" && beforeletter == "{"
        return "\n\t\n\<UP>\<RIGHT>"
    else
        return "\n"
    endif
endfunction
" Enterに割り当て
inoremap <silent> <expr> <CR> IndentBraces()

" Plugin key-mappings.  " <C-k>でsnippetの展開
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
" 自分用 snippet ファイルの場所 (任意のパス)
let g:neosnippet#snippets_directory = '~/.config/nvim/snippets'
