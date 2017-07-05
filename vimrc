" vi:set tabstop=4 softtabstop=2 shiftwidth=2 textwidth=0
"**************************************************
" vim:fdm=marker fdl=3 fdc=0 fdo+=jump,search:
" vim:fdt=substitute(getline(v\:foldstart),'\\(.\*\\){\\{3}','\\1',''):
"
" 閉じたい場合は、vimwikiのvim/index参照
" fdl:0 にすると全部のfoldingが閉じられる。
"**************************************************
"**************************************************
" start config
"**************************************************
" * 日本語を扱うために必要な設定 {{{
" set encoding=japan "これを設定すると文字化けする。なんで？
" set fileencoding=japan
" set fileencoding=utf-8
" set termencoding=cp932
" set termencoding=japan
" set encoding=cp932
" set encoding=utf-8
" set termencoding=utf-8
" set fileencoding=utf-8
" set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,utf-8
" set fileencodings+=cp932
"set fileencodings=utf-8,euc-jp,sjis,cp932,All
"set fileencodings=sjis,utf-8,iso-2022-jp,euc-jp
" encode file 読み込み
source $HOME/.vim/vimfiles/encode.vim
" }}}
"**************************************************
" * 日本語入力に関する設定: {{{
"**************************************************
if has('multi_byte_ime') || has('xim')
  " IME ON時のカーソルの色を設定(設定例:紫)
  highlight CursorIM guibg=Purple guifg=NONE
  " 挿入モード・検索モードでのデフォルトのIME状態設定
  set iminsert=0 imsearch=0
  set imactivatekey=
  if has('xim') && has('GUI_GTK')
    " XIMの入力開始キーを設定:
    " 下記の s-space はShift+Spaceの意味でkinput2+canna用設定
    "set imactivatekey=s-space
  endif
  " 挿入モードでのIME状態を記憶させない場合、次行のコメントを解除
  "inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
endif
" }}}
"**************************************************
" * keymap選択 {{{
"
" " 日本語入力用のkeymapの設定例 (コメントアウト)
" if has('keymap')
"   " ローマ字仮名のkeymap
"   "silent! set keymap=japanese
"   "set iminsert=0 imsearch=0
" endif
" }}}
"**************************************************
" * 検索の挙動に関する設定: {{{
"**************************************************
" 検索時に大文字小文字を無視 (noignorecase:無視しない)
set ignorecase
" 大文字小文字の両方が含まれている場合は大文字小文字を区別
set smartcase
" 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set wrapscan
"検索文字列入力時に順次対象文字列にヒットさせない
set noincsearch
"検索結果文字列のハイライトを有効にする
set hlsearch
" }}}
"**************************************************
" * 編集に関する設定: {{{
"**************************************************
"buffer Explorerのための設定 - 非互換モード
set nocp
syntax on
" タイトルを表示
set title
" 行番号を非表示 (number:表示)
"set nonumber
set number
" ルーラーを表示 (noruler:非表示)
set ruler
" タブや改行を表示 (list:表示)
set nolist
" どの文字でタブや改行を表示するかを設定
"set listchars=tab:>-,extends:<,trail:-,eol:<
"set listchars=tab:^\ \,trail:-,extends:>,precedes:<
" 長い行を折り返して表示 (nowrap:折り返さない)
"set wrap
set nowrap
" 常にステータス行を表示 (詳細は:he laststatus)
set laststatus=2
" コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
set cmdheight=2
" コマンドをステータス行に表示
set showcmd
"ステータスラインに文字コードと改行文字を表示する
"set statusline=%<%f%=%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%9(\ %m%r\ %)[%4v][%12(\ %5l/%5L%)]
let &statusline='%<%f%=%h%w%y[%{cfi#format("%s()","no function")}][%{(&fenc!=""?&fenc:&enc)}][%{&ff}][%4v][%12(%5l/%5L%)]'
"let &statusline = '%{cfi#format("[%s()]", "no function")}'
"let &statusline = '[%{cfi#get_func_name()}()]'
" tabstop start ---------------
"タブ幅を設定する
set tabstop=4
set shiftwidth=4
set softtabstop=4
" タブをスペースに展開 (noexpandtab:展開しない)
"set expandtab
set noexpandtab
set smarttab
" tabstop end   ---------------
" 自動的にインデントする (noautoindent:インデントしない)
set autoindent
" インデント
set smartindent
" バックスペースでインデントや改行を削除できるようにする
set backspace=2
" 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set noshowmatch
" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM
"モードラインの無効化
set nomodeline
"バックアップを取らない
set nobackup
" vim 記号 重なる: 全角記号がかぶってしまうのを防止:
set ambiwidth=double
" 画面遷移で上書き確認聞いてこない
set hidden
"
set confirm
" }}}
"**************************************************
" * マウス操作 {{{
"**************************************************
" 端末でマウス操作は禁止するようにする
"set mouse=a
"if &term == "screen"
"   set ttymouse=xterm2
"endif
" }}}
"**************************************************
" * カラー表示の設定 {{{
" " コンソールでのカラー表示のための設定(暫定的にUNIX専用)
" if has('unix') && !has('gui_running')
"   let uname = system('uname')
"   if uname =~? "linux"
"     set term=builtin_linux
"   elseif uname =~? "freebsd"
"     set term=builtin_cons25
"   elseif uname =~? "Darwin"
"     set term=beos-ansi
"   else
"     set term=builtin_xterm
"   endif
"   unlet uname
" endif
" }}}
"**************************************************
" * フォント設定 {{{
if has('xfontset')
  " UNIX用 (xfontsetを使用)
  set guifontset=a14,r14,k14
endif
" }}}
"**************************************************
" * Tag Setting {{{
  " helptags $HOME/.vim/doc
  set helplang=ja,en
  " ==============================
  " TAG Setting
  set tags=./.tags;,./tags;
  " ==============================
  " 特定のディレクトリにあるタグファイルを指定
  " if has('path_extra')
  "   set tags+=./*/tags;
  " endif
  " ==============================
  " 何階層か下のタグファイルを指定
  " if has('path_extra')
  "   set tags+=./**/tags;
  " endif
  " ==============================
  " 3階層下のディレクトリまでマッチ
  " if has('path_extra')
  "   set tags+=./**3/tags;
  " endif
  " ==============================
  " 親ディレクトリ(現在のディレクトリ)から**を使う
  " set tags=**;
  " ==============================
" }}}
"**************************************************
" 互換モード 一旦OFF {{{
" ここでOFFにしてからplugin読まないとおかしくなる.最後に再設定 
" 互換性OFF
set nocompatible
filetype off
syntax off
"}}}
"**************************************************
"**************************************************
" * vim-plug {{{
if has('vim_starting')
  set rtp+=~/.vim/plugged/vim-plug
  if !isdirectory(expand('~/.vim/plugged/vim-plug'))
    echo 'install vim-plug...'
    call system('mkdir -p ~/.vim/plugged/vim-plug')
    call system('git clone https://github.com/junegunn/vim-plug.git ~/.vim/plugged/vim-plug/autoload')
  end
endif

call plug#begin('~/.vim/plugged')
  Plug 'junegunn/vim-plug',
        \ {'dir': '~/.vim/plugged/vim-plug/autoload'}
call plug#end()
" }}}
"**************************************************
" * ★★★★★vim-plug(vimplug) でのplugin 読み込み★★★★★ {{{
call plug#begin('~/.vim/plugged')
"" git clone 後、実行すべきコマンドがある場合はこんな感じ
Plug 'Shougo/vimproc.vim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
"Plug 'Shougo/unite.vim'

Plug 'thinca/vim-quickrun'
Plug 'mattn/quickrunex-vim'
"filer
"Plug 'cocopon/vaffle.vim'
"snipMate
"Plug 'MarcWeber/vim-addon-mw-utils'
"Plug 'tomtom/tlib_vim'
"Plug 'garbas/vim-snipmate'
"Plug 'honza/vim-snippets'

"------------------------
Plug 'majutsushi/tagbar'
"Plug 'Align'
Plug 'tpope/vim-surround'
Plug 'vimwiki/vimwiki'
Plug 'thinca/vim-visualstar'
Plug 'thinca/vim-qfreplace'
Plug 'fuenor/qfixgrep'
" gvim専用
Plug 'thinca/vim-fontzoom'
"" なんか誤動作した。使えん。自分の操作体系とは違うのでいらない。
"Plug 'fuenor/im_control.vim'
"" コメントアウトするものらしい
Plug 'tyru/caw.vim'
"" VIMを再起動する　便利
Plug 'tyru/restart.vim'
"" 関数のスコープ検索
Plug 'tyru/current-func-info.vim'
Plug 'easymotion/vim-easymotion'
"" colorscheme
Plug 'vim-scripts/darkbone.vim'
Plug 'noahfrederick/Hemisu'
Plug 'Slashbunny/vim-colorsamplerpack'
Plug 'altercation/vim-colors-solarized'
Plug 'nielsmadan/harlequin'

Plug 'vim-jp/vimdoc-ja'
Plug 'anyakichi/vim-qfutil'
"" TODO をList化する
Plug 'vim-scripts/TaskList.vim'
" jpFormat
Plug 'fuenor/JpFormat.vim'
" yank改善
Plug 'LeafCage/yankround.vim'
" Vim内のPython環境とvirtualenvを連動させてくれるプラグインです。必須です。
Plug 'jmcantrell/vim-virtualenv'
" 誤動作するからいらね
"Plug 'davidhalter/jedi-vim'
"
Plug 'mbbill/VimExplorer'
"Plug 'justinmk/vim-dirvish'
Plug 'jeetsukumaran/vim-filebeagle'

" インデントを表示してくれる
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-dispatch'
" Plug 'yuratomo/bg.vim'
Plug 'Shougo/context_filetype.vim'
Plug 'vim-scripts/copypath.vim'
Plug 'nazo/pt.vim'
Plug 'mattn/sonictemplate-vim'
Plug 'chrisbra/SudoEdit.vim'
Plug 'thinca/vim-ref'

" ctrlp関連
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-scripts/ctrlp-funky'
Plug 'mattn/ctrlp-launcher'
Plug 'mattn/ctrlp-register'
Plug 'mattn/ctrlp-mark'
Plug 'mattn/ctrlp-filer'
Plug 'sgur/ctrlp-extensions.vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'mattn/emmet-vim'
Plug 'mattn/calendar-vim'
" 持ってないからいらない
"Plug 'mattn/favstar-vim'

" julia
Plug 'JuliaEditorSupport/julia-vim'
" 4.2. Align things
Plug 'junegunn/vim-easy-align'
" Src Explorer
Plug 'wesleyche/SrcExpl'
"Proj
Plug 'tdavis/proj-vim'

Plug 'glidenote/memolist.vim'

"PlantUML関連
Plug 'aklt/plantuml-syntax'
"Markdown
Plug 'plasticboy/vim-markdown'
Plug 'tyru/open-browser.vim'
" VCS
"	GIT
Plug 'tpope/vim-fugitive'
"	mercurial
Plug 'jlfwong/vim-mercenary'
"	svn
Plug 'juneedahamed/svnj.vim'

" bookmarkの表示ができる
Plug 'MattesGroeger/vim-bookmarks'
"diff関連
Plug 'chrisbra/vim-diff-enhanced'
Plug 'will133/vim-dirdiff'
Plug 'rickhowe/diffchar.vim'

" substring関係
Plug 'osyo-manga/vim-over'
Plug 'qpkorr/vim-renamer'
Plug 'vitalk/vim-simple-todo'
" 
"Plug 'bronson/vim-visual-star-search'




" コマンド実行時に読み込む
"Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle'] }
" 指定したファイルタイプを開いたときに読み込む
"Plug 'tpope/vim-fireplace', { 'for': ['clojure'] }
" X | Y の時, X をインストールした後に Y をインストール
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

call plug#end()

" :PlugInstall
"
"}}}
"**************************************************
" * 外部ファイル読み込み(*.vim) {{{
" runtimepathに追加
"set runtimepath+=~/.vim/vim_php_manual_jp
" helpをword上で<Shift>kで開くようにする
set keywordprg=:help

"Myコマンドを設定
source $HOME/.vim/my_command.vim
" }}}
"**************************************************
"補完について {{{
"http://daisuzu.hatenablog.com/entry/2015/12/05/002129
"---------------
"局所キーワード補完: CTRL-X CTRL-N / CTRL-X CTRL-P
"	現在のファイルから キーワードを補完
"---------------
"辞書補完: CTRL-X CTRL-K
" dictionaryオプションで設定したファイルから twist で始まる単語を補完
" 辞書フォルダを以下のように設定する
"	set dictionary=/usr/share/dict/words
"---------------
"シソーラス補完: CTRL-X CTRL-T
" thesaurusオプションで設定したファイルから twister の類語を補完
"	thesaurusオプションに使用するファイルを設定する必要がある(デフォルトは未設定)
"	set thesaurus=/usr/share/mythes/th_en_US_v2.dat
"---------------
"パスパターン補完: CTRL-X CTRL-I
"インクルードしているファイル(Socket.pm)から キーワード始まるを補完(perl)
"	検索対象はincludeオプションとpathオプションで設定可能
"---------------
"タグ補完: CTRL-X CTRL-]
"	tagsファイルからクラス名とメソッド名を補完(ruby)
"	  読み込むtagsファイルはtagsオプションで設定可能
"---------------
"定義補完: CTRL-X CTRL-D
"	mixinを補完(sass)
"	検索対象はdefineオプションとincludeオプションとpathオプションで設定可能
"---------------
"コマンドライン補完: CTRL-X CTRL-V
"	vimのコマンドと関数を補完
"---------------
"ユーザー定義補完: CTRL-X CTRL-U
"	completefuncオプションに設定したCompleteMonthsで月の名前を補完
"	 fun! CompleteMonths(findstart, base)
"	   if a:findstart
"		 " 単語の始点を検索する
"		 let line = getline('.')
"		 let start = col('.') - 1
"		 while start > 0 && line[start - 1] =~ '\a'
"		   let start -= 1
"		 endwhile
"		 return start
"	   else
"		 " "a:base" にマッチする月を探す
"		 let res = []
"		 for m in split("Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec")
"		   if m =~ '^' . a:base
"			 call add(res, m)
"		   endif
"		 endfor
"		 return res
"	   endif
"	 endfun
"---------------
"オムニ補完: CTRL-X CTRL-O
"	omnifuncオプションに設定されたjavascriptcomplete#CompleteJSでDate型のメソッドを補完(javascript)
"
"---------------
"let g:acp_enableAtStartup = 0
"" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"}}}
"**************************************************
"**************************************************
" * マップ定義、Key割り付け(key map, keymap define)(ショートカットとかMAP) {{{
"
" 検索キーワード : user setting, user function
"
"  表示行単位で行移動する
"表示行単位で移動(snippet展開対策済み)
nnoremap j gj
onoremap j gj
xnoremap j gj
nnoremap k gk
onoremap k gk
xnoremap k gk

" visual モードで連続して、インデント出来るように設定(連続して複数行のインデントを行う)
"    1. visual モードで選択
"    2. < > で好きな回数インデント
vnoremap <silent> > >gv
vnoremap <silent> < <gv
"----------------------------------------
" Prefix s
" unmap
nnoremap s             <Nop>
nnoremap [file-cmd]	   <Nop>
nnoremap [switch-w]    <Nop>
nnoremap [ctrlp-cmd]   <Nop>
"remap
nmap  ss		  [switch-w]
nmap  <Space>s	  [ctrlp-cmd]
nmap  <Space>f	  [file-cmd]

nnoremap sa :<C-u>w<CR>

if executable('pt')
  nnoremap sg  :<C-u>Pt <C-R>=expand('<cword>')<CR>
  nnoremap ssg :<C-u>Pt <C-R>=expand('<cword>')<CR> <C-R>=expand('%:p:h')<CR>
endif

" Easy align interactive
" 選んで Return、そして space だ。Return を多めにタイプするとアライメントが変更される。
" 2つ目のコロンで揃えたいなら、Return そして 2、最後に space だ。
vnoremap <silent> <Enter> :EasyAlign<CR>

" 画面分割、移動
nnoremap [switch-w]w <C-w>w
nnoremap [switch-w]r <C-w>r
nnoremap <C-h>	 <C-w>h
nnoremap <C-j>   <C-w>j
nnoremap <C-k>   <C-w>k
nnoremap <C-l>   <C-w>l
nnoremap [switch-w]v <C-w>v
nnoremap [switch-w]s <C-w>s
" CtrlP割り付け
" ---
nnoremap [ctrlp-cmd]q :<C-u>CtrlPQuickfix<CR>
nnoremap [ctrlp-cmd]c :<C-u>CtrlPCmdline<CR>
nnoremap [ctrlp-cmd]x :<C-u>CtrlPMixed<CR>
nnoremap [ctrlp-cmd]i :<C-u>CtrlPFiler<CR>
nnoremap [ctrlp-cmd]p :<C-u>CtrlP<CR>
" ---
nnoremap [ctrlp-cmd]r :<C-u>CtrlPRegister<CR>
nnoremap [ctrlp-cmd]t :<C-u>CtrlPTag<CR>
nnoremap [ctrlp-cmd]y :<C-u>CtrlPYankRound<CR>
" ---
nnoremap [ctrlp-cmd]a :<C-u>CtrlPBookmarkDirAdd<CR>
nnoremap [ctrlp-cmd]s :<C-u>CtrlPMenu<CR>
nnoremap [ctrlp-cmd]f :<C-u>CtrlPFunky<CR>
"nnoremap [ctrlp-cmd]h :<C-u>CtrlPBookmark<CR>
"nnoremap [ctrlp-cmd]j :<C-u>CtrlP<CR>
"nnoremap [ctrlp-cmd]k :<C-u>CurFileDir<CR>
nnoremap [ctrlp-cmd]k :<C-u>!thunar %:p:h &<CR>
"
nnoremap [ctrlp-cmd]l :<C-u>CtrlPLine<CR>
" ---
nnoremap [ctrlp-cmd]n :<C-u>CtrlPBookmarkDir<CR>
nnoremap [ctrlp-cmd]b :<C-u>CtrlPBuffer<CR>
nnoremap [ctrlp-cmd]m :<C-u>CtrlPMRUFiles<CR>
"---------------------------------------
" filebeagle
"----------------------------------------
let g:filebeagle_suppress_keymaps = 1
" 現在のルートディレクトリを開く
map <silent> <Leader>f  <Plug>FileBeagleOpenCurrentWorkingDir
" 現在のファイルのディレクトリを開く
map <silent> <Leader>- <Plug>FileBeagleOpenCurrentBufferDir
map <silent> [file-cmd]i :<C-u>FileBeagle <C-R>=expand("%:p:h")<CR><CR>
map <silent> [file-cmd]e :<C-u>FileBeagle <C-R>=getcwd()<CR><CR>

"---------------------------------------
" screen mode change
"----------------------------------------
" SMでScreenModeを叩けるように
" 1,2,3,4 までしかない感じがする。
command! -nargs=+ SM :ScreenMode(<f-args>)

"----------------------------------------
" 入力モードでのキー操作
"----------------------------------------
imap <C-e> <Esc>$a
imap <C-a> <Esc>0i
imap <C-b> <Esc>bi

"---------------------------------------
" タブの設定
"---------------------------------------
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ

map <silent> [Tag]c :tablast <bar> tabnew<CR>
" tc 新しいタブを一番右に作る
map <silent> [Tag]x :tabclose<CR>
" tx タブを閉じる
map <silent> [Tag]n :tabnext<CR>
" tn 次のタブ
map <silent> [Tag]p :tabprevious<CR>
" tp 前のタブ

nnoremap    [beagle-cmd]   <Nop>
nmap    , [beagle-cmd]
"---------------------------------------
" 割り当てなし
"----------------------------------------
nnoremap BB :<C-u>b#<CR>
nnoremap BN :<C-u>bn<CR>
nnoremap BP :<C-u>bp<CR>
nnoremap BD :<C-u>bd<CR>
nnoremap BQ :<C-u>bd!<CR>
"----------------------------------------
"<Space>pと<Space>yでシステムのクリップボードにコピー＆ペーストする
vmap <Space>y "+y
vmap <Space>Y "*y
vmap <Space>d "+d
nmap <Space>p "+p
nmap <Space>P "+P
vmap <Space>p "+p
vmap <Space>P "+P

"----------------------------------------
" ファンクションコマンド
"----------------------------------------
nnoremap <F1>     :<C-u>tabnew<CR>
nnoremap <S-F1>   :<C-u>ProjOpen<CR>
nnoremap <F2>	  :<C-u>MyColorChangeInc<CR>
nnoremap <S-F2>	  :<C-u>MyColorChangeDec<CR>

" 設定が面倒
"nnoremap <F8>     :<C-u>SrcExplToggle<CR>
nnoremap <F9>     :<C-u>TagbarToggle<CR>
" tagbarを左に表示
"let g:tagbar_left=1

" python 用
"nmap <F5> :!/usr/bin/python %<CR>
"nmap <F12> :!/usr/lib/python2.4/pdb.py %<CR>

" タブの切替 コンソールには使えない
nmap <C-Tab> gt
nmap <C-S-Tab> gT
" vvで行の終端まで選択(ちょっとやっつけ)
vnoremap v $h
"----- Clip Copy ------------------------
"  "* レジスタ: yankすると入る
"  "+ レジスタ: yankすると入る
"   一行をクリップボードにコピー(ヤンク)  "+yy
"   選択範囲をクリップボードにコピー(ヤンク)
"     vでビジュアルモードに変更し選択後	  "+y
"   全て選択しクリップボードにコピー(ヤンク)     ggVG"+y
"   gnというのはマップされているみたいなので切る
vnoremap gn "+y
"vnoremap gN "*y
" +からpasteする
"nnoremap gp "+gP
" *からpasteする
"nnoremap gP "*p
"----------------------------------------
"------ COPY ----------------------------
"----------------------------------------
"map <S-Insert> <C-r>"
"map! <S-Insert> <C-r>"
"if !has("gui_running")
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>
" "endif
"----------------------------------------
" cawの設定
"----------------------------------------
" nmap <Leader>c <Plug>(caw:i:toggle)
" vmap <Leader>c <Plug>(caw:i:toggle)
nmap <Space>c <Plug>(caw:i:toggle)
vmap <Space>c <Plug>(caw:i:toggle)
"----------------------------------------
"
"----------------------------------------
" plantumlのコマンド
"----------------------------------------
au FileType plantuml command! OpenUml :!chromium-browser % &
au FileType plantuml nmap <Space>o :OpenUml<CR>
"augroup PlantUmlCmd
"  autocmd!
"  au FileType plantuml command! OpenUml :!chromium-browser % &
"augroup END
"----------------------------------------
"}}}
" ctags {{{
"map <leader>tw yiw:tag <c-r>0<CR>
"map <leader>ts :ts<CR>
"map <leader>tn :tn<CR>
"map <leader>tp :tp<CR>
"map <leader>tf :tf<CR>
"map <leader>tl :tl<CR>
"map <leader>tt :pop<CR>
" }}}
" make {{{
" Make
"nnoremap <leader>mm :wa<CR>:make<CR>
"nnoremap <leader>mc :wa<CR>:VimProcBang make clean<CR>
"nnoremap <leader>mt :wa<CR>:VimProcBang make test<CR>
"nnoremap <leader>mf :wa<CR>:VimProcBang make fmt<CR>
" }}}
"**************************************************
" 設定ファイルの呼び出し(vimrc, gvimrc, aliases) {{{
" navigate window
" Open dot files & setting
if has('win16') || has('win32') || has('win64')
  nnoremap <silent><leader>. :<C-u>e $VIM/vimrc<CR>
  nnoremap <silent><leader>, :<C-u>e $VIM/gvimrc<CR>
  nnoremap <silent>;. :<C-u>e ~/.bash_aliases<CR>
else
  " vimrcを開く
  nnoremap <silent><leader>. :<C-u>tabedit `=resolve(expand('~/.vimrc'))`<CR>
  " gvimrcを開く
  nnoremap <silent><leader>, :<C-u>tabedit `=resolve(expand('~/.gvimrc'))`<CR>
  " read_neobundleを開く
  "nnoremap <silent><leader>/ :<C-u>tabedit `=resolve(expand('~/.vim/read_neobundle.vim'))`<CR>
  " bash_aliases
  nnoremap <silent>;. :<C-u>tabedit `=resolve(expand('~/.bash_aliases'))`<CR>
  " ctrlpランチャーの設定
  nnoremap <leader>^ :<C-u>CtrlPLauncher<CR>
endif
"}}}
"**************************************************
" * gqコマンドの設定 {{{
set formatexpr=jpfmt#formatexpr()
"}}}
"**************************************************
" * 矩形選択を行末に関係なく行う {{{
set virtualedit+=block
" }}}
"**************************************************
" command
"**************************************************
" * command: クリップボード clipboard {{{
"-----------------------
" へんなゴミがあるせいでCOPYできていなかった?
" clipboard=autoselect,exclude:cons\|linux
"-----------------------
"unnamedplusを設定すると"+y(gnにせっていしている)でCOPYしたときレジスタに上書きしてしまう模様
"set clipboard=unnamedplus
"
"削除GUIに移動
set clipboard=
"-----------------------
if has("gui_running")
  " .gvimrcに移動
  "autoselect ON
  "2017-01-19: autoselect一旦切る
  "set guioptions+=a
  "set clipboard-=autoselect
else
  "GUI版でない場合は、こちらの設定を追加する。(ここだと機能しない)
  "set clipboard+=autoselect
endif
"-----------------------
" }}}
"**************************************************
" * command: commentout.vim {{{
" lhs comments
vmap ,# :s/^/#/<CR>:nohlsearch<CR>
vmap ,/ :s/^/\/\//<CR>:nohlsearch<CR>
vmap ,> :s/^/> /<CR>:nohlsearch<CR>
vmap ," :s/^/\"/<CR>:nohlsearch<CR>
vmap ,% :s/^/%/<CR>:nohlsearch<CR>
vmap ,! :s/^/!/<CR>:nohlsearch<CR>
vmap ,; :s/^/;/<CR>:nohlsearch<CR>
vmap ,- :s/^/--/<CR>:nohlsearch<CR>
vmap ,c :s/^\/\/\\|^--\\|^> \\|^[#"%!;]//<CR>:nohlsearch<CR>

" wrapping comments
vmap ,* :s/^\(.*\)$/\/\* \1 \*\//<CR>:nohlsearch<CR>
vmap ,( :s/^\(.*\)$/\(\* \1 \*\)/<CR>:nohlsearch<CR>
vmap ,< :s/^\(.*\)$/<!-- \1 -->/<CR>:nohlsearch<CR>
vmap ,d :s/^\([/(]\*\\|<!--\) \(.*\) \(\*[/)]\\|-->\)$/\2/<CR>:nohlsearch<CR>

" block comments
vmap ,b v`<I<CR><esc>k0i/*<ESC>`>j0i*/<CR><esc><ESC>
vmap ,h v`<I<CR><esc>k0i<!--<ESC>`>j0i--><CR><esc><ESC>
"}}}
"**************************************************
" * command: timeout 設定 {{{
"
" これ伸ばすとタイムラグが発生するので注意
" この時間を伸ばせば<Leader>xxxxとかのコマンド入力受付を伸ばせる
"ttimeoutlen = -1がdefault(timeoutlenを使用する)
set timeout timeoutlen=300
set ttimeout ttimeoutlen=200
"}}}
"**************************************************
" * command: 括弧の 設定(現在無効) {{{
"inoremap { {}<LEFT>
"inoremap [ []<LEFT>
"inoremap ( ()<LEFT>
"inoremap " ""<LEFT>
"inoremap ' ''<LEFT>
"vnoremap { "zdi^V{<C-R>z}<ESC>
"vnoremap [ "zdi^V[<C-R>z]<ESC>
"vnoremap ( "zdi^V(<C-R>z)<ESC>
"vnoremap " "zdi^V"<C-R>z^V"<ESC>
"vnoremap ' "zdi'<C-R>z'<ESC>
" }}}
"**************************************************
" Tabを可視化する {{{
" :set list
" とするとTabと改行が表示されるようになる。表示文字は
" :set listchars=tab:>-
" }}}
"**************************************************
" * [日本語入力固定モード]の動作モード {{{
" let IM_CtrlMode = 1
" ================ コンソールだとゴミが乗る ==================
"### Tera TermでIME制御
" http://ttssh2.sourceforge.jp/manual/ja/usage/tips/vim.html
" "## 挿入モードから抜けた時に IME をオフにし、再度挿入モードに入った時に IME の状態を元に戻す
" let &t_SI .= "\e[<r"
" let &t_EI .= "\e[<s\e[<0t"
" let &t_te .= "\e[<0t\e[<s"
" "set timeoutlen=100
" "## 挿入モードでの ESC キーを押した後の待ちを無くす
" let &t_SI .= "\e[?7727h"
" let &t_EI .= "\e[?7727l"
" inoremap <special> <Esc>O[ <Esc>
" "## GNU Screenとの併用
" if &term == "screen"
"     let &t_SI .= "\eP\e[3 q\e\\"
"     let &t_EI .= "\eP\e[1 q\e\\"
" else
"     let &t_SI .= "\e[3 q"
"     let &t_EI .= "\e[1 q"
" endif

"}}}
"**************************************************
"**************************************************
" Plugin設定
"**************************************************
" * plugin: quickrun config設定 {{{
let g:quickrun_config = {
      \   '*': {'runmode': 'async:remote:vimproc'},
      \ }
"}}}
"**************************************************
" * plugin: unite-vim prefix key.{{{
" Unite Key Map
"nnoremap [unite] <Nop>
"nnoremap [unite-grep] <Nop>
"nmap <Space>f [unite]
"nmap <Space>g [unite-grep]

"unite general settings
"インサートモードで開始
"let g:unite_enable_start_insert = 1
""Viewモードで開始
"let g:unite_enable_start_insert=0
""最近開いたファイル履歴の保存数
"let g:unite_source_file_mru_limit = 40
""file_mruの表示フォーマットを指定。空にすると表示スピードが高速化される
"let g:unite_source_file_mru_filename_format = ''
""history/yankの有効化
"let g:unite_source_history_yank_enable =1

"現在開いているファイルのディレクトリ下のファイル一覧。
"開いていない場合はカレントディレクトリ
"nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
"nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
"nnoremap <silent> [unite]y :<C-u>Unite file_rec<CR>
"nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
"nnoremap [unite]h :<C-u>Unite bookmark:*
"nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
"nnoremap <silent> [unite]t :<C-u>Unite tab<CR>
"nnoremap <silent> [unite]j :<C-u>Unite tag<CR>
"nnoremap <silent> [unite-grep]g :<C-u>Unite grep:%:-iHRn -no-quit<CR>
"nnoremap <silent> [unite-grep]r :<C-u>Unite grep -iHRn -no-quit<CR>
"nnoremap <silent> [unite]o : <C-u>Unite -no-quit -vertical -winwidth=30 outline<CR>
"uniteを開いている間のキーマッピング
"autocmd FileType unite call s:unite_my_settings()
"function! s:unite_my_settings()"{{{
"  "ESCでuniteを終了
"  nmap <buffer> <ESC> <Plug>(unite_exit)
"  "入力モードのときjjでノーマルモードに移動
"  imap <buffer> jj <Plug>(unite_insert_leave)
"  "入力モードのときctrl+wでバックスラッシュも削除
"  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
"  "ctrl+jで縦に分割して開く
"  nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
"  inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
"  "ctrl+jで横に分割して開く
"  nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
"  inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
"  "ctrl+oでその場所に開く
"  nnoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
"  inoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
"endfunction"}}}
"}}}
"**************************************************
" * plugin: VimFiler の設定 {{{
"" Unite bookmark のアクションを vimfilerに
""call unite#custom_default_action('source/bookmark/directory' , 'vimfiler')
"" 2017-02-03 : 多分なくなった。
""
""	//こういうのやっておけば実行関連付けが出来る？
""	call vimfiler#set_execute_file('vim', 'vim')
""	call vimfiler#set_execute_file('txt', 'notepad')
""	call vimfiler#set_execute_file('c', ['vim', 'notepad'])
""vimデフォルトのエクスプローラをvimfilerで置き換える
"let g:vimfiler_as_default_explorer = 1
""セーフモードを無効にした状態で起動する
"let g:vimfiler_safe_mode_by_default = 0
"" Edit file by tabedit.
"let g:vimfiler_edit_action = 'tabopen'
"let g:vimfiler_sort_type = "Time"
""data_directory はramdiskを指定
"" if has('win32') || has('win64')
""   let g:vimfiler_data_directory = 'R:\.vimfiler'
"" elseif  has('macunix')
""   let g:vimfiler_data_directory = '/Volumes/RamDisk/.vimfiler'
"" else
""   let g:vimfiler_data_directory = '/mnt/ramdisk/.vimfiler'
"" endif
""現在開いているバッファのディレクトリを開く
"nnoremap <silent> <Space>fe :<C-u>VimFilerBufferDir -quit<CR>
""現在開いているバッファをIDE風に開く
"nnoremap <silent> <Space>fi :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>
""nnoremap <silent> <Leader>fi :VimFiler -buffer-name=explorer -split -winwidth=45 -toggle -no-quit<Cr>
""バッファ一覧
""s,v

" autocmd! FileType vimfiler call g:my_vimfiler_settings()
" function! g:my_vimfiler_settings()
"   nmap     <buffer><expr><Cr> vimfiler#smart_cursor_map("\<Plug>(vimfiler_expand_tree)", "\<Plug>(vimfiler_edit_file)")
"   nnoremap <buffer>s          :call vimfiler#mappings#do_action('my_split')<Cr>
"   nnoremap <buffer>v          :call vimfiler#mappings#do_action('my_vsplit')<Cr>
" endfunction
" aug VimFilerKeyMapping
"     au!
"     autocmd FileType vimfiler call s:vimfiler_local()
"     function! s:vimfiler_local()
"         " キーマップのカスタマイズ
"         nmap <buffer> F <Plug>(vimfiler_new_file)
"         " 関連付け
"         "if has('unix')
"         "    call vimfiler#set_execute_file('sh', 'sh')
"         "endif
"         " Unite bookmark連携
"         nnoremap <buffer> z <C-u>:Unite bookmark<CR>
"         nnoremap <buffer> A <C-u>:UniteBookmarkAdd<CR>
"         " Unite bookmarkのアクションをVimFilerに
"         call unite#custom_default_action('source/bookmark/directory' , 'vimfiler')
"         " incremental search
"         "nnoremap <buffer> / /^\s*\(\|-\\|\|+\\|+\\|-\) \zs
"     endfunction
" aug END

" let my_action = { 'is_selectable' : 1 }
" function! my_action.func(candidates)
"   wincmd p
"   exec 'split '. a:candidates[0].action__path
" endfunction
" call unite#custom_action('file', 'my_split', my_action)
"
" let my_action = { 'is_selectable' : 1 }
"
" function! my_action.func(candidates)
"   wincmd p
"   exec 'vsplit '. a:candidates[0].action__path
" endfunction
" call unite#custom_action('file', 'my_vsplit', my_action)

" }}}
"**************************************************
" * plugin: vimwiki 設定 {{{
"
" 「Plugin」メニュー以下に「Vimwiki」メニューを表示する。
:let g:vimwiki_menu = 'Plugin.Vimwiki'
" Wikiページファイルのディレクトリ： ~/my_site/
" " HTMLファイルの出力先ディレクトリ： ~/public_html/
let vimwiki_dir='~/memo/vimwiki/my_site'
let vimwiki_html_dir='~/memo/vimwiki/my_site_html'
let vimwiki_dir2='~/memo/vimwiki/my_docs'
let vimwiki_html_dir2='~/memo/vimwiki/my_docs_html'
let vimwiki_dir3='~/memo/vimwiki/dark_side'
let vimwiki_html_dir3='~/memo/vimwiki/dark_side_html'
let vimwiki_html_dir3='~/memo/vimwiki/dark_side_html'
let vimwiki_nested_syntaxes={'python': 'python', 'c': 'c','c++': 'cpp', 'bash': 'sh'}
let g:vimwiki_list = [
	\	{'path':vimwiki_dir,  'path_html':vimwiki_html_dir , 'nested_syntaxes':vimwiki_nested_syntaxes},
	\	{'path':vimwiki_dir2, 'path_html':vimwiki_html_dir2, 'nested_syntaxes':vimwiki_nested_syntaxes},
	\	{'path':vimwiki_dir3, 'path_html':vimwiki_html_dir3, 'nested_syntaxes':vimwiki_nested_syntaxes}
	\	]
" }}}
"**************************************************
" * plugin: Projの設定 {{{
"let g:ProjFileBrowser = 'VimFilerExplorer'
"let g:ProjFileBrowser = 'VimFiler'
let g:ProjFileBrowser = 'FileBeagle'
" }}}
"**************************************************
" plugin: nathanaelkane/vim-indent-guides {{{
let g:indent_guides_auto_colors = 1
" IndentGuidesEnableというコマンドで実行できる。
"}}}
"**************************************************
" * plugin: vim-easymotion {{{
"
let g:EasyMotion_leader_key = '<Space>e'
"<easymotion-leaderkey>+wで飛びたいところが表示される
"<easymotion-leaderkey>+eで飛びたいところが表示される
" Jump指定に使用するkey群
let g:EasyMotion_keys='hklyuiopnm,qwertzxcvbasdgjf;'
" 拡張版機能"
" " keep cursor column
let g:EasyMotion_startofline = 0
" smartcase
let g:EasyMotion_smartcase = 1
" Migemo
let g:EasyMotion_use_migemo = 1
" EasyMotionのデフォルトKey
"    Default Mapping      | Details
"    ---------------------|----------------------------------------------
"    <Leader>f{char}      | Find {char} to the right. See |f|.
"    <Leader>F{char}      | Find {char} to the left. See |F|.
"    <Leader>t{char}      | Till before the {char} to the right. See |t|.
"    <Leader>T{char}      | Till after the {char} to the left. See |T|.
"    <Leader>w            | Beginning of word forward. See |w|.
"    <Leader>W            | Beginning of WORD forward. See |W|.
"    <Leader>b            | Beginning of word backward. See |b|.
"    <Leader>B            | Beginning of WORD backward. See |B|.
"    <Leader>e            | End of word forward. See |e|.
"    <Leader>E            | End of WORD forward. See |E|.
"    <Leader>ge           | End of word backward. See |ge|.
"    <Leader>gE           | End of WORD backward. See |gE|.
"    <Leader>j            | Line downward. See |j|.
"    <Leader>k            | Line upward. See |k|.
"    <Leader>n            | Jump to latest "/" or "?" forward. See |n|.
"    <Leader>N            | Jump to latest "/" or "?" backward. See |N|.
"    <Leader>s            | Find(Search) {char} forward and backward. | See |f| and |F|.
"    <Leader>S            | Beginning of word forward and backward.   | See |w| and |b|.
" }}}
"**************************************************
" * plugin: neosnippet (スニペット補完) {{{

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)


" SuperTab like snippets' behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
"smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Enable snipMate compatibility feature.
" let g:neosnippet#enable_snipmate_compatibility = 1

"スニペットファイルを編集する
nnoremap <Space>nes :NeoSnippetEdit

let g:neosnippet#snippets_directory='~/.vim/neo_snippets'
"============================================================
" }}}
"**************************************************
" * plugin: ctrlP関係, ctrlp {{{

"let g:ctrlp_map = '<Nop>'
"let g:ctrlp_map = '<c-p>'

" キャッシュディレクトリ(defaultみたい)
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'

" キャッシュを終了時に削除しない
let g:ctrlp_clear_cache_on_exit = 0

" 遅延再描画
let g:ctrlp_lazy_update = 1

" 無視するディレクトリ
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" マニュアル見たほうがはやい
let g:ctrlp_extensions = ['filer', 'dir', 'tag', 'quickfix']
"let g:ctrlp_extensions = ['tag', 'quickfix', 'dir', 'line', 'mixed']
"
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20'
"let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:30'
"let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30'

let g:ctrlp_use_migemo = 1
" CtrlPのウィンドウ最大高さ
"let g:ctrlp_max_height = 20
" The maximum number of files to scan, set to 0 for no limit: 
let g:ctrlp_max_files=20000
let g:ctrlp_max_depth=20

" -------------------
" Grep設定 {{{
if executable('pt')
  let g:ctrlp_user_command = 'pt %s --ignore "*.class" -l --nocolor -g ""'
  " qfixgrep
endif
  let mygrepprg   = 'grep'

" }}}
" -------------------

" }}}
"**************************************************
" * plugin: qfutil - (Quickfix, quickfix) {{{
"  qfutil使い方わからんので保留
" nnoremap <silent> q\ :<C-u>call qfutil#toggle()<CR>
" 
" nnoremap <silent> <C-j> :<C-u>call qfutil#next(v:count)<CR>
" nnoremap <silent> <C-k> :<C-u>call qfutil#previous(v:count)<CR>
" nnoremap <silent> g<C-j> :<C-u>call qfutil#last(v:count)<CR>
" nnoremap <silent> g<C-k> :<C-u>call qfutil#first(v:count)<CR>
" nmap <C-g><C-j> g<C-j>
" nmap <C-g><C-k> g<C-k>
" 
" nnoremap <silent> q. :<C-u>call qfutil#toggle_window()<CR>
" nnoremap <silent> qq :<C-u>call qfutil#qq(v:count)<CR>
" nnoremap <silent> qn :<C-u>call qfutil#nfile(v:count)<CR>
" nnoremap <silent> qp :<C-u>call qfutil#pfile(v:count)<CR>
" nnoremap <silent> qa :<C-u>call qfutil#list()<CR>
" nnoremap <silent> qo :<C-u>call qfutil#older(v:count)<CR>
" nnoremap <silent> qi :<C-u>call qfutil#newer(v:count)<CR>
" 
" nnoremap <silent> <expr> qm qfutil#make()
" nnoremap <expr> q<Space> qfutil#make('')
" nnoremap <expr> qg qfutil#grep('')
" 
" nnoremap <silent> q] :<C-u>call qfutil#ltag()<CR>
" 
" augroup MyAutoCmd
"     autocmd!
"     " Open the quickfix window automatically
"     autocmd QuickFixCmdPost [^l]* cwindow
"     autocmd QuickFixCmdPost l* lwindow
" augroup END

"Quickfixウィンドウコマンド
"<C-w>, 	 Quickfixウィンドウのオープン/クローズ
"<C-w>. 	 Quickfixウィンドウへ移動
"				多数のウィンドウを開いていても、一度でQuickfixウィンドウに移動出来ます。
" 				5<C-w>. のようにカウント指定すると指定サイズの高さに変更されます。
" 				Quickfixウィンドウ上ではウィンドウ高さをデフォルトに戻します。
"<C-w>/ 		以降使用するウィンドウを QuickFix/ロケーションリストにトグル切替
"q 	 Quickfixウィンドウのクローズ
"<CR>
"	 ファイルを開く。
"	3<CR>のように番号を指定すると対応する行のファイルを開く。
"	ビジュアルモードで選択している場合は選択ファイルをすべて開く。
"<S-CR> 	 画面分割でファイルを開く
"<C-l>		 QuickFixウィンドウに表示されているパスを最も短く表示されるようにする
"&			 QuickFixウィンドウをロケーションリストへコピー
"<C-g> "	 QuickFixウィンドウをQFixListへコピー
"}}}
"**************************************************
" * plugin: memolist - (memo-list, memo) {{{
"map <Leader>mn  :MemoNew<CR>
"map <Leader>ml  :MemoList<CR>
"map <Leader>mg  :MemoGrep<CR>

nnoremap ,mn  :<C-u>MemoNew<CR>
nnoremap ,ml  :<C-u>MemoList<CR>
nnoremap ,mg  :<C-u>MemoGrep<CR>

" ファイルの置き場所
let g:memolist_path = "~/memo/memolist"

" suffix type (default markdown)
let g:memolist_memo_suffix = "markdown"
let g:memolist_memo_suffix = "md"

" date format (default %Y-%m-%d %H:%M)
let g:memolist_memo_date = "%Y-%m-%d %H:%M"
let g:memolist_memo_date = "epoch"
let g:memolist_memo_date = "%D %T"

" tags prompt (default 0)
let g:memolist_prompt_tags = 1

" categories prompt (default 0)
let g:memolist_prompt_categories = 1

" use qfixgrep (default 0)
"let g:memolist_qfixgrep = 1

" use vimfler (default 0)
"let g:memolist_vimfiler = 1

" remove filename prefix (default 0)
"let g:memolist_filename_prefix_none = 1

" use unite (default 0)
"let g:memolist_unite = 1

" use arbitrary unite source (default is 'file')
"let g:memolist_unite_source = "file_rec"

" use arbitrary unite option (default is empty)
"let g:memolist_unite_option = "-auto-preview -start-insert"

" use denite (default 0)
"let g:memolist_denite = 1

" use arbitrary denite source (default is 'file_rec')
"let g:memolist_denite_source = "anything"

" use arbitrary denite option (default is empty)
"let g:memolist_denite_option = "anything"

" use various Ex commands (default '')
"let g:memolist_ex_cmd = 'CtrlP'
"let g:memolist_ex_cmd = 'NERDTree'

" use delimiter of array in yaml front matter (default is ' ')
let g:memolist_delimiter_yaml_array = ','
" use when get items from yaml front matter
" first line string pattern of yaml front matter (default "==========")
"let g:memolist_delimiter_yaml_start = "---"

" last line string pattern of yaml front matter (default "- - -")
"let g:memolist_delimiter_yaml_end  = "---"

"}}}
"**************************************************
" * plugin: vim-bookmarks (bookmark) {{{
let g:bookmark_highlight_lines = 1         " ブックマークした行のハイライトを有効化
let g:bookmark_sign = '>>'
let g:bookmark_annotation_sign = '##'

let g:bookmark_save_per_working_dir = 1
""Change file for auto saving (default $HOME .'/.vim-bookmarks'):
""let g:bookmark_auto_save_file = '/tmp/my_bookmarks'

"------------------------
"Add/remove bookmark at current line				mm:         BookmarkToggle
"Add/edit/remove annotation at current line			mi:         BookmarkAnnotate <TEXT>
"Jump to next bookmark in buffer					mn:         BookmarkNext
"Jump to previous bookmark in buffer				mp:         BookmarkPrev
"Show all bookmarks (toggle)						ma:         BookmarkShowAll
"Clear bookmarks in current buffer only				mc:         BookmarkClear
"Clear bookmarks in all buffers						mx:         BookmarkClearAll
"Move up bookmark at current line					[count]mkk: BookmarkMoveUp [<COUNT>]
"Move down bookmark at current line 				[count]mjj: BookmarkMoveDown [<COUNT>]
"Move bookmark at current line to another line		[count]mg: BookmarkMoveToLine <LINE>
"Save all bookmarks to a file:                              BookmarkSave <FILE_PATH>
"Load bookmarks from a file:                                BookmarkLoad <FILE_PATH>
"------------------------
" ブックマーク文字の色設定
"highlight BookmarkSign           guifg=#FF7C6C
"highlight BookmarkAnnotationSign guifg=#FF7C6C
"highlight BookmarkLine           guifg=#FF7C6C
"highlight BookmarkAnnotationLine guifg=#FF7C6C
"------------------------
"let g:bookmark_no_default_key_mappings = 1 " デフォルトのキーマッピングを無効化
"" NerdTreeを考慮したキーバインドの有効/無効化
"function! BookmarkMapKeys()
"  nmap mm  :BookmarkToggle<CR>
"  nmap mi  :BookmarkAnnotate<CR>
"  nmap mn  :BookmarkNext<CR>
"  nmap mp  :BookmarkPrev<CR>
"  nmap mo  :BookmarkShowAll<CR>
"  nmap mc  :BookmarkClear<CR>
"  nmap mx  :BookmarkClearAll<CR>
"  nmap mkk :BookmarkMoveUp<CR>
"  nmap mjj :BookmarkMoveDown<CR>
"endfunction
"function! BookmarkUnmapKeys()
"  unmap mm
"  unmap mi
"  unmap mn
"  unmap mp
"  unmap mo
"  unmap mc
"  unmap mx
"  unmap mkk
"  unmap mjj
"endfunction
"
"------------------------
"autocmd BufEnter *           :call BookmarkMapKeys()
"autocmd BufEnter NERD_tree_* :call BookmarkUnmapKeys()
"------------------------
"}}}
"**************************************************
" * plugin: IME制御 im_control.vim (im_control, im-control,ime) {{{
" ESCでIMEを確実にOFF
" 外部のIMEだとうまくきかない？
"inoremap <ESC> <ESC>:set iminsert=0<CR>


"IMEをONにする
"$ fcitx-remote -o
"IMEをOFFにする
"$ fcitx-remote -c

function! ImInActivate()
  call system('fcitx-remote -c')
endfunction
inoremap <silent> <C-[> <ESC>:call ImInActivate()<CR>
"### C-jでノーマルモードに移行する
inoremap <silent> <C-j> <ESC>:call ImInActivate()<CR>



" }}}
"**************************************************
" autocmdでのファイル個別設定
"**************************************************
" * autocmd: MQL4の編集用 {{{
autocmd FileType mql4 setlocal autoindent
autocmd FileType mql4 setlocal smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
"autocmd FileType mql4 setl tabstop=4 noexpandtab shiftwidth=4 softtabstop=4
autocmd FileType mql4 setlocal tabstop=4 shiftwidth=4 softtabstop=4
" }}}
"**************************************************
" * autocmd: python用　tabをspaceに置き換える(他のツールが設定していると上書きされる可能性がある) "{{{
" pluginで代用する. 
" Please note that Kirill Klenov’s python-mode ships its own version of this bundle. 
" Therefore, if you want to use this version specifically, you’ll have to disable python-mode’s using:
"let g:pymode_indent = 0
" python-modeとかぶる場合は変更が必要:
"autocmd FileType python setl autoindent
"autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
"autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4
"}}}
"**************************************************
" * autocmd: 前回終了したカーソル行に移動 {{{
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
"}}}
"**************************************************
" colorscheme gvimrcにあるのも面倒なので移動 {{{

"colorscheme anokha

colorscheme darkbone
"カラー設定:  「IMEの状態でカーソルの色を変更する」
"colorscheme af
"colorscheme adaryn
"colorscheme darkbone
"colorscheme harlequin
"colorscheme astroboy

"前はこれだった
"colorscheme hemisu
"set background=dark

"わりと見づらい
"colorscheme brookstream
"
 " -- solarized personal conf
"set background=dark
"try
"    colorscheme solarized
"catch
"endtry

"colorscheme adrian
"}}}
"**************************************************
" * FocusMode (なにこれ？) {{{
function! ToggleFocusMode()
  if (&foldcolumn != 12)
    set laststatus=0
    set numberwidth=10
    set foldcolumn=12
    set noruler
    hi FoldColumn ctermbg=none
    hi LineNr ctermfg=0 ctermbg=none
    hi NonText ctermfg=0
  else
    set laststatus=2
    set numberwidth=4
    set foldcolumn=0
    set ruler
    colorscheme molokai "re-call your colorscheme
  endif
endfunc
nnoremap  :call ToggleFocusMode()
" }}}
"**************************************************
" memo(メモ わからなかったこととかの) {{{
"空行削除
  ":g/^$/d
"
"貼り付け時のインデントずれの対処
  "  vimに貼り付けたときにインデントがずれるのは、自動インデントが有効なためによる。
  "  無効にしてから、貼り付ければよい。
  ":set autoindent　自動インデント有効
  ":set noautoindent　自動インデント無効
"入力補完
    "  長い名前を持つ変数等を入力するときに積極的に使いたい。
    "
    "  ctrl + n　ファイル後方に向けて補完候補を探す
    "  ctrl + p　ファイル先頭に向けて補完候補を探す

"^M(CR)の入力
  "  たまにしか出てこないから、忘れがち。
  "  ctrl+v ctrl+m

"netrw.vim（vimモードでエクスプローラ）
  "
  "ディレクトリをviすると、viモードでディレクトリ、ファイル操作ができる。
  "- １コ上の階層へ移動
  "enter 選択中のディレクトリへ移動、またはファイルを開く
  "t 別ウィンドウでファイルまたはディレクトリを開く
  "D 削除
  "R 名前変更
  "s ソート順変更
  "x ファイル実行
  "※ディレクトリを-enterで移動して、ファイルをtで開くと快適

"行内検索
    "f[文字] カーソルから行末に向かって文字を検索。
    ";直前のf[文字]の繰り返し
    ",直前のf[文字]の繰り返し（逆方向）
    "
    "cやdと組み合わせると便利
    "cf[文字]カーソルから文字までを編集
    "cd[文字]カーソルから文字までを削除
"文書の 再整形
    "http://vim-jp.org/vimdoc-ja/usr_25.html
    "選択してgq
    "gqは、formatexprで決まる.
"開発などで改行がないXMLをvimでお手軽に整形するコマンドです。
    ":%s/></>\r</g | filetype indent on | setf xml | normal gg=G
    " もしくは
    " :%s/></>^M</g | filetype indent on | setf xml | normal gg=G
    " ^Mは^とMの2文字ではなく、Ctrl-Vの後にEnterを入力した1文字です。
    "
"「|」によるコマンドの連続実行 (vimエディタ話)
    " "vimエディタでは、exモードでコマンドを入力する時に、
    " 「|」で区切って、複数のコマンドを入力すると、
    " 連続してそれらのコマンドを(一度に)実行できます。
    " 例を挙げると、以下のようなことができます。
    " " 例.ファイルを保存して終了。「:wq」と同じ。
    " :w | :q
    " 
    " " 例.置換を実行してから保存。
    " :%s/pre/post/g | :w
"シェルでプログラムを実行
    "!をつけることで外部プログラムを実行できる 例):!ls
    "現在編集中ファイルの省略記号である%を使うことで、編集中のプログラム実行も簡単にできる
    "例):!ruby %
    ":shellで対話型シェルセッションが実行可能。exitコマンドでシェルを終了してvimに復帰する
    ":read !{cmd}でコマンド実行結果の標準出力を、カーソル行の下に挿入できる★
"**************************************************
" ファイルの開き直し {{{
":e ++enc=euc-jp
":e ++ff=unix
"}}}
"}}}
"**************************************************
" Kill Bells {{{
" set vb t_vb=
" if has("autocmd") && has("gui")
"   au GUIEnter * set t_vb=
" endif
" }}}
"**************************************************
"**************************************************
" 互換モード再設定
"**************************************************
" 互換モード再設定 {{{
set nocompatible
"filetype plugin on
filetype plugin indent on
syntax on
"}}}
"**************************************************
"[End]
