syntax on
filetype plugin on
filetype plugin indent on

"The below command automatically downloads and install vimplug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
	  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
	      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.local/share/nvim/plugged')

" " Declare the list of plugins.
	Plug 'junegunn/seoul256.vim'
	Plug 'sirver/ultisnips'
	Plug 'honza/vim-snippets'
	Plug 'neomake/neomake'
	Plug 'roxma/nvim-completion-manager'
"
" " List ends here. Plugins become visible to Vim after this call.
call plug#end()

"config for ultisnip
"let g:UltiSnipsSnippetsDir = "~/.local/share/nvim/UltiSnips"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"these lines are needed for syntastic plugin
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

set mouse=a

nnoremap <C-S-tab> :tabp<CR>
nnoremap <C-tab>   :tabn<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>
inoremap <C-S-w>   <Esc>:tabclose<CR>

set number
set cursorline
hi CursorLine cterm=none ctermbg=black
" auto-install vim-plug
" auto-install didnt work, i might have to manually install vim plug
"
"
map vt <Esc>:TagbarToggle<CR>
set ruler
set rulerformat=%55(%{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ %5l,%-6(%c%V%)\ %P%)
set statusline=%<%f%h%m%r%=%{strftime(\"%l:%M:%S\ \%p,\ %a\ %b\ %d,\ %Y\")}\ %{&ff}\ %l,%c%V\ %P

set foldmethod=syntax
set nofoldenable

"configs for neomake
call neomake#configure#automake('nrwi',500)

"""{--------enable verbose logging
let $NVIM_PYTHON_LOG_FILE="/tmp/nvim_log"
let $NVIM_NCM_LOG_LEVEL="DEBUG"
let $NVIM_NCM_MULTI_THREAD=0
let $NVIM_PYTHON_LOG_LEVEL="DEBUG"
"""----------"""}
