" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

let g:python3_host_prog = $PYENV_ROOT . '/shims/python3'

" ------------ deinの設定 -------------

" プラグインがインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイルを用意しておく
  let g:rc_dir    = expand("~/.config/nvim/")
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif


" ------------ setコマンド -------------
" エンコーディングの設定
set encoding=utf-8
scriptencoding utf-8

" 画面表示の設定
set number         " 行番号を表示する
set cursorline     " カーソル行の背景色を変える
"set cursorcolumn   " カーソル位置のカラムの背景色を変える
set laststatus=2   " ステータス行を常に表示
"set cmdheight=2    " メッセージ表示欄を2行確保
set showmatch      " 対応する括弧を強調表示
set helpheight=999 " ヘルプを画面いっぱいに開く
set list           " 不可視文字を表示
"set listchars=tab:▸\ ,eol:↲,extends:❯,precedes:❮ " 不可視文字の表示記号指定


" カーソル移動関連の設定
"set backspace=indent,eol,start " Backspaceキーの影響範囲に制限を設けない
set whichwrap=b,s,h,l,<,>,[,]  " 行頭行末の左右移動で行をまたぐ
set scrolloff=8                " 上下8行の視界を確保
set sidescrolloff=16           " 左右スクロール時の視界を確保
set sidescroll=1               " 左右スクロールは一文字づつ行う


" ファイル処理関連の設定
set confirm    " 保存されていないファイルがあるときは終了前に保存確認
set hidden     " 保存されていないファイルがあるときでも別のファイルを開くことが出来る
set autoread   "外部でファイルに変更がされた場合は読みなおす
set nobackup   " ファイル保存時にバックアップファイルを作らない
set noswapfile " ファイル編集中にスワップファイルを作らない


" 検索/置換の設定
set hlsearch   " 検索文字列をハイライトする
set incsearch  " インクリメンタルサーチを行う
set ignorecase " 大文字と小文字を区別しない
set smartcase  " 大文字と小文字が混在した言葉で検索を行った場合に限り、大文字と小文字を区別する
set wrapscan   " 最後尾まで検索を終えたら次の検索で先頭に移る
set gdefault   " 置換の時 g オプションをデフォルトで有効にする


" タブ/インデントの設定
set expandtab     " タブ入力を複数の空白入力に置き換える
set tabstop=4     " 画面上でタブ文字が占める幅
set shiftwidth=4  " 自動インデントでずれる幅
set softtabstop=4 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent    " 改行時に前の行のインデントを継続する
set smartindent   " 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
"インデントの大きさをファイルごとに設定
augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4
    autocmd BufNewFile,BufRead *.rb setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.js setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END


" 動作環境との統合関連の設定
" OSのクリップボードをレジスタ指定無しで Yank, Put 出来るようにする
set clipboard=unnamed,unnamedplus
" マウスの入力を受け付ける
set mouse=a
" 全角文字を表示
set ambiwidth=double
" True Colorの使用
set termguicolors


" コマンドラインの設定
" コマンドラインモードでTABキーによるファイル名補完を有効にする
set wildmenu wildmode=list:longest,full
" コマンドラインの履歴を10000件保存する
set history=10000


"ビープ音すべてを無効にする
set visualbell t_vb=
set noerrorbells "エラーメッセージの表示時にビープを鳴らさない


" ファイル読み込みの設定
set fileencoding=utf-8
set fileencodings=ucs-boms,utf-8,euc-jp,cp932
set fileformats=unix,dos,mac


" ------------ colorscheme -------------
colorscheme dracula
syntax on


" ------------ mapping -------------
tnoremap <Esc> <C-\><C-n>


" 単体スペースを無効化
nnoremap <Space> <Nop>

" 論理行移動と物理行移動を逆にmapping
noremap j gj
noremap k gk
noremap <Down> gj
noremap <Up> gk
noremap gj j
noremap gk k

" 対応する括弧に移動
noremap m %

" 行頭行末コマンドをmapping
noremap <S-h> ^
noremap <S-l> $

" 段落移動コマンドをmapping
noremap <S-j> }
noremap <S-k> {

" ウインドウ移動コマンドをmapping
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
if has('nvim')
  nmap <BS> <C-W>h
endif


" ------------- 以下外部プラグイン設定 ---------------

" NERDTreeToggle
map <C-t> :NERDTreeToggle<CR>


" easy motion
" Leaderキーをスペースに変更
let mapleader = "\<Space>"

nmap <Leader>w <Plug>(easymotion-overwin-w)
" 両方向に1文字検索
map f <Plug>(easymotion-bd-fl)
map t <Plug>(easymotion-bd-tl)


" QuickRun
nnoremap <silent> <C-q> :QuickRun<CR>
let g:quickrun_config = {
\   'cpp/c++' :{
\       'command': 'c++',
\       'cmdopt': '-std=c++14'
\   }
\}

" Ale
let g:ale_linters = {'cpp': ['gcc']}
let g:ale_cpp_gcc_executable = '/opt/local/bin/g++'
let g:ale_cpp_gcc_options="-std=c++14"

" indentLine
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#484848'
let g:indentLine_char = '¦' "use ¦, ┆ or │
let g:indentLine_conceallevel = 1
