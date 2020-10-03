set encoding=utf-8
set number
" set tabstop=4
" set shiftwidth=4
" set softtabstop=4
" set expandtab
set autoindent
set smartindent
set cindent
set cinoptions+=g0
set mouse=a
set tw=79
set fo+=t
set diffopt=vertical
colo gruvbox
" syntax on
" colo dracula
set termguicolors
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

function! SetGitDir()
    " Change working dir to the current file
    cd %:p:h
    " Set 'gitdir' to be the folder containing .git
    let gitdir=system("git rev-parse --show-toplevel")
    " See if the command output starts with 'fatal' (if it does, not in a git repo)
    let isnotgitdir=matchstr(gitdir, '^fatal:.*')
    " If it empty, there was no error. Let's cd
    if empty(isnotgitdir)
        cd `=gitdir`
    endif
    return gitdir
endfunction

" let g:gitdir = SetGitDir()
"function! BuildComposer(info)
"  if a:info.status != 'unchanged' || a:info.force
"    !cargo build --release
"  endif
"endfunction

call plug#begin('~/.nvim/plugged')
    Plug 'heavenshell/vim-pydocstring'
"    Plug 'scrooloose/vim-slumlord'
    Plug 'aklt/plantuml-syntax'
"    Plug 'powerline/powerline-fonts'
    Plug 'powerman/vim-plugin-AnsiEsc'
    Plug 'vim-syntastic/syntastic'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'tpope/vim-fugitive'
    Plug 'rhysd/vim-clang-format'
    Plug 'scrooloose/nerdtree' ", {'on': 'NERDTreeToggle'}
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'jistr/vim-nerdtree-tabs'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'easymotion/vim-easymotion'
"    Plug 'SirVer/ultisnips'
    Plug 'Shougo/echodoc.vim'
    Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'vim-scripts/Conque-GDB'
    Plug 'vim-scripts/DoxygenToolkit.vim'
" use ncm2 jedi instead -----------------------
    Plug 'davidhalter/jedi'
    Plug 'deoplete-plugins/deoplete-jedi'
    if has('nvim')
      Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    else
      Plug 'Shougo/deoplete.nvim'
      Plug 'roxma/nvim-yarp'
      Plug 'roxma/vim-hug-neovim-rpc'
    endif
    Plug 'zchee/deoplete-go', { 'do': 'make'}
    Plug 'zchee/deoplete-clang'
" ----------------------------------------------
"    Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
"    Plug 'suan/vim-instant-markdown'
"    Plug 'neovim/node-host', { 'do' : 'npm install' }
"    Plug 'vimlab/mdown.vim', { 'do' : 'npm install' }
"    Plug 'ternjs/tern_for_vim'
"    Plug 'zchee/libclang-python3'
"    Plug 'Rip-Rip/clang_complete'
"    Plug 'lyuts/vim-rtags'
"    Plug 'https://github.com/vhdirk/vim-cmake.git'
"    Plug 'Valloric/YouCompleteMe'
    Plug 'bronson/vim-trailing-whitespace'
"    Plug 'tibabit/vim-templates'
    Plug 'aperezdc/vim-template'
    Plug 'nvie/vim-flake8'
    Plug 'python-mode/python-mode', { 'branch': 'develop' }
    Plug 'sbdchd/neoformat'
    Plug 'elzr/vim-json'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'MikeCoder/markdown-preview.vim'
    Plug 'tpope/vim-jdaddy'
    Plug 'google/vim-maktaba'
    Plug 'google/vim-codefmt'
    Plug 'google/vim-glaive'
    Plug 'alepez/vim-gtest'
" themes
    Plug 'dracula/vim',{'as':'dracula'}
    Plug 'morhetz/gruvbox'
    " linters
"    Plug 'dense-analysis/ale'


"    " Better Visual Guide
""    Plug 'w0rp/ale'
"    Plug 'Yggdroot/indentLine'
"    " syntax check
"    " Autocomplete
"    Plug 'ncm2/ncm2'
"    Plug 'roxma/nvim-yarp'
"    Plug 'ncm2/ncm2-bufword'
"    Plug 'ncm2/ncm2-path'
"    Plug 'ncm2/ncm2-jedi'
"    " Formater
"    Plug 'Chiel92/vim-autoformat'
call plug#end()


" Python
let g:python3_host_prog="/usr/bin/python3.6"
let g:pymode_python = 'python3'
let g:templates_directory = ['~/.vim-templates']


let g:gtest#gtest_command = "ctest"

" Using ncm2 for now....
" Use deoplete.
let g:deoplete#enable_at_startup = 1
call deoplete#enable()
set laststatus=2
let mapleader=","
let g:nerdtree_tabs_open_on_console_startup=0
let g:deoplete#enable_at_startup=0
let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-3.8/lib/libclang.so'
let g:deoplete#sources#clang#libclang_header = '/usr/lib/llvm-3.8/include'
"let g:deoplete#sources#clang#clang_complete_database = ''
" --------------------------------------------------------
" let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
set guicursor=
"let ggdir = substitute(g:gitdir, '^\s*\(.\{-}\)\s*$', '\1', '')

" syntastic
" let g:syntastic_debug = 255
" let g:syntastic_c_compiler = 'clang'
" let g:syntastic_cpp_compiler = 'clang++'
" let g:syntastic_c_checkpatch_exec = '~/.local/'bin/checkpatch.pl'
" let g:syntastic_c_checkers = ['gcc']
" let g:syntastic_cpp_checkers = ['gcc']
" let g:syntastic_c_clang_check_args = '-p ' . ggdir
" let g:syntastic_cpp_clang_check_args = '-p ' . ggdir
" let g:syntastic_c_clang_check_post_args = ""
" let g:syntastic_cpp_clang_check_post_args = ""
" 
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" 
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 1
" " let g:syntastic_enable_signs=0
" let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

" airline
let g:airline_powerline_fonts=1
" let g:airline_powerline_fonts = 1
" let g:airline_symbols_ascii = 1
" let g:airline#extensions#tabline#enabled=1
" let g:airline#extensions#tabline#fnamemod = ':t'

" DoxygenToolkit
let g:DoxygenToolkit_commentType="C"

" QuickFix window
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" deoplete tab complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

"tern
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDev<CR>

" C
autocmd FileType c setlocal shiftwidth=8 tabstop=8 noexpandtab
" C++
autocmd FileType cpp setlocal shiftwidth=2 tabstop=2 expandtab
" CMake
autocmd BUfRead,BufNewFile *.cmake,CMakeLists.txt setlocal shiftwidth=4 tabstop=4 expandtab
" "YouCompleteMe
" let g:ycm_register_as_syntastic_checker = 1
" let g:ycm_server_python_interpreter='/usr/bin/python'
" let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
" let g:ycm_auto_trigger = 1
" let g:ycm_autoclose_preview_window_after_completion = 1

"InstantMarkdown
"let g:instant_markdown_open_to_the_world = 1

"CTRL-P
let g:ctrlp_custom_ignore = '\v[\/](build)|(\.(git))'

" template
let g:templates_directory = '~/.vim-templates'

let g:syntastic_python_pylint_quiet_messages = { "level" : ["warnings"] }
let g:syntastic_python_checkers = ['python3']

" go
let g:deoplete#sources#go#gocode_binary = '/home/rrojo/go/bin/gocode'

" NERDTreeToggle
" autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
let NERDTreeShowHidden=1

" autocmd vimenter * exe 'NERDTree' SetGitDir()
" autocmd VimEnter * if isdirectory(".git") && !exists("s:std_in") | exe 'NERDTree' gitdir  | wincmd p | ene | endif

" if filereadable("CMakeLists.txt") && isdirectory("build") && isdirectory(".git")
" 	let root = getcwd()
" 	lcd build
" endif

autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | exe 'NERDTree' SetGitDir() | endif

com Cmake call CMakeBuild()
com CMake call CMakeBuild()
function! CMakeBuild()
	if filereadable("CMakeLists.txt") && isdirectory(".git")
		let g:cwd = getcwd()

		if !isdirectory("build")
			call system("mkdir build")
		endif
		lcd build
	endif
	if !filereadable("CMakeCache.txt")
		call system("cmake" . g:cwd)
	endif
	:make
endfunction

