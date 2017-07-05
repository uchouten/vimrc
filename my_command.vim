"-----------------------------------------------------------------------------
" $B?'$rJQ99(B
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
	" $BJ8;zNs$O(B"$B$G5-:\$7$J$$$HE83+$5$l$J$$$N$GCm0U!*!*!*(B
	let cmd_str = ":colorscheme " . s:color_lst[s:color_idx] ."\<CR>"
	:call feedkeys(cmd_str, 'n')
	":echo cmd_str
	let idx = (s:color_idx+a:inc)
	if idx < 0
		let idx = len(s:color_lst) - 1
	endif
	let s:color_idx = idx % len(s:color_lst)
endf
" $BF~NO$G$N0z?t$J$7$G7h$aBG$A0z?t(B
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
"$B8=:_3+$$$F$$$k%U%!%$%k$N%G%#%l%/%H%j$r3+$/(B
function! MyCmd_CurrentFileDir()
	if has('win32') || has('win64')
	else 
		" command! -nargs=0 CdCurrent cd %:p:h
		" $B$r%Q%/$k(B
		:!thunar %:p:h &
	endif 
endf
command! CurFileDir :call MyCmd_CurrentFileDir()
"-----------------------------------------------------------------------------
" Memo $B4X?tDj5A(B 
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
" inoremap:$BA^F~%b!<%I$N$H$-$N(Bkeymap$BDj5A$9$k5!G=(B 
" nnoremap:view$B%b!<%I(B?$B;~$N(Bkeymap$BDj5A$9$k5!G=(B 
" vnoremap:visual$B%b!<%I;~$N(Bkeymap$BDj5A$9$k5!G=(B 
"-----------------------------------------------------------------------------
" inoremap $B$GA^F~%b!<%I$K0\F0$9$k(Bmap
"    inoremap <Leader>a <Home>
"    inoremap <C-e> <End>
"    inoremap <C-d> <Del>
"    inoremap <C-h> <Left>
"    inoremap <C-j> <Down>
"    inoremap <C-k> <Up>
"    inoremap <C-l> <Right>
"-----------------------------------------------------------------------------
"$BF|IUA^F~%^%/%m(B
"-----------------------------------------------------------------------------
"inoremap <Leader>date <C-R>=strftime('%Y/%m/%d (%a)')<CR>
"inoremap <Leader>time <C-R>=strftime('%H:%M')<CR>
"inoremap <Leader>w3cd <C-R>=strftime('%Y-%m-%dT%H:%M:%S+09:00')<CR>
"-----------------------------------------------------------------------------
