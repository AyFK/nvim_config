"————————————————
" Plugins
"————————————————
call plug#begin()

    " colors
	Plug 'nanotech/jellybeans.vim'
    "Plug 'ray-x/aurora'
	"Plug 'skbolton/embark'
    "Plug 'ghifarit53/tokyonight-vim'

    Plug 'preservim/nerdtree'
	Plug 'sheerun/vim-polyglot'
	Plug 'dominikduda/vim_current_word'
	
	" <Tab> everything!
	Plug 'ervandew/supertab'

	Plug 'junegunn/rainbow_parentheses.vim'

	"Plug 'ryanoasis/vim-devicons'

   	" A pretty statusline
    Plug 'itchyny/lightline.vim'

    " Accelerate up-down
    Plug 'rhysd/accelerated-jk'


    Plug 'powerline/fonts'
    "Plug 'ryanoasis/nerd-fonts'
    "Plug 'ryanoasis/vim-devicons'
    Plug 'lervag/vimtex'

    "Plug 'tomlion/vim-solidity'

    Plug 'jlobos/camila'
    Plug 'alligator/accent.vim'

    " git path
    Plug 'itchyny/vim-gitbranch'

call plug#end()



"————————————————
" nvim essentials
"————————————————
colorscheme jellybeans                          " jellybeans hands down best colorscheme

highlight CursorLine guibg=#211f1f          " for camila


set shell=cmd.exe "bash.exe                     " replace cmd with bash
set showtabline=0                               " remove tab GUI
set mouse=a                                     " enable mouse
set cursorline                                  " highlight cursor line
set nowrap                                      " txt adj. when resizing window
set scrolloff=3                                 " lines above/below cursor
set ts=4 sw=4 et                                " tab == 4 whitespaces
set laststatus=2                                " always show statusline
set splitright                                  " vsplits go right w/focus
set splitbelow                                  " splits go below w/focus
set list                                        " allows us to set listchars
set listchars=tab:\ \ ,trail:█                  " tab + empty char symbol
set number relativenumber                       " row indices
set virtualedit=onemore                         " end of row extended by 1


highlight OverLength guibg=#3D3D3D              " highlight color
match OverLength /\%81v.\+/                     " highlight char >= 81
autocmd BufEnter * GuiFont! Hack:h10
tnoremap <Esc> <C-\><C-n><CR>                   " terminal mode into normal mode


" Disable Arrow keys in Normal mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Disable Arrow keys in Insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" move with ALT + hjkl in insert mode
inoremap <A-h> <Left>
inoremap <A-j> <Down>
inoremap <A-k> <Up>
inoremap <A-l> <Right>


noremap <C-h> <C-Left>
noremap <C-l> <C-Right>

" 2x fast view scroll
noremap <expr> <C-k> "2\<C-y>"
noremap <expr> <C-j> "2\<C-e>"


"————————————————
" SHELLS
"————————————————
"                 — DEPENDENCIES —
" vim-plug(s)                       : None
" PATH environmental variables(s)   : C:\Windows\System32, C:\...\Git\bin

command CMDexe set shell=cmd.exe
command BASHexe set shell=bash.exe


"————————————————
" Python
"————————————————
"                 — DEPENDENCIES —
" vim-plug(s)                       : None
" PATH environmental variables(s)   : C:\Users\...\Python

command PR w <bar> rightbelow vsplit <bar> execute 'CMDexe' <bar>
\ term python % %%:set wrap " save + compile + run Python code using python.exe

command Pr w <bar> rightbelow vsplit <bar> execute 'CMDexe' <bar>
\ term python % %%:set wrap " save + compile + run Python code using python.exe

autocm FileType python setlocal indentexpr=     " .py newline freeze solution


"————————————————
" C++17
"————————————————
"                 — DEPENDENCIES —
" vim-plug(s)                       : None
" PATH environmental variables(s)   : C:\Users\...\CodeBlocks\MinGW\bin

" save + compile using 'c++.exe'
command CC w <bar> !c++ -std=c++17 % -o %:r	

" save + compile using 'c++.exe'
command Cc w <bar> !c++ -std=c++17 % -o %:r

" run C++17 code
command CR vsplit <bar> te %:r

" run C++17 code
command Cr vsplit <bar> te %:r


"————————————————
" CUDA
"————————————————
"                 — DEPENDENCIES —
" vim-plug(s)                       : None
" PATH environmental variables(s)   : C:\...\NVIDIA ... Toolkit\CUDA\vXX.X\bin

command GG w <bar> !nvcc % -o %:r		" save + compile using 'nvcc.exe'

command Gg w <bar> !nvcc % -o %:r		" save + compile using 'nvcc.exe'

command GR vsplit <bar> te %:r			" run CUDA code

command Gr vsplit <bar> te %:r			" run CUDA code


"————————————————
" LaTeX
"————————————————
"                 — DEPENDENCIES —
" vim-plug(s)                       : vimtex
" PATH environmental variables(s)   : C:\Users\...\Evince-X.XX.X\bin

let g:vimtex_view_general_viewer = 'evince'	" view pdf;s using 'envice.exe'

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
" Solidity etc.
"————————————————
"                 — DEPENDENCIES —
" vim-plug(s)                       : vimtex
" PATH environmental variables(s)   : C:\Users\...\Evince-X.XX.X\bin
"
" macro opens local ethereum emulator
tnoremap ethnet export NODE_OPTIONS=--openssl-legacy-provider && ganache-cli

" macro goes to current file directory, opens new tab, opens terminal,
" ENTER, opens vertical split, opens another terminal, calls macro 'ethnet',
" ENTER.
map eth :lchdir %:h <bar> :tabnew <bar> execute 'BASHexe' <bar> :terminal <CR>
\ <bar> :vs <bar> :terminal <CR> <bar> i ethnet <CR>


" eth (h)ard (f)ork
"tnoremap ett export NODE_OPTIONS=--openssl-legacy-provider && ganache-cli && --fork=http://infura.io/mainnet

"map ed :lchdir %:h <bar> :tabnew <bar> execute 'BASHexe' <bar> :terminal <CR>
"\ <bar> :vs <bar> :terminal <CR> <bar> i ett <CR>





"————————————————
" Makefile
"————————————————
"                 — DEPENDENCIES —
" vim-plug(s)                       : None
" PATH environmental variables(s)   : C:\Users\...\CodeBlocks\MinGW\bin

command Make w <bar> cd %:h <bar>               " save + makefile using 'mingw32-make.exe'
\ !mingw32-make -f %


"————————————————
" Fold settings
"————————————————
"                 — DEPENDENCIES —
" vim-plug(s)                       : None
" PATH environmental variables(s)   : None

" use sapce-bar BOTH for opening and closing folds
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>

" pressing 'o' within fold creates a new line within fold
nnoremap <expr> o foldlevel('.') && foldclosed('.') == -1 ? "A\<CR>" : "o"

set foldmethod=manual                           " manual folding
set foldcolumn=1                                " folded line symbol (+) and (-)
highlight FoldColumn guifg=#F2AA0D              " folded line symbol color
highlight Folded guibg=242                      " remove line highlight color
set fillchars=fold:\                            " remove line highlight symbol

function! LoadView() abort
    try
        loadview
    catch /E484/
        return
    endtry
endfunction

augroup remember_folds                          " remeber folds
    autocmd!
    autocmd BufWinLeave ?* mkview | filetype detect
    autocmd BufWinEnter ?* call LoadView() | filetype detect
augroup END



"————————————————
" Git
"————————————————
"
tnoremap gt echo ˉ && git log --graph --date-order -C -M --pretty=format:"<%h>
\ %ad %Cgreen%d%Creset %s" --all --date=short <CR>

au FocusGained,BufEnter * :checktime




map T :vs <bar> cd %:h <bar> :terminal <CR>     " open terminal w/ vsplit
map t :lchdir %:h <bar> :tabnew <bar> terminal <CR>  " open terminal w/ tabnew

map <silent> <C-2> :tabn <CR>                   " CTRL + 1 - jump to left tab
map <silent> <C-1> :tabp <CR>                   " CTRL + 2 - jump to right tab

nnoremap <A-1> <C-w>W                           " ALT + 1 - jump to left split
nnoremap <A-2> <C-w>w                           " ALT + 2 - jump to right split

" CTRL + UP or DOWN arrow to move while curser stays on the same line
nnoremap <C-Up> <C-y>                           " CTRL + UP - move w/out curser
nnoremap <C-Down> <C-e>                         " CTRL + DO- move w/out courser

" CTRL + UP or DOWN arrow to move while curser stays on the same line
nnoremap <C-Up> <C-y>
nnoremap <C-Down> <C-e>

" clear the last used search pattern
cmap // let @/ = ""
" open new tab
cmap newt tabnew



"————————————————
" Plugins settings
"————————————————


" do not highlight current word
let g:vim_current_word#highlight_current_word=0

"colorscheme "tokyonight embark

map <silent> <C-n> :NERDTreeFocus<CR>           " CTRL + n to pull up NERDTree

autocm FileType python,cpp,javascript,solidity
\ cd ~/Desktop                                  " NERDTree desktop dir

  " NOTE: med: 'u' hoppar du tillbaka ett CWD
let NERDTreeMapOpenInTab='<TAB>'                " new tab with TAB in NERDTree
let NERDTreeShowLineNumbers=1                   " display numbers in NERDTree
let NERDTreeMinimalUI = 1                       " minimal UI

autocm FileType nerdtree setlocal nornu         " norelativenumber in NERDTree
autocm FileType python,cpp RainbowParentheses   " R. Parentheses in .py and .cpp


let g:accelerated_jk_acceleration_table = [1,2] " acceleration steps
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)







"————————————————
" Statusline settings
"————————————————
"                 — DEPENDENCIES —
" vim-plug(s)                       : lightline
" PATH environmental variables(s)   : None
let g:lightline = {
\   'colorscheme':'one',
\   'separator': { 'left': '', 'right': '' },
\   'subseparator': { 'left': '', 'right': '' },
\   'active': {
\   'left': [ [ 'mode', "paste" ], [ 'statuslinetabs' ] ],
\   'right': [ ['lineinfo'], ['percent'], ['gitbranch'] ],
\ },
\   'component_expand': {
\   'statuslinetabs': 'LightlineStatuslineTabs',
\},
\   'component_function': {
\   'gitbranch': 'gitbranch#name'
\},
\}

" tab GUI replacement
function! LightlineStatuslineTabs() abort
    return join(map(range(1, tabpagenr('$')),
    \'(v:val == tabpagenr() ? "⌜➤⌟ " : "⌜ ⌟ ") . lightline#tab#filename(v:val)'),
    \"  ")
endfunction
