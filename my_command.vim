"-----------------------------------------------------------------------------
" 色を変更
let s:color_lst = [
			\'adaryn'
			\,'darkbone'
			\,'anokha'
			\,'astroboy'
			\,'brookstream'
			\,'harlequin'
			\,'hemisu'
			\]

let s:color_idx = 0
function! s:MyColorChange(inc)
	":tabedit `=resolve(expand('~/.vim/my_command.vim'))`<CR>
	" 文字列は"で記載しないと展開されないので注意！！！
	let cmd_str = ":colorscheme " . s:color_lst[s:color_idx] ."\<CR>"
	:call feedkeys(cmd_str, 'n')
	":echo cmd_str
	let idx = (s:color_idx+a:inc)
	if idx < 0
		let idx = len(s:color_lst) - 1
	endif
	let s:color_idx = idx % len(s:color_lst)
endf
" 入力での引数なしで決め打ち引数
command!  MyColorChangeInc :call s:MyColorChange(1)
command!  MyColorChangeDec :call s:MyColorChange(-1)

"-----------------------------------------------------------------------------
"-----------------------------------------------------------------------------
"-----------------------------------------------------------------------------
" function! MyCmdBundleRead()
" 	:tabedit `=resolve(expand('~/.vim/read_neobundle.vim'))`<CR>
" endf
" 
" command! Vimset :call MyVimsetCmd()
" command! MyBundleRead  :call MyCmdBundleRead()
"-----------------------------------------------------------------------------
function! MyCmdRead()
	:tabedit `=resolve(expand('~/.vim/my_command.vim'))`<CR>
endf
command! MyCmd :call MyCmdRead()
"-----------------------------------------------------------------------------
"-----------------------------------------------------------------------------
"現在開いているファイルのディレクトリを開く
function! MyCmd_CurrentFileDir()
	if has('win32') || has('win64')
	else 
		" command! -nargs=0 CdCurrent cd %:p:h
		" をパクる
		:!thunar %:p:h &
	endif 
endf
command! CurFileDir :call MyCmd_CurrentFileDir()
"-----------------------------------------------------------------------------
" Memo 関数定義 
"-----------------------------------------------------------------------------
" memo
function! Memo()
	if has('win32')
		if hostname() ==? 'amon-desktop'
			:tabnew D:/memo.lst
		else 
			:tabnew C:/memo.lst
		endif 
	else 
		:tabnew ~/memo.lst
	endif 
endf
command! Memo :call Memo()
"-----------------------------------------------------------------------------
function! TSum(v1,v2)
	"return a:v1 + a:v2
	echo a:v1 + a:v2
endfunction 
command!  -nargs=+ TestSum :call TSum(<f-args>)
"-----------------------------------------------------------------------------
function! s:tsum(v1,v2)
	"return a:v1 + a:v2
	echo a:v1 + a:v2
endfunction 
command!  -nargs=+ TestSum2 :call s:tsum(<f-args>)
"-----------------------------------------------------------------------------
"-----------------------------------------------------------------------------
" inoremap:挿入モードのときのkeymap定義する機能 
" nnoremap:viewモード?時のkeymap定義する機能 
" vnoremap:visualモード時のkeymap定義する機能 
"-----------------------------------------------------------------------------
" inoremap で挿入モードに移動するmap
"    inoremap <Leader>a <Home>
"    inoremap <C-e> <End>
"    inoremap <C-d> <Del>
"    inoremap <C-h> <Left>
"    inoremap <C-j> <Down>
"    inoremap <C-k> <Up>
"    inoremap <C-l> <Right>
"-----------------------------------------------------------------------------
"日付挿入マクロ
"-----------------------------------------------------------------------------
"inoremap <Leader>date <C-R>=strftime('%Y/%m/%d (%a)')<CR>
"inoremap <Leader>time <C-R>=strftime('%H:%M')<CR>
"inoremap <Leader>w3cd <C-R>=strftime('%Y-%m-%dT%H:%M:%S+09:00')<CR>
"-----------------------------------------------------------------------------
