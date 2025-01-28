" if you get an E5113 error or similar, simply:
" (1) nvim vimscripts.vim
" (2) :set fileformat=unix
" (3) :x
" now the init.lua file should work as expected.


"——————————————————————————————————————————————
"
" file for when .lua solution is more difficult
"
"——————————————————————————————————————————————

" show tab number for easier navigation
function! MyTabLine()
  let s = ""
  for i in range(1, tabpagenr("$"))
    " get the file name for the current tab
    let bufname = bufname(tabpagebuflist(i)[tabpagewinnr(i) - 1])
    let filename = fnamemodify(bufname, ":t")  " extract only the file name
    let filename = filename != "" ? filename : "Untitled"  " default name

    " highlight the active tab and format with brackets
    if i == tabpagenr()
      let s .= "%#TabLineSel#" . i . ": " . filename . "%T "
    else
      let s .= "%#TabLine#[" . i . ": " . filename . "]%T "
    endif
  endfor
  return s
endfunction

set tabline=%!MyTabLine()


" pressing 'o' within fold creates a new line within fold
nnoremap <expr> o foldlevel(".") && foldclosed(".") == -1 ? "A\<CR>" : "o"


" loads weird in .lua, load colorscheme here instead
let install_path = stdpath("data") . "/site/pack/packer/start/darkplus.nvim"
if isdirectory(install_path)
    colorscheme darkplus
else
    colorscheme wildcharm
end





"————————————————
" LaTeX
"————————————————
"                 — DEPENDENCIES —
" vim-plug(s)                       : vimtex
" PATH environmental variables(s)   : C:\Users\...\Evince-X.XX.X\bin


command CMDexe set shell=cmd.exe

" view pdf;s using 'envice.exe'
let g:vimtex_view_general_viewer = 'evince'

" save + compile pdf;s
command LL w <bar> execute 'CMDexe' <bar> cd %:h <bar> execute
\ '!pdflatex' expand('%:S')

" save + compile pdf;s
command Ll w <bar> execute 'CMDexe' <bar> cd %:h <bar> execute
\ '!pdflatex -synctex=1 -interaction=nonstopmode -shell-escape' expand('%:S')

" save + compile + view pdf;s
command LR w <bar> execute 'CMDexe' <bar> cd %:h <bar> execute
\ '!pdflatex' expand('%:S') <bar> exec "norm \\lv"

" save + compile + view pdf;s
command Lr w <bar> execute 'CMDexe' <bar> cd %:h <bar> execute
\ '!pdflatex' expand('%:S') <bar> exec "norm \\lv"



"————————————————
" Git
"————————————————
"
tnoremap gc echo ˉ && git log --graph --date-order -C -M --pretty=format:"<%h>
\ %ad [%an] %Cgreen%d%Creset %s" --all --date=short <CR>
