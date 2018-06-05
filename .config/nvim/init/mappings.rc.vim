tnoremap <Esc> <C-\><C-n>

" 十字キーの無効化
map <Up> <Nop>
map <Down> <Nop>
map <Left> <Nop>
map <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" インサートモードでのESCをjjに
inoremap <silent> jj <ESC>

" 論理行移動と物理行移動を逆にmapping
noremap j gj
noremap k gk
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
