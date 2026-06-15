set nocompatible

" Disable some "sensible" defaults that I don't like.
let g:polyglot_disabled = ['sensible']
" Don't use vim-polyglot's file type detection
let g:polyglot_disabled = ['ftdetect']

" Plugins using vim-plug (https://github.com/junegunn/vim-plug)
call plug#begin()

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" CoC extensions
"let g:coc_global_extensions = ['coc-tsserver', 'coc-pyright']
"let g:coc_global_extensions = ['coc-pyright']
let g:coc_global_extensions = []

"Plug 'chrisbra/matchit'
Plug 'gpanders/vim-medieval'
    let g:medieval_langs = ['python=python3', 'shell=sh', 'console=sh']
Plug 'sheerun/vim-polyglot'

" Marius' coverage hilighting plugin
Plug 'mgedmin/coverage-highlight.vim'

call plug#end()

" Turn on 256 color mode in xterm
set t_Co=256

colorscheme benji

"hilight trailing whitespace (not in the first column so as to avoid littering
"up diffs)
highlight ExtraWhitespace ctermbg=darkgray
match ExtraWhitespace /^.\+\zs\s\+\%#\@<!$/
"autocmd InsertLeave * redraw!

":autocmd ColorScheme * highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
"autocmd ColorScheme * highlight default link ExtraWhitespace     Error
"autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

" Remove ALL autocommands for the current group so sourcing this file twice
" works.
":autocmd!

"use the mouse even in non-gui vim
set mouse=a

" force > and < to always round to the nearest multiple of the shift width
set shiftround

"set nobackup
"set noswapfile

" Use hybrid line numbers
set relativenumber
set number

"show matching parens
set showmatch

" swap cursor movement bindings so display line navigation is the default, making
" editing long lines less jumpy
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j

set history=1000

""select all with ctrl-a
"noremap <C-A> gggH<C-O>G
"inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
"cnoremap <C-A> <C-C>gggH<C-O>G
"onoremap <C-A> <C-C>gggH<C-O>G
"snoremap <C-A> <C-C>gggH<C-O>G
"xnoremap <C-A> <C-C>ggVG


"set diffexpr=MyDiff()
"function! MyDiff()
"  let opt = ''
"  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
"  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
"  silent execute '!C:\Vim\vim61\diff -a ' . opt . v:fname_in . ' ' . v:fname_new . ' > ' . v:fname_out
"endfunction


"colorscheme darkblue
"colorscheme asu1dark

set expandtab "expand tabs into spaces
set nowrap
set shiftwidth=4
set softtabstop=4
set ignorecase "do case insensitive search
set smartcase "if a search string includes caps, so case sensitive search
set formatoptions=qn
"set cscopequickfix=s-,g-,d-,c-,t-,e-,f-,i-
set iskeyword=a-z,A-Z,48-57,_,-

map <c-n> :cn<cr>
map <c-p> :cp<cr>
"map <c-n> :lne<cr>
"map <c-p> :lpr<cr>

"map <F3> 0i##<esc>0
"map <F4> 0xx

"map <F6> :syntax sync fromstart<cr>

"nmap <F3> <Plug>Comment
"nmap <F4> <Plug>DeComment
"imap <F3> <Esc><Plug>Commenti
"imap <F4> <Esc><Plug>DeComment
"vmap <F3> <Plug>VisualComment
"vmap <F4> <Plug>VisualDeComment

function! InsertTabWrapper(direction)
"    let col = col('.') - 1
"    let line = getline('.')
"    if !col || line[col - 1] !~ '\k'
"        return "\<tab>"
"    elseif "backward" == a:direction
"        return "\<c-p>"
"    else
"        return "\<c-n>"
"    endif
    let col = col('.') - 1
    let line = getline('.')
    if !col || line[col - 1] == ' '
        return "\<tab>"
    elseif "backward" == a:direction
        return "\<c-p>"
    else
        return "\<c-n>"
    endif
    return "\<c-x>\<c-o>"
endfunction

inoremap <c-o> <c-x><c-o>

vnoremap < <gv
vnoremap > >gv

"map <F5> :w<CR>:!python %<CR>

" take the output of buildout -vvvvvvv and turn it into a list of versions
" that were picked
"com! MungeVersions %!grep Picked|%s/Picked: //|%sort|%!uniq
"com! -bar MungeVersionsGrep %!grep "Picked:"
"com! MungeVersions silent MungeVersionsGrep | silent %s/Picked: // | %sort | silent %!uniq

com! CopyFN silent let@*=@%

" Yank a column of numbers and then run this to add the numbers up
com! SumColumn echo eval(join(split(@", '\_s\+'), '+'))

"set guifont=Courier\ 10\ Pitch\ 14
"set guifont=Bitstream\ Vera\ Sans\ Mono\ 6
"set guifont=-*-fixed-medium-r-semicondensed-*-13-*-*-*-*-*-*-*
if !has('nvim')
    set printoptions=paper:letter
endif

"map <F11> :set guifont=Bitstream\ Vera\ Sans\ Mono\ 10<CR>:redraw<CR>
"map <F12> :set guifont=Bitstream\ Vera\ Sans\ Mono\ 11<CR>:redraw<CR>

" set some key bindings for spell check on and off
"map <F11> :set spell<CR>
"map <F12> :set nospell<CR>
"imap <F11> <ESC>:set spell<CR>
"imap <F12> <ESC>:set nospell<CR>

"map gf :hide edit <cfile><CR>
"map gf :split edit <cfile><CR>
"cmap bn bnext!
"cmap bp bprev!

if has('python3')
:python3 << --EOF--
import os, sys
sys.path.append(os.path.expanduser('~/.vim/local/vim-bits'))
from vimbits import find_file
--EOF--
endif

augroup filetype
        au!
        au! BufRead,BufNewFile *.mxml setlocal filetype=xml
        au! BufRead,BufNewFile *.zcml setlocal filetype=xml
        au! BufRead,BufNewFile *.pt setlocal filetype=html
        au! BufRead,BufNewFile *.py setlocal filetype=python
        au! BufRead,BufNewFile *.cover setlocal syntax=python
        au! BufRead,BufNewFile *.ini setlocal syntax=myini
        au! BufRead,BufNewFile *.cfg setlocal filetype=myini
        au! BufRead,BufNewFile *.egg setlocal filetype=zip
        au! BufNewFile,BufRead *.clj setlocal filetype=clojure
        au! BufNewFile,BufRead *.ies setlocal filetype=elixir
        au! BufNewFile,BufRead *.exs setlocal filetype=elixir
        au! BufNewFile,BufRead *.ex setlocal filetype=elixir
        au! BufNewFile,BufRead *.ts setlocal filetype=typescript
        au! BufNewFile,BufRead Dockerfile* setlocal filetype=dockerfile
augroup END

"au CursorMoved,CursorMovedI *.txt py set_local_doctest_indent()

":python << --EOF--
"def set_local_doctest_indent():
"    line = vim.current.line.strip()
"    vim.command(':setlocal shiftwidth=4 softtabstop=4')
"    if line.startswith('  ...') or line.startswith('  >>>'):
"        vim.command(':setlocal shiftwidth=2 softtabstop=2')

"--EOF--

"stuff for working with split windows:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
if exists(':tnoremap')
    " make control-nav keys work to switch buffers in terminals
    tnoremap <C-h> <C-\><C-N><C-w>h
    tnoremap <C-j> <C-\><C-N><C-w>j
    tnoremap <C-k> <C-\><C-N><C-w>k
    tnoremap <C-l> <C-\><C-N><C-w>l
    " make Esc switch to normal mode
    "tnoremap <esc> <C-\><C-N>
endif
set winminheight=0
set winminwidth=1
" Make the window at least wide enough for relative line numbers and
" 88-character lines.
set winwidth=92
set textwidth=88

"make :make do a syntax check for python files:
"autocmd BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
"autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

"make :make do a pyflakes check for python files:
"autocmd BufEnter *.py set makeprg=pyflakes\ %
autocmd BufEnter *.py set makeprg=make\ lint
autocmd BufEnter *.py set efm=%f:%l:\ %m

""make :make do a lint check for JS files:
"autocmd BufEnter *.js set makeprg=/home/benji/bin/do-lp-lint
"autocmd BufEnter *.js set efm=%f\ %l\ %m

autocmd BufEnter *.py set omnifunc=pythoncomplete#Complete
autocmd BufNewFile,BufRead *.py set tw=88 ts=4 sts=4 sw=4 et
autocmd BufNewFile,BufRead *.hy set tw=88 ts=2 sts=2 sw=2 et

" Display tab characters in Makefiles
autocmd BufNewFile,BufRead,BufEnter Makefile* set listchars=tab:→ |set list

set switchbuf="useopen,split"

set completeopt-=preview

"Scanning included files takes too long.
setglobal complete-=i

let g:netrw_list_hide='^\.,\.swp$,\.pyc$,\.pyo$,\.swp$,\~$'

autocmd BufEnter *.mxml setlocal shiftwidth=2 softtabstop=2
autocmd BufEnter *.zcml setlocal shiftwidth=2 softtabstop=2
autocmd BufEnter *.html setlocal shiftwidth=2 softtabstop=2
autocmd BufEnter *.htm setlocal shiftwidth=2 softtabstop=2
autocmd BufEnter *.pt setlocal shiftwidth=2 softtabstop=2
autocmd BufEnter *.xml setlocal shiftwidth=2 softtabstop=2
autocmd BufEnter *.xsl setlocal shiftwidth=2 softtabstop=2
autocmd BufEnter *.ies setlocal shiftwidth=2 softtabstop=2
autocmd BufEnter *.exs setlocal shiftwidth=2 softtabstop=2
autocmd BufEnter *.ex setlocal shiftwidth=2 softtabstop=2


autocmd BufEnter  setlocal shiftwidth=2 softtabstop=2

autocmd BufNewFile,BufRead */*.mail.google.com.* set filetype=mail

autocmd BufEnter *.js setlocal shiftwidth=2 softtabstop=2 textwidth=88
autocmd BufEnter *.ts setlocal shiftwidth=2 softtabstop=2 textwidth=88

autocmd BufEnter *.html setlocal syntax=xml

autocmd BufEnter *.rst setlocal textwidth=88
autocmd BufEnter *.md setlocal textwidth=88

autocmd BufEnter *.html setlocal indentexpr=
autocmd BufEnter *.htm setlocal indentexpr=
autocmd BufEnter *.py setlocal indentexpr=
autocmd BufEnter *.c setlocal indentexpr=
autocmd BufEnter *.js setlocal indentexpr=
autocmd BufEnter *.pt setlocal indentexpr=
autocmd BufEnter *.xml setlocal indentexpr=
autocmd BufEnter *.xsd setlocal indentexpr=
autocmd BufEnter *.zcml setlocal indentexpr=

"autocmd FileType help NoSpaceHi

autocmd FileType clojure set shiftwidth=4
autocmd FileType clojure set softtabstop=4

let g:clj_paren_rainbow=1

autocmd BufEnter *.txt setlocal syntax=rst
"autocmd BufEnter *.test setlocal syntax=doctest | SpaceHi
"autocmd BufEnter *.rst setlocal syntax=doctest | SpaceHi
"autocmd BufEnter *.txt setlocal syntax=doctest
autocmd BufEnter *.test setlocal syntax=doctest
autocmd BufEnter *.rst setlocal syntax=rst

autocmd BufEnter *.scad setlocal syntax=c

autocmd BufNewFile,BufRead svn-commit.* setf svn

"autocmd FileType svn map scd :SVNCommitDiff<CR>
autocmd FileType mail setlocal spell

"map so :SVNGotoOriginal<CR>
"map sd :SVNDiff<CR>
"map sl :SVNLog<CR>
"map si :SVNInfo<CR>
"map ss :SVNStatus<CR>
"map sc :SVNCommit<CR>
"map su :SVNUpdate<CR>
"map sb :SVNBlame<CR>
"map sr :SVNReview<CR>
"let g:SVNCommandEdit = 'split'
"let g:SVNCommandInteractive = 1
"let g:SVNCommandDiffSplit = 'horizontal'
"let g:SVNCommandSplit = 'horizontal'
let g:showfuncctagsbin = 'ctags'

"autocmd BufWrite *.py silent! %s/[\r \t]\+$//

"Create a command to fix trailing whitespace in the current file.
com! CleanUpWhiteSpace :%s/[\r \t]\+$//

"This doesn't work right on some lines, why?
" like this line: "map "
"autocmd BufEnter * syn match Error /^.*\S\s\+$/

set nohlsearch "don't highlight text that matches the last search
set incsearch "jump to the next match as search text is typed

if has('python3')
:python3 << --EOF--
import os, sys, re

import vim

def findPaths(pieces, prefix=''):
    path = '/'.join(pieces)

    searchPath = prefix + '/' + path
    if os.path.exists(searchPath):
        return [searchPath]
    cmd = 'find . -path *' + searchPath
    chin, chout = os.popen4(cmd)
    chin.close()
    output = chout.read()
    chout.close()

    return [p for p in output.split('\n') if p]

def findModule(module_name):
    bufferName = vim.current.buffer.name
    filePrefix = '/'.join([n for n in bufferName.split('/') if n != '.'][:-1])
    pieces = module_name.split('.')

    paths = findPaths(pieces + ['__init__.py'], filePrefix)

    if not paths:
        paths = findPaths(pieces[:-1] + [pieces[-1]+'.py'], filePrefix)

    if not paths:
        paths = findPaths(pieces + ['__init__.py'])

    if not paths:
        paths = findPaths(pieces[:-1] + [pieces[-1]+'.py'])

    if len(paths) == 1:
        return paths[0]
    else:
        return None

def findWordInDelimiter(s, i, d):
    # s is a string, i is an index inside the word to be extracted.
    start = s[:i].rfind(d)

    stop = s.find(d, i)
    if stop == -1:
        stop = len(s)

    return s[start+1:stop]

def findWord(s, i):
    delimiters = ' \'":,'
    for d in delimiters:
        w = findWordInDelimiter(s, i, d)
        #sys.stderr.write('d:%s;' % d)
        #sys.stderr.write('i:%s;' % i)
        #sys.stderr.write('w:%s;' % w)
        for x in delimiters:
            if x in w:
                break
        else:
            return w

        continue

def findFileName(s, i):
    word = findWord(s, i)
    if '"' in word:
        return word.split('"', 3)[-2]
    return word

def editModule():
    mod = None
    line = vim.current.line.strip()
    wuc = findWord(line, vim.current.window.cursor[1] - 1)

    # Probably a line of ZCML.
    if '"' in line:
        chunks = wuc.split('"')
        for chunk in chunks:
            if '.' in chunk:
                def makeName(chunk, i):
                    return '.'.join([x for x in chunk.split('.')[:i] if x])

                for index in [None, -1, -2, -3]:
                    path = findModule(makeName(chunk, index))
                    if path:
                        break

    else: # Probably a module import.
        chunks = line.split(' ')
        if chunks[0] == 'import':
            mod = wuc.strip(',')
        elif chunks[0] == 'from':
            mod = chunks[1] + '.' + wuc.strip(',').strip('(')
        else: # Perhaps a module name in some other context?
            mod = wuc

        if mod:
            path = findModule(mod)

        if not path:
            # Perhaps an import of an entity from a module.
            if chunks[0] == 'from':
                mod = chunks[1]
                path = findModule(mod)

    if path:
        vim.command(':hide edit %s' % path)
    else:
        sys.stderr.write('Couldn\'t find file.')

def editFile():
    line = vim.current.line
    cursor_position = vim.current.window.cursor[1] - 1
    #editString(line, cursor_position)
    file_name = findFileName(line, cursor_position)
    found = find_file(file_name, ['.'])
    if found is None:
        sys.stderr.write(f'find_file failed: {file_name=}\n')
    else:
        vim.command(':hide edit ' + find_file(findFileName(line, cursor_position), ['.']))

def editSelection():
    # get the current selection
    line = vim.eval('@*')
    line = line.strip()
    editString(line)

def editString(line):
    line = line.strip()

    # for URLS, strip "file://" and the machine name
    line = re.sub(r'^file://[^/]*', '', line)

    # git prepends "a/" and "b/" to paths in diffs, strip those if present.
    line = re.sub(r'^[ab]/', '', line)

    # Codex likes to split file names across lines, so remove any embedded spaces.
    line = re.sub(r'\s*', '', line)

    # pylint prepends "[WRC]:" to line numbers, strip those if present.
    line = re.sub(r'^[WRC]:', '', line)

    # psql prepends "psql:" to line numbers, strip those if present.
    line = re.sub(r'^psql:', '', line)

    path = None
    wuc = None
    line_no = None
    filePrefix = ''

    # If it's just a line number go to that line in the current buffer.
    match = re.match(r'(\d+):?', line)
    if match:
        vim.command(':hide ' + match.group(1))
        return

    bufferName = vim.current.buffer.name
    if bufferName is not None:
        filePrefix = '/'.join([n for n in bufferName.split('/') if n != '.'][:-1])

    match = re.search(r'(?:\s*File\s*)?"?([^+ :,")(-]+)(?:\D*)(\d*)', line)
    if match:
        path, line_no = match.groups()
        #sys.stderr.write(repr(path)); sys.stderr.write('\n')
        #sys.stderr.write(repr(line_no)); sys.stderr.write('\n')
        if path and not path.startswith('/'):
            chunks = filePrefix.split('/')
            candidate = path
            while chunks and not os.path.exists(candidate):
                candidate = os.path.join('/'.join(chunks), path)
                chunks.pop(-1)
            path = candidate

    if path and os.path.exists(path):
        vim.command(':hide edit %s' % path)
        if line_no is not None:
            try:
                vim.current.window.cursor = (int(line_no), 0)
            except ValueError:
                pass
    elif wuc:
        vim.command(':hide edit **/%s' % wuc)
    else:
        # if we didn't find a file, try harder
        if line.strip().endswith(':'):
            return editString(line.strip()[:-1])

        sys.stderr.write('Couldn\'t find file: %s' % path)

--EOF--
endif

let mapleader = " "

" If Python is available, use the above functions for file navigation.  If not, use
" simpler, built-in functionality.
if has('python3')
    map <leader>f :python3 editFile()<CR>
    "map <leader>sf :vsplit\|:python3 editFile()<CR>
    map <leader>s <ESC>:python3 editSelection()<CR>
    map <leader>m :python3 editModule()<CR>
else
    map <leader>f gf
    "map <leader>sf :vsplit<CR>gf<CR>
    map <leader>s <ESC>:execute 'e ' . @*<CR>
endif

"map gw <ESC>:grep -w <cword><CR>

map <leader>g :CopyFN<CR>

"bind <leader>gw to grep the word under the cursor
set grepprg=ag\ --vimgrep\ $*
set grepformat=%f:%l:%c:%m
map <leader>w <ESC>:grep -w <cword><CR>

autocmd BufEnter * :syntax sync fromstart
"autocmd BufEnter * :syntax sync lines=9999

set tags=tags;TAGS

abbreviate :star: ★

abbreviate pdb import pdb;pdb.set_trace()

set equalalways "make windows equal size when splitting or closing
set virtualedit=block "let the selection and cursor go beyond the actual EOL

set autoindent
" turn off the very annoying dedenting of comments
inoremap # X#

"set grepprg=bgrep "use a different program for :grep
"set grepprg=gid\ -s "use GNU id-utils for :grep
"set grepprg=git grep -n

filetype on            " enables filetype detection
filetype plugin on     " enables filetype specific plugins
filetype plugin indent on


"autocmd BufEnter __Tag_List__ setlocal winminwidth=30

let g:EnhCommentifyUseAltKeys='yes'

" More Python settings
let python_highlight_numbers=1
let python_highlight_exceptions=1
syntax on
"filetype indent on
"set foldmethod=indent

"kill the menu, toolbar, and scrollbar
set guioptions-=m
set guioptions-=T
set guioptions-=L
" Yank to the system clipboard on Mac and Windows, selection on Linux
set clipboard=unnamed

" fool the annoying matchparen plugin into thinking it's already loaded
let loaded_matchparen = 1

" turn on a little menu of file name completions for the command-line
set wildmenu

set vb t_vb= "no bells at all

com! Delbuffer enew|bw #

" turn off folding
set nofoldenable

" set the default erinter name
"set pdev=HP4050n.zope.com 

if has('persistent_undo')         "check if your vim version supports
  set undodir=$HOME/.vim/undo     "directory where the undo files will be stored
  set undofile                    "turn on the feature
endif

" Use all the colors the terminal has available and switch to the GUI color scheme
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors

" Configure the Python Language Server.
"if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': '/Users/benji/bin/pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ 'workspace_config': {'pyls': {'plugins': {
        \   'pydocstyle': {'enabled': v:false},
        \   'pyls_mypy': {'enabled': v:true, 'live_mode': v:false},
        \}
        \ }}})
"endif

" Map a function to tab and shift-tab.
"inoremap <tab> <c-r>=InsertTabWrapper("forward")<cr>
"inoremap <s-tab> <c-r>=InsertTabWrapper("backward")<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map tab and shift-tab to LSP completion.
"inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable recursion for certain file operations, in particluar :find
set path+=**

" This function will transform logical-line-based nav key bindings into
" display-line-based navigation.
function SetWrap()
	setlocal wrap linebreak nolist
	set virtualedit=
	setlocal display+=lastline
	noremap  <buffer> <silent> <Up>   gk
	noremap  <buffer> <silent> <Down> gj
	noremap  <buffer> <silent> <Home> g<Home>
	noremap  <buffer> <silent> <End>  g<End>
	inoremap <buffer> <silent> <Up>   <C-o>gk
	inoremap <buffer> <silent> <Down> <C-o>gj
	inoremap <buffer> <silent> <Home> <C-o>g<Home>
	inoremap <buffer> <silent> <End>  <C-o>g<End>
        setlocal tw=0
endfunction

"autocmd BufEnter *.md call SetWrap()
set breakindent showbreak=⎸

" Always show the status line
set laststatus=2
" Turn on row and column numbers in the status line
set ruler

" Create a visual selection of the current or deeper indentation level
function SelectIndent()
  let cur_line = line(".")
  let cur_ind = indent(cur_line)
  let line = cur_line
  while indent(line - 1) >= cur_ind
    let line = line - 1
  endw
  exe "normal " . line . "G"
  exe "normal V"
  let line = cur_line
  while indent(line + 1) >= cur_ind
    let line = line + 1
  endw
  exe "normal " . line . "G"
endfunction
nnoremap vii :call SelectIndent()<CR>


" Disable upper- and lowercasing in visual mode because I do it accidentally a lot
vnoremap u <nop>
vnoremap U <nop>

" COC setup
"
" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" End of tab completion setup

nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>sr <Plug>(coc-references)
"nmap <silent> <leader>sru <Plug>(coc-references-used)
nmap <silent> <leader>dn <Plug>(coc-diagnostic-next)
nmap <silent> <leader>dp <Plug>(coc-diagnostic-prev)
"nmap <leader>fc  <Plug>(coc-format-selected)
"vmap <leader>fc  <Plug>(coc-format-selected)
"nmap <leader>rm  <Plug>(coc-refactor)
nmap <leader>rn  <Plug>(coc-rename)
nmap <leader>sal  <Plug>(coc-codeaction-line)
vmap <leader>sav  <Plug>(coc-codeaction-selected)
"vmap <leader>saf  <Plug>(coc-codeaction-file)
vmap <leader>sar  <Plug>(coc-codeaction-refactor)

vmap <leader>fl  <Plug>(coc-fix-current)

nnoremap <silent> <leader>p :call CocAction('doHover')<CR>
" End of COC setup

" Put the symbols that normally go into the sign column into the number column instead.
set signcolumn=number


" configure soft wrapping
set wrap
set linebreak
set breakat=\ (.,{
