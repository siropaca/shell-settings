"----------------------------------------
" 環境設定
"----------------------------------------
"文字コードをUFT-8に設定
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるようにする
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
" 挿入モードでバックスペースで削除できるようにする
set backspace=indent,eol,start
" OSのクリップボードを使う
set clipboard+=unnamed
set clipboard=unnamed
" マウスモード有効
set mouse=a
" 別ファイルの同時編集
set hidden
" コマンド履歴1000個まで保存
set history=1000
"左右のカーソル移動で行間移動可能にする
set whichwrap=b,s,<,>,[,]
" 入力モード中に素早くJJと入力した場合はESCとみなす
inoremap <silent> jj <Esc>

"----------------------------------------
" 見た目系
"----------------------------------------
" 行番号を表示
set number
" 行番号
hi LineNr ctermfg=248
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" オートインデント
set smartindent
" 括弧入力時の対応する括弧を表示
set showmatch
" 編集中のファイル名を表示
set title
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" エラーメッセージの表示時にビープを鳴らさない
set noerrorbells
" 長い行を折り返して表示 (nowrap:折り返さない)
set wrap
" シンタックスハイライト
syntax on
" 256色使えるようにする
set t_Co=256

"----------------------------------------
" Tab系
"----------------------------------------
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" Tab文字を半角スペースにする(Ctrl+v -> tabでタブ挿入)
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=4
" 行頭でのTab文字の表示幅
set shiftwidth=4

"----------------------------------------
" 検索系
"----------------------------------------
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる(インクリメンタル検索)
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" Escの2回押しでハイライト消去
nnoremap <Esc><Esc> :nohlsearch<CR><ESC>
" 検索後にジャンプした際に検索単語を画面中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

"----------------------------------------
" その他
"----------------------------------------
" 全角スペースのハイライトを設定
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=underline ctermfg=darkgrey gui=underline guifg=darkgrey
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    " ZenkakuSpaceをカラーファイルで設定するなら次の行は削除
    autocmd ColorScheme       * call ZenkakuSpace()
    " 全角スペースのハイライト指定
    autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
  augroup END
  call ZenkakuSpace()
endif

" packadd! dracula
" syntax enable
" colorscheme dracula
