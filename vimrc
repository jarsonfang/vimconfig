set nocompatible    " be iMproved, required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug (Minimalist Vim Plugin Manager)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Download plug.vim and put it in the 'autoload' directory.
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" Automatic installation
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://gitee.com/jarsonfang/vim-plug/raw/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
"call plug#begin('~/.vim/plugged')
call plug#begin('~/.vim/bundle')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
"Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
"Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
"Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
"Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
"Plug '~/my-prototype-plugin'

" if you need Vim help for vim-plug itself, register vim-plug as a plugin
Plug 'junegunn/vim-plug'

"Plug 'tomasr/molokai'
"Plug 'altercation/vim-colors-solarized'

Plug 'kien/ctrlp.vim'
Plug 'mhinz/vim-grepper'
Plug 'majutsushi/tagbar'
Plug 'easymotion/vim-easymotion'

" Plug 'Valloric/YouCompleteMe', { 'do': 'git submodule update --init --recursive' }
Plug 'https://gitee.com/YouCompleteMe/YouCompleteMe.git',
    \ { 'do': 'git submodule update --init --recursive' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

"Plug 'dyng/ctrlsf.vim'
"Plug 'terryma/vim-multiple-cursors'

Plug 'vim-scripts/a.vim'
Plug 'vim-scripts/ShowMarks'
Plug 'vim-scripts/Marks-Browser'
Plug 'vim-scripts/TaskList.vim'
Plug 'vim-scripts/sessionman.vim'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'

Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'suan/vim-instant-markdown', { 'for': 'markdown' }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'stephpy/vim-yaml', { 'for': 'yaml' }
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'klen/python-mode', { 'for': 'python' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }

"Plug 'jakub-olczyk/cpp.vim'
Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

"Plug 'edkolev/tmuxline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'bronson/vim-trailing-whitespace'

" Initialize plugin system
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set utf8 as standard encoding
set encoding=utf-8
set termencoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,cp936

" Sets how many lines of history VIM has to remember
set history=50

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=

" When searching try to be smart about cases
set smartcase

" Show matching brackets when text indicator is over them
set showmatch

" do incremental searching
set incsearch

" A buffer becomes hidden when it is abandoned
set hidden

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" With a map leader it's possible to do extra key combinations
" like <Leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Syntax and colorscheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Workaround with tmux terminal
if exists('$TMUX')
  set term=screen-256color
endif

set t_Co=256 " Explicitly tell Vim that the terminal supports 256 colors

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if has("syntax")
  syntax on
endif

if &t_Co > 2 || has("gui_running")
  syntax enable
"  set hlsearch
endif

set conceallevel=2

"if has('gui_running')
"    set background=light
"else
"    set background=dark
"endif

set background=light

if &background == "light"
    let g:solarized_termcolors=256
    colorscheme solarized_my
else
    let g:rehash256=1
    colorscheme molokai_my
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" User interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn on the WiLd menu
set wildmenu

" Always show current position
set ruler

" Show line number
set number

" display incomplete commands
set showcmd

" Height of the command bar
set cmdheight=1

" Highlight the cursor line
set cursorline

" Set borderline (or reference line)
set colorcolumn=80 " or set cc=80, use set cc= to unset the option
"hi ColorColumn ctermbg=black

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set whichwrap+=<,>,h,l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tab & Spaces
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Expand tab with spaces
"set expandtab
"set tabstop=4
"set shiftwidth=4
set et ts=4 sw=4

set smarttab
set softtabstop=-1
nmap <Leader>rt :retab!<CR>

" Show tabs and trails
set list listchars=tab:→·,trail:·

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indenting C style text
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Manual (see :help usr_30)
"
" When you have code that is badly formatted, or you inserted and deleted lines,
" you need to re-indent the lines.  The "=" operator does this.  The simplest
" form is:
"
"   ==
"
" This indents the current line.  Like with all operators, there are three ways
" to use it.  In Visual mode "=" indents the selected lines.  A useful text
" object is "a{".  This selects the current {} block.  Thus, to re-indent the
" code block the cursor is in:
"
"   =a{
"
" I you have really badly indented code, you can re-indent the whole file with:
"
"   gg=G
"
" However, don't do this in files that have been carefully indented manually.
" The automatic indenting does a good job, but in some situations you might want
" to overrule it.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files, backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nowb
set nobackup

" Set to auto read when a file is changed from the outside
set autoread

" Use Unix as the standard file type
set fileformats=unix,dos,mac

" Ignore compiled and backup files
set wildignore=*.o,*.pyc,*~

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
au!

" For all text files set 'textwidth' to 78 characters.
autocmd FileType text setlocal textwidth=78

" For all text files load abbreviation settings
autocmd Filetype text source ~/.vim/scripts/abbrevs.vim

" Settins below:
" 'et' for expandtab, 'sta' for smarttab,
" 'sw' for shiftwidth, 'sts' for softtabstop

" For python files tab & indent
autocmd FileType python setlocal et sta sw=4 sts=4

" For markdown files tab & indent
autocmd FileType markdown setlocal et sta sw=4 sts=4

" load skel.c for C source files
" autocmd BufNewFile *.[ch] 0read ~/.vim/scripts/skel.c

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" Highlighting for Qt’s .pro and .pri files
au BufNewFile,BufRead *.pro set filetype=make
au BufNewFile,BufRead *.pri set filetype=make

augroup END

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Don't use Ex mode, use Q for formatting
map Q gq

" Remap VIM 0 to first non-blank character
"map 0 ^

" Window moving cursor
nmap wh <C-W>h
nmap wj <C-W>j
nmap wk <C-W>k
nmap wl <C-W>l

" Window resizing
nmap <C-h> <C-W><
nmap <C-j> <C-W>-
nmap <C-k> <C-W>+
nmap <C-l> <C-W>>

" Window moving around
" Exchange current window with next one
nmap <C-x> <C-W>x

"<C-W> K Move the current window to be at the very top
"<C-W> J Move the current window to be at the very bottom
"<C-W> H Move the current window to be at the far left
"<C-W> L Move the current window to be at the far right

" Useful mappings for managing tabs
nmap <Leader>ta :tabnew<CR>
nmap <Leader>tn :tabnext<CR>
nmap <Leader>tp :tabprevious<CR>
nmap <Leader>to :tabonly<CR>
nmap <Leader>tc :tabclose<CR>

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
nmap <Leader>te :tabedit <c-r>=expand("%:p:h")<CR>/

" Switch CWD to the directory of the open buffer
nmap <Leader>cd :cd %:p:h<CR>:pwd<CR>

" Edit file
nmap <Leader>e :edit<Space>

" Save file
nmap <Leader>w :w!<CR>
nmap <Leader>wa :wa!<CR>
nmap <Leader>wq :wq!<CR>

" Quit window
nmap <Leader>q :q!<CR>
nmap <Leader>qa :qa!<CR>

" Split window
nmap <Leader>hs :split<CR>

" Split window vertical
nmap <Leader>vs :vsplit<CR>

" Toggle paste mode on and off
nmap <Leader>p :setlocal paste!<CR>

" Buffer operations
nmap <Leader>ls :ls<CR>
" the :ls command is the same as :buffers
nmap <Leader>b  :buffer<Space>
nmap <Leader>bd :bdelete<CR>
nnoremap <C-N>  :bnext<CR>
nnoremap <C-P>  :bprevious<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fast edit vimrc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! SwitchToBuf(filename)
    "let fullfn = substitute(a:filename, "^\\~/", $HOME . "/", "")
    " find in current tab
    let bufwinnr = bufwinnr(a:filename)
    if bufwinnr != -1
        exec bufwinnr . "wincmd w"
        return
    else
        " find in each tab
        tabfirst
        let tab = 1
        while tab <= tabpagenr("$")
            let bufwinnr = bufwinnr(a:filename)
            if bufwinnr != -1
                exec "normal " . tab . "gt"
                exec bufwinnr . "wincmd w"
                return
            endif
            tabnext
            let tab = tab + 1
        endwhile
        " not exist, new tab
        exec "tabnew " . a:filename
    endif
endfunction

"Fast reloading of the .vimrc
nmap <Leader>sv :source ~/.vimrc<CR>

"Fast editing of .vimrc
nmap <Leader>ev :call SwitchToBuf("~/.vimrc")<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Man page
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source $VIMRUNTIME/ftplugin/man.vim
nmap <Leader>m :Man<Space>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Cscope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Manual (see :help cscope)
"
" Excute commands below in the project root dir to generate cscope database:
"   find -type f > cscope.files
"   cscope -bq
" Or
"   cscope -bRq
" Generated files: cscope.files, cscope.in.out, cscope.out, cscope.po.out.
"
if has("cscope")
  set csprg=/usr/bin/cscope
  set csqf=s-,c-,d-,i-,t-,e-
  set csto=1
  set cst
  set nocsverb
  " add any database in current directory
  if filereadable("cscope.out")
      cs add cscope.out
  " else add database pointed to by environment
  elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
  endif
  set csverb
endif

" 0 or s: Find this C symbol
nmap <Leader>fs :cs find s <C-R>=expand("<cword>")<CR><CR>
" 1 or g: Find this definition
"nmap <Leader>fg :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>fd :cs find g <C-R>=expand("<cword>")<CR><CR>
" 2 or d: Find functions called by this function
"nmap <Leader>fd :cs find d <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>fr :cs find d <C-R>=expand("<cword>")<CR><CR>
" 3 or c: Find functions calling this function
nmap <Leader>fc :cs find c <C-R>=expand("<cword>")<CR><CR>
" 4 or t: Find this text string
nmap <Leader>ft :cs find t <C-R>=expand("<cword>")<CR><CR>
" 6 or e: Find this egrep pattern
nmap <Leader>fe :cs find e <C-R>=expand("<cword>")<CR><CR>
" 7 or f: Find this file
"nmap <Leader>ff :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <Leader>fg :cs find f <C-R>=expand("<cfile>")<CR><CR>
" 8 or i: Find files #including this file
nmap <Leader>fi :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quickfix
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Manual (see :help quickfix)
"
" List all errors.
nmap <Leader>cl :clist!<CR>
" Display the next error in the list
nmap <Leader>cn :cnext<CR>
" Display the previous error in the list
nmap <Leader>cp :cprevious<CR>
" Open the quickfix window when there are recognized errors
nmap <Leader>cw :cw 10<CR>
" Close the quickfix window
nmap <Leader>cq :cclose<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Alternate Files quickly (a.vim)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :A switches to the header file corresponding to the current file being edited (or vise versa)
nmap <Leader>a :A<CR>
" :AS splits and switches
nmap <Leader>as :AS<CR>
" :AV vertical splits and switches
nmap <Leader>av :AV<CR>
" :AT new tab and switches
nmap <Leader>at :AT<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Showmarks
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Manual (see :help showmarks)
"
" Enable ShowMarks
let showmarks_enable = 1

" Show which marks
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

" Ignore help, quickfix, non-modifiable buffers
let showmarks_ignore_type = "hqm"

" Hilight lower & upper marks
let showmarks_hlline_lower = 1
let showmarks_hlline_upper = 1

"The following mappings are setup by default:
"  <Leader>mt   - Toggles ShowMarks on and off.
"  <Leader>ma   - Clears all marks in the current buffer.
"  <Leader>mm   - Places the next available mark on the current lineo
nmap <Leader>mc :ShowMarksClearMark<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Markbrowser
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <Leader>mb :MarksBrowser<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Easymotion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Manual (see :help easymotion)
"
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1 " Turn on case insensitive feature

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
"nmap s <Plug>(easymotion-overwin-f2)

" Jump to anywhere till before {char}
" `t{char}{label}`
map t <Plug>(easymotion-bd-t)
" or {char}{char}
" `t{char}{char}{label}`
"map t <Plug>(easymotion-bd-t2)

" n-character search motion
map / <Plug>(easymotion-sn)
map ? <Plug>(easymotion-sn)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" indentLine
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Manual (see :help indentline)
"
let g:indentLine_concealcursor = ''
let g:indentLine_leadingSpaceChar = '·'
"let g:indentLine_leadingSpaceEnabled = 1
"let g:indentLine_fileType = ['python']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nerdtree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Manual (see :help NERDTree)
"
" Global commands
" :NERDTree [<start-directory> | <bookmark>], help :NERDTree to see more detail
nmap <Leader>n :NERDTree<Space>
nmap <Leader>nt :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=[ '\~$', '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$',
            \ '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERD Commenter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Manual (see :help NERDCommenter)
"
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Add your own custom formats or override the defaults
"let g:NERDCustomDelimiters = { 'c': { 'left': '/*','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" The whole lines to be commented out when there is no multipart delimiters,
" but the EXACT text that was selected to be commented out if there IS multipart delimiters.
let g:NERDCommentWholeLinesInVMode=2

" The following key mappings are provided by default (there is also a menu
" with items corresponding to all the mappings below):

" [count]<Leader>cc NERDComComment
" Comment out the current line or text selected in visual mode.

" [count]<Leader>cu NERDComUncommentLine
" Uncomments the selected line(s).

" [count]<Leader>c<space> NERDComToggleComment
" Toggles the comment state of the selected line(s). If the topmost selected
" line is commented, all selected lines are uncommented and vice versa.
map <Leader>ct <Plug>NERDCommenterToggle

" [count]<Leader>cm NERDComMinimalComment
" Comments the given lines using only one set of multipart delimiters.

" [count]<Leader>ci NERDComInvertComment
" Toggles the comment state of the selected line(s) individually.

" [count]<Leader>cs NERDComSexyComment
" Comments out the selected lines ``sexily''

" <Leader>c$ NERDComEOLComment
" Comments the current line from the cursor to the end of line.

" <Leader>ca NERDComAltDelim
" Switches to the alternative set of delimiters.
nmap <Leader>c<space> <Plug>NERDCommenterAltDelims

" [count]<Leader>cy NERDComYankComment
" Same as <Leader>cc except that the commented line(s) are yanked first.

" <Leader>cA NERDComAppendComment
" Adds comment delimiters to the end of line and goes into insert mode between them.
nmap <Leader>ca <Plug>NERDCommenterAppend

" NERDComInsertComment
" Adds comment delimiters at the current cursor position and inserts between.
" Disabled by default.
imap <Leader>ci <Plug>NERDCommenterInsert

" [count]<Leader>cn NERDComNestedComment
" Same as <Leader>cc but forces nesting.
map <Leader>cN <Plug>NERDCommenterNested

" [count]<Leader>cl
" [count]<Leader>cb    NERDComAlignedComment
" Same as NERDComComment except that the delimiters are aligned down the
" left side (<Leader>cl) or both sides (<Leader>cb).
map <Leader>cL <Plug>NERDCommenterAlignLeft
"map <Leader>cB <Plug>NERDCommenterAlignBoth

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Manual (see :help ctrlp)
"
" :CtrlP Open CtrlP in file mode
" :CtrlPBuffer Open CtrlP in find buffer mode
" :CtrlPMRU Open CtrlP in find Most-Recently-Used file mode

let g:ctrlp_map = '<Leader>ff' " the mapping to invoke CtrlP in Normal mode, default is '<C-P>'
"let g:ctrlp_cmd = 'CtrlP' " the default opening command to use when pressing the above mapping

"nmap <Leader>fr :CtrlPMRU<CR>
nmap <Leader>fb :CtrlPBuffer<CR>

let g:ctrlp_regexp = 1
let g:ctrlp_arg_map = 1
let g:ctrlp_user_command = {
    \ 'types': {
        \ 1: ['.git', 'cd %s && git ls-files . -co --exclude-standard'],
        \ 2: ['.hg', 'hg --cwd %s status -numac -I . $(hg root)'],
    \ },
    \ 'fallback': 'ag %s -l --nocolor --nogroup --hidden
            \ --ignore .git
            \ --ignore out
            \ --ignore .svn
            \ --ignore .hg
            \ --ignore .DS_Store
            \ -g ""',
    \ 'ignore': 1
\ }

" Disable output, vcs, archive, temp and backup files
set wildignore+=*.swp,*~,._*
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
set wildignore+=*.o,*.out,*.obj,*.pyc,*.class
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
  \ }

" mappings inside CtrlP's prompt, see :help ctrlp_prompt_mappings

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlSF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Manual (see :help ctrlsf)
"
" Options (see :help ctrlsf-options)
let g:ctrlsf_default_root = 'project+fw'

" Key Maps (see :help ctrlsf-keymaps)
nmap <Leader>sf <Plug>CtrlSFPrompt<C-R>=expand("<cword>")<CR>
vmap <Leader>sf <Plug>CtrlSFVwordPath
nmap <Leader>sn <Plug>CtrlSFCwordPath
nmap <Leader>sN <Plug>CtrlSFCCwordPath
nmap <Leader>sp <Plug>CtrlSFPwordPath
nnoremap <Leader>so :CtrlSFOpen<CR>
nnoremap <Leader>st :CtrlSFToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Grepper
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Manual (see :help grepper)
"
" for browsing the input history
cnoremap <C-N> <Down>
cnoremap <C-P> <Up>

nnoremap <Leader>g :Grepper -tool git -cword<CR>
nnoremap <Leader>G :Grepper -tool ag -cword<CR>
"nnoremap <Leader>* :Grepper -tool ag -cword -noprompt<cr>
nnoremap <Leader># :Grepper -tool ag -cword -noprompt<cr>
" see https://github.com/ggreer/the_silver_searcher for more about ag

let g:grepper = {
    \ 'tools': ['git', 'ag', 'grep'],
    \ 'next_tool': '<Leader>g',
    \ }

" git grep from the root directory
let g:grepper.git =
  \ { 'grepprg': 'git grep -nI $* -- `git rev-parse --show-toplevel`' }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Manual (see :help tagbar)
"
let g:tagbar_sort = 0
let g:tagbar_autofocus = 1
nmap <Leader>tb :TagbarToggle<CR>
nmap <Leader>tl :TagbarToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Task list
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <Leader>td <Plug>TaskList

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SuperTab
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Manual (see :help supertab)
"
" make YCM compatible with Ultisnips
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextDefaultCompletionType = '<C-N>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Manual (see :help youcompleteme)
"
set completeopt=longest,menu

" let g:ycm_rust_src_path = '/usr/local/src/rust/src'
let g:ycm_server_python_interpreter = 'python3'

let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_tags_files = 1
"let g:ycm_key_invoke_completion = '<C-Space>' " Default
"let g:ycm_key_detailed_diagnostics = '<Leader>d' " Default
let g:ycm_key_list_select_completion = ['<C-N>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-P>', '<Up>']

" let g:ycm_confirm_extra_conf = 1
" let g:ycm_extra_conf_globlist = []
let g:ycm_global_ycm_extra_conf = '~/.vim/scripts/ycm_extra_conf.py'

"Note that you can install YCM with both **libclang** and **clangd** enabled.
"In that case **clangd** will be preferred unless you have the following in your 'vimrc':

" let g:ycm_use_clangd = 0

"There are 2 methods which can be used to provide compile flags to clang:
"Option 1: Use a compilation database
"
" The easiest way to get YCM to compile your code is to use a compilation
" database. A compilation database is usually generated by your build system
" (e.g. 'CMake') and contains the compiler invocation for each compilation unit
" in your project.

" For information on how to generate a compilation database, see the clang
" documentation. In short:

" - If using CMake, add '-DCMAKE_EXPORT_COMPILE_COMMANDS=ON' when configuring
"   (or add 'set( CMAKE_EXPORT_COMPILE_COMMANDS ON )' to 'CMakeLists.txt') and
"   copy or symlink the generated database to the root of your project.

" - For other build systems, check out '.ycm_extra_conf.py' below. Note that
"   **experimental** 'clangd'-based completer doesn't support this option. So
"   it only applies to 'libclang'-based completer.

"Option 2: Provide the flags manually

nnoremap <Leader>fx :YcmCompleter FixIt<CR>
nnoremap <Leader>gt :YcmCompleter GoTo<CR>
nnoremap <Leader>gd :YcmCompleter GetDoc<CR>
nnoremap <Leader>gi :YcmCompleter GoToInclude<CR>
inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ultisnips
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Manual (see :help UltiSnips)
"
let g:UltiSnipsExpandTrigger       = '<TAB>'
let g:UltiSnipsJumpForwardTrigger  = '<TAB>'
let g:UltiSnipsJumpBackwardTrigger = '<S-TAB>'
let g:UltiSnipsSnippetDirectories =
            \ ["~/.vim/snippets", "~/.vim/bundle/vim-snippets/UltiSnips"]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Manual (see :help syntastic and :help syntastic-checkers)
"
let g:syntastic_error_symbol = '✗>'
let g:syntastic_warning_symbol = '*>'
let g:syntastic_python_checkers=['pyflakes', 'pep8']

let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libstdc++'
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_include_dirs = ['/usr/include/']
let g:syntastic_enable_balloons = 1 "whether to show balloons

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sessionman
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <Leader>sl :SessionList<CR>
nmap <Leader>ss :SessionSave<CR>
nmap <Leader>sc :SessionClose<CR>

set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Trailing whitespace
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Manual (see :help trailing-whitespace)
"
map <Leader><space> :FixWhitespace<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-surround
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Manual (see :help surround)
"
" Normal mode
"  ds  - delete a surrounding
"  cs  - change a surrounding
"  ys  - add a surrounding (Note: "ys" for "you surround")
"  yss - add a surrounding to the whole line
"
"  Visual mode
"  S - in visual mode, add a surrounding but place text on new line + indent it

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-fugitive
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Manual (see :help fugitive)
"
nmap <Leader>gs :Git<CR>
nmap <Leader>gb :Git blame<CR>
nmap <Leader>gc :Git commit<CR>
nmap <Leader>gp :Git push<CR>
nmap <Leader>gl :Gclog<CR>
nmap <Leader>gr :Gread<CR>
nmap <Leader>gw :Gwrite<CR>
nmap <Leader>gv :Gvdiffsplit<CR>
nmap <Leader>gh :Ghdiffsplit<CR>

" Auto-clean fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-gitgutter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Manual (see :help gitgutter)
"
"To change the hunk-jumping maps (defaults shown):
"  nmap [c <Plug>GitGutterPrevHunk
"  nmap ]c <Plug>GitGutterNextHunk
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

"To change the hunk-staging/undoing/previewing maps (defaults shown):
"  nmap <Leader>hs <Plug>GitGutterStageHunk
"  nmap <Leader>hu <Plug>GitGutterUndoHunk
"  nmap <Leader>hp <Plug>GitGutterPreviewHunk
nmap <Leader>ha <Plug>(GitGutterStageHunk)
nmap <Leader>hr <Plug>(GitGutterUndoHunk)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Manual (see :help airline)
"
set laststatus=2 " Always show the status line

if &background == "light"
    let g:airline_theme='solarized'
else
    let g:airline_theme='molokai'
endif

let g:airline_powerline_fonts=1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let g:airline_mode_map = {
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'V',
    \ '' : 'V',
    \ 's'  : 'S',
    \ 'S'  : 'S',
    \ '' : 'S',
    \ }

let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#ctrlp#show_adjacent_modes = 0

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#buffer_idx_mode = 1

"let g:airline#extensions#tabline#tab_nr_type = 0 " # of splits (default)
"let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#tab_nr_type = 2 " splits and tab number

nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

"                                                     *airline-customization*
"variable names                default contents
"------------------------------------------------------------------------------
"let g:airline_section_a       (mode, crypt, paste, spell, iminsert)
"let g:airline_section_b       (hunks, branch)
"let g:airline_section_c       (bufferline or filename)
"let g:airline_section_gutter  (readonly, csv)
"let g:airline_section_x       (tagbar, filetype, virtualenv)
"let g:airline_section_y       (fileencoding, fileformat)
"let g:airline_section_z       (percentage, line number, column number)
"let g:airline_section_error   (ycm_error_count, syntastic, eclim)
"let g:airline_section_warning (ycm_warning_count, whitespace)

"let g:airline#extensions#default#layout = [
"    \ [ 'a', 'b', 'c' ],
"    \ [ 'x', 'y', 'z', 'error', 'warning' ]
"    \ ]
"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline-tmuxline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let airline#extensions#tmuxline#snapshot_file = "~/.tmux-statusline.conf"

" #H    Hostname of local host
" #h    Hostname of local host without the domain name
" #F    Current window flag
" #I    Current window index
" #S    Session name
" #W    Current window name
" #(shell-command)  First line of the command's output
let g:tmuxline_preset = {
    \'a'       : '#S',
    \'win'     : '#I #W',
    \'cwin'    : '#I #W',
    \'y'       : '%H:%M',
    \'z'       : '%Y/%m/%d %a',
    \'options' : {'status-justify' : 'left'}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Manual (see :help vim-markdown)
"
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_folding_level = 6

let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_new_list_item_indent = 2

let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1

"let g:vim_markdown_emphasis_multiline = 0
"let g:vim_markdown_fenced_languages = ['c++=cpp', 'viml=vim', 'bash=sh', 'ini=dosini']

" Commands
" - ':TableFormat': Format the table under the cursor
" - ':Toc': create a quickfix vertical window navigable table of contents with the headers.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-instant-markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0

" manually trigger preview via the command :InstantMarkdownPreview.
" the command is only available inside markdown buffers and when the autostart
" option is turned off.
map <Leader>md :InstantMarkdownPreview<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-cpp-enhanced-highlight
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
let c_no_curly_error=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Manual (see :help pymode)
"
" Common functionality
" --------------------
let g:pymode_run = 0
let g:pymode_rope = 0
let g:pymode_folding = 0
let g:pymode_virtualenv = 0
let g:pymode_breakpoint = 0
let g:pymode_lint_signs = 0

let g:pymode_quickfix_minheight = 5
let g:pymode_quickfix_maxheight = 10

let g:pymode_options_colorcolumn = 1
let g:pymode_options_max_line_length = 99

"                                                       *pymode-python-version*
" By default pymode looks for current python version supported in your Vim.
" You could choose prefer version, but value will be tested on loading.
"
let g:pymode_python = 'python3'
"
" Values are `python`, `python3`, `disable`. If value set to `disable` most
" python-features of **pymode** will be disabled.
"
" Set value to `python3` if you are working with python3 projects.

"                                                        *pymode-documentation*
" Pymode could show documentation for current word by pydoc.
"
" :PymodeDoc <args> — show documentation
"
" Bind keys to show documentation for current word (selection)
" let g:pymode_doc_bind = 'K'

" Default code checkers (you could set several)        *g:pymode_lint_checkers*
"
" let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']
"
" Values may be chosen from: `pylint`, `pep8`, `mccabe`, `pep257`, `pyflakes`.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" rust
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Manual (see :help rust)
"
"let g:rust_fold = 1
"let g:rustfmt_autosave = 1
"nmap <Leader>r :RustRun<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-multiple-cursors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Manual (see :help multiple-cursors)
"
" Global Options (see :help multiple-cursors-global-options)
let g:multi_cursor_exit_from_visual_mode=0
let g:multi_cursor_exit_from_insert_mode=0

" Mappings (see :help multiple-cursors-mappings)
" *g:multi_cursor_next_key* (Default: '<C-n>')
" *g:multi_cursor_prev_key* (Default: '<C-p>')
" *g:multi_cursor_skip_key* (Default: '<C-x>')
" *g:multi_cursor_quit_key* (Default: '<Esc>')
" *g:multi_cursor_start_key* (Default: 'g:multi_cursor_next_key')

" Map start key separately from next key
let g:multi_cursor_start_key='<C-a>'

" Add multiple cursors using a regular expression
nmap <Leader>cf :MultipleCursorsFind <C-R>=expand("<cword>")<CR>
