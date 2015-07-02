"%s/\(xxxx\)/(\1)/gci
" fist number
":let i=0|g/^/s//\=i.','/ |let i+=1
":%s/^/\=line('.').','/


" Vundle
set nocompatible " not compatible with the old-fashion vi mode
filetype off " required!

" http://www.erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/
" Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
  echo "Installing Vundle.."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
  let iCanHazVundle=0
endif

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'tomasr/molokai'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'airblade/vim-gitgutter'
"Bundle "MarcWeber/vim-addon-mw-utils"
"Bundle "tomtom/tlib_vim"
Bundle 'Townk/vim-autoclose'
"Bundle 'Shougo/unite.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'majutsushi/tagbar'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-fugitive'
"Bundle 'honza/vim-snippets'
"Bundle 'garbas/vim-snipmate'
Bundle 'jlanzarotta/bufexplorer'
Bundle 'vim-scripts/CRefVim'
"Bundle 'mileszs/ack.vim'
"Bundle 'ggreer/the_silver_searcher'
Bundle 'kshenoy/vim-signature'
Bundle 'pangloss/vim-javascript'
"Bundle 'jelera/vim-javascript-syntax'
"Bundle 'Valloric/YouCompleteMe'
"Bundle 'scrooloose/syntastic'
Bundle 'joshhartigan/vim-reddit'
Bundle 'ryanss/vim-hackernews'
Bundle 'frankmorris/gtrans.vim-1'
Bundle 'kdurant/LanguageRefVim'
Bundle 'tpope/vim-surround'
"Bundle 'gcmt/breeze.vim'
"Bundle 'kien/ctrlp.vim'
Bundle 'bling/vim-airline'
Bundle 'vim-scripts/L9'
"Bundle 'othree/vim-autocomplpop'
Bundle 'ervandew/supertab'
"gtrans.vim-1 lang=tw
Bundle 'rking/ag.vim'

"Note
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-notes'


"ag setting
let g:agprg="/usr/bin/ag --column"


"
let g:gtrans_DefaultLang = 'tw'
let g:gtrans_Engine = 'google' " 或者 bing

" set leader to ,
let mapleader=","
let g:mapleader=","

" general
filetype plugin indent on " enable filetype-specific plugins
set history=50 " keep 50 lines of command line history
set number " enable line numbers
set autoindent " enable autoindent
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4 " insert 2 spaces for a tab
set expandtab " use space instead of tab
set softtabstop=4
set shiftwidth=4 " the number of space characters inserted for indentation
"set smarttab
"set autoindent
syntax on " enable syntax highlighting
colors molokai " vim color scheme
set autoread " auto read when file is changed from outside
set history=50 " keep 50 lines of command line history
"set mouse=a " mouse support
if has("gui_running") " GUI color and font settings
  set guifont=Monaco:h14
  set t_Co=256 " 256 color mode
end
if has("gui_macvim") " macvim shift movement
  let macvim_hig_shift_movement = 1
endif
set cursorline " highlight current line
set clipboard=unnamed " yank to the system register (*) by default
set showmatch " Cursor shows matching ) and }
set showmode " Show current mode
set backspace=2 " make backspace work like most other apps

" disable sound on errors
set noeb vb t_vb=

" add spell checking and automatic wrapping at the
" recommended 72 columns to you commit messages
autocmd Filetype gitcommit setlocal spell textwidth=72

" to move effeciently between splits
nmap gh <C-w>h
nmap gj <C-w>j
nmap gk <C-w>k
nmap gl <C-w>l

" Bash like keys for the command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>

" encoding settings
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8

" status line {
set laststatus=2
" --- ack
let g:ackprg = 'ag --nogroup --nocolor --column'

" --- PowerLine
let g:Powerline_symbols = 'fancy' " require fontpatcher

" --- vim-gitgutter
let g:gitgutter_enabled = 1
highlight clear SignColumn " For the same appearance as your line number column

" --- tagbar
"nmap <D-\> :TagbarToggle<CR>
"let g:tagbar_left=1

" --- ctrlp
let g:ctrlp_dont_split = 'NERD_tree_2'
let g:ctrlp_show_hidden = 1


" ------------------------------------------------yolin add --------------------------------------------


set nocompatible
set nu
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,big5,euc-jp,gbk,euc-kr,utf-bom,iso8859-1,latin1
set fileencoding=utf-8
set ruler
set tags=tags;
set write
set cmdheight=1
set t_Co=256
set backspace=2
set ls=2
set magic "can change buffer not save
set hid
set ignorecase
set tagstack
"set wildmenu
"set esckeys
" Sets how many lines of history VIM has to remember.vimrc
set history=700
set display=lastline
set virtualedit=block
" Set to auto read when a file is changed from the outside
if exists("&autoread")
set autoread
endif 

"no sound on errors
set noerrorbells
set novisualbell


"
" Plugins config
"
" CtrlP
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
" vim-airline
let g:airline#extensions#tabline#enabled=0
let g:airline#extensions#tabline#fnamecollapse=1
let g:airline#extensions#tabline#formatter='unique_tail'
"let g:airline_section_b=0
" whitspace counter
let g:airline_section_warning=0


"env
"au BufRead *.html set filetype=htmlm4
"au BufRead *.htm set filetype=htmlm4
"set switchbuf+=newtab,usetab,newtab
"buf都開在新的tab
"set switchbuf+=useopen,newtab
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile

set lbr
set tw=500

set wrap "Wrap lines

set list
set listchars=tab:\|\ 
"supertab
"minibuf
                
au BufWinEnter \[Buf\ List\] setl nonumber


"a.vim
let g:alternateSearchPath = 'sfr:./h,sfr:./include,sfr:./source,sfr:./src,sfr:./,sfr:./inc,sfr:../source,sfr:../src,sfr:../include,sfr:../inc'

"auto remove blank on line end
"autocmd FileType c,cpp,java,php,perl,python,ruby,sh,html,htm autocmd BufWritePre  :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

let g:EasyMotion_leader_key = 'f'

"NERD.vim
let NERDTreeWinPos="left"
"let NERDTreeMouseMode=3
"let NERDTreeShowBookmarks=1
"autorun
"autocmd VimEnter * NERDTreeToggle
"autocmd VimEnter * wincmd p

"map
set winaltkeys=no

nnoremap <space><space> :noh<cr>:call MySwitchToWorkBuf()<cr>

nnoremap `<esc> :q<cr>


noremap <leader><xF1> <esc>:NERDTreeFind<cr>
noremap <xF1> <esc>:NERDTreeToggle<cr>
noremap <xF2> <esc>:TagbarToggle<cr>:call MySwitchToWorkBuf()<cr>
"noremap <xF3> <esc>:!grep --color -irsnI <c-r>+ <c-r>=getcwd()<cr>
noremap <xF3> <esc>:Ag <c-r>+ <c-r>=getcwd()<cr>
"noremap <F4> <esc>:set noexpandtab softtabstop=4 shiftwidth=4 tabstop=4
noremap <F4> <esc>:set expandtab!<cr>
noremap <F5> <esc>:Gtrans<cr>
noremap <F6> <esc>:Reddit worldnews<cr>
noremap <F7> <esc>:Reddit taiwan<cr>
noremap <F8> <esc>:BufExplorer<cr>
noremap <F9> <esc>:!gencs.sh <c-r>=getcwd()<cr>
noremap <F10> <esc>:call ReloadCSCOPE()<cr>
noremap <F11> <esc>:cs show<cr>
noremap <F12> <esc>:call ReloadAllCSCOPE()<cr>


inoremap <xF1> <esc>:call MySwitchToWorkBuf()<cr>:NERDTreeToggle<cr>
inoremap <leader><c-xF1> <esc>:NERDTreeFind<cr>
inoremap <xF2> <esc>:call MySwitchToWorkBuf()<cr>:TagbarToggle<cr>
"inoremap <xF3> <esc>:!grep -irsnI --color <c-r>+ <c-r>=getcwd()<cr>
inoremap <xF3> <esc>:Ag <c-r>+ <c-r>=getcwd()<cr>
"inoremap <F4> <esc>:set noexpandtab softtabstop=8 shiftwidth=8 tabstop=4
inoremap <F4> <esc>:set expandtab!<cr>
inoremap <F5> <esc>:Gtrans<cr>
inoremap <F6> <esc>:Reddit worldnews<cr>
inoremap <F7> <esc>:Reddit taiwan<cr>
inoremap <F8> <esc>:BufExplorer<cr>
inoremap <F9> <esc>:!gencs.sh <c-r>=getcwd()<cr>
inoremap <F10> <esc>:call ReloadCSCOPE()<cr>
inoremap <F11> <esc>:cs show<cr>
inoremap <F12> <esc>:call ReloadAllCSCOPE()<cr>

"vnoremap <xF3> y<esc>:!grep -irsnI --color <c-r>0 <c-r>=getcwd()<cr>
vnoremap <xF3> y<esc>:Ag <c-r>0 <c-r>=getcwd()<cr>


noremap <leader>/ <esc>:noh<cr>
noremap <leader>t <esc>:Gtrans<cr>

noremap <c-j> :GitGutterNextHunk<cr>
noremap <c-k> :GitGutterPrevHunk<cr>

noremap <m-a> :A<cr>
inoremap <m-a> <esc>:A<cr>

noremap <c-xDown> <c-w>j
noremap <c-xUp> <c-w>k
noremap <c-xLeft> <c-w>h
noremap <c-xRight> <c-w>l

inoremap <c-xDown> <esc><c-w>j
inoremap <c-xUp> <esc><c-w>k
inoremap <c-xLeft> <esc><c-w>h
inoremap <c-xRight> <esc><c-w>l



"noremap <m-xLeft> <esc>:tabprevious<cr>
"noremap <m-xRight> <esc>:tabnext<cr>
"inoremap <m-xLeft> <esc>:tabprevious<cr>
"inoremap <m-xRight> <esc>:tabnext<cr>


noremap <m-xUp> <esc>:bp<cr>
noremap <m-xDown> <esc>:bn<cr>
noremap <m-xLeft> <esc>:vertical res -3<cr>
noremap <m-xRight> <esc>:vertical res +3<cr>


inoremap <m-xUp> <esc>:bp<cr>
inoremap <m-xDown> <esc>:bn<cr>
inoremap <m-xLeft> <esc>:vertical res -3<cr>
inoremap <m-xRight> <esc>:vertical res +3<cr>

"nnoremap <c-v> <c-r>+
vnoremap <c-x> "+x
vnoremap <c-c> "+y
vnoremap <c-v> "+p
inoremap <c-z> <esc>ui
inoremap <c-v> <space><esc>:set paste<cr>i<del><c-r>+<esc>:set nopaste<cr>a
"nnoremap <leader>u <ESC>:silent! !~/.vim/gentag.sh <c-r>=getcwd()<cr> &<cr>
inoremap <c-s> <ESC>:update<cr>
nnoremap <c-s> :update<cr>
nnoremap <leader><space> <ESC>:redraw!<cr>
nnoremap <leader>q <ESC>:bd<cr>
nnoremap <leader>aq <ESC>:qa<cr>

"au Filetype html,htm,xml,xsl source ~/.vim/scripts/closetag.vim
"autocmd VimEnter * source ~/.vim/Session.vim 
au BufRead * set expandtab softtabstop=4 shiftwidth=4
au BufRead *.make set filetype=make noexpandtab softtabstop=4 shiftwidth=4 tabstop=4
au BufRead *.ISD set filetype=make noexpandtab softtabstop=4 shiftwidth=4 tabstop=4
au BufRead *.in set noexpandtab softtabstop=4 shiftwidth=8 tabstop=4
au BufRead Makefile set noexpandtab softtabstop=8 shiftwidth=8 tabstop=4
au BufRead *.htm set filetype=javascript noexpandtab softtabstop=4 shiftwidth=4 tabstop=4
au BufRead *.html set filetype=javascript noexpandtab softtabstop=4 shiftwidth=4 tabstop=4
au BufRead *.cgi set filetype=javascript noexpandtab softtabstop=4 shiftwidth=4 tabstop=4
au BufRead *js.htm set filetype=javascript noexpandtab softtabstop=4 shiftwidth=4 tabstop=4
au BufRead *js.html set filetype=javascript noexpandtab softtabstop=4 shiftwidth=4 tabstop=4
au BufRead *css.htm set filetype=javascript noexpandtab softtabstop=4 shiftwidth=4 tabstop=4
au BufRead *css.html set filetype=javascript noexpandtab softtabstop=4 shiftwidth=4 tabstop=4

"au VimEnter * NERDTreeFind
"
"au BufWritePost *.c,*.cpp,*.h silent! !cscope -bkq -i /CSCOPE/ISD2/MIPS32_APPS/sysconfig/cscope.files -f /CSCOPE/ISD2/MIPS32_APPS/sysconfig/cscope.out &
set cscopequickfix=s-,c-,d-,i-,t-,e-
"
let g:myGenCSCOPE_DB = "/CSCOPE/"

function! ReloadAllCSCOPE()
    let CSFOLDER=system('find /CSCOPE/ -name "*.out"')
    silent! cs kill -1
    let l:csfolder = substitute(CSFOLDER, "\n", "  ", "g")
    let s:csarray = split(l:csfolder)
    for i in range(0, len(s:csarray)-1)
        execute "silent! cs add "s:csarray[i]
    endfo
    "cs show
endfunction

function! ReloadCSCOPE()
    silent! cs kill -1
    set cscopetag
    set csto=0
    set nocsverb
    let i = 1
    while i < 20
        if filereadable("cscope.out")
            let db = getcwd() . "/cscope.out"
            let $CSCOPE_DB = db
            cs add $CSCOPE_DB
            let i = 20
        else
            let db = g:myGenCSCOPE_DB. getcwd() . "/cscope.out"
            if filereadable(db)
                let $CSCOPE_DB = db
                cs add $CSCOPE_DB
                let i = 20
            else
                cd ..
                let i += 1
            endif
        endif
    endwhile
    cs show
endfunction

if has("cscope")
    set cscopeverbose
    nmap <LEADER>s :cs find s <C-R>=expand("<cword>")<CR><CR>:bot cw<CR>:wincmd j<CR>
    nmap <C-\> :cs find s <C-R>=expand("<cword>")<CR><CR>:bot cw<CR>:wincmd j<CR>
    nmap <LEADER>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-]> :cs find g <C-R>=expand("<cword>")<CR><CR>
    "nmap <LEADER>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    "nmap <LEADER>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    "nmap <LEADER>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <LEADER>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    "nmap <LEADER>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    "nmap <LEADER>d :cs find d <C-R>=expand("<cword>")<CR><CR>

endif

let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'qf' : 1,
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'unite' : 1,
      \ 'text' : 1,
      \ 'vimwiki' : 1,
      \ 'gitcommit' : 1,
      \}


"let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

nnoremap <leader>. :YcmCompleter GoToDefinitionElseDeclaration<CR>

set hlsearch
" =============================================================================
" SET THE GUI COLOR SCHEME
" =============================================================================
"
filetype on
filetype plugin on
filetype indent on
syntax on
set autochdir
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" global variable
"
"
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:myMenuIndex = 0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" switchtoworkbuf by Yolin 
"
"
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! MySwitchToWorkBuf()
    let tempname = bufname("%")
    let nerdname = tempname

    if( strlen(nerdname) > 10 )
        let nerdname = strpart(nerdname,0,10)
    endif

    if(tempname == '' || nerdname == 'NERD_tree_' || tempname == '-MiniBufExplorer-' || tempname == '__Tagbar__')
        2 wincmd w
    endif

    let tempname = bufname("%")
    let nerdname = tempname

    if( strlen(nerdname) > 10 )
        let nerdname = strpart(nerdname,0,10)
    endif

    if(nerdname == 'NERD_tree_')
        execute "wincmd l"
    endif
    if(tempname == '__Tagbar__')
        execute "wincmd h"
    endif
    if(tempname == '-MiniBufExplorer-')
        execute "wincmd j"
    endif
    if(tempname == 'TransWindow')
        bd
    endif
    if(tempname == '.reddit')
        bd
        unmap o
        unmap O
    endif
    return 0
endfunction
command! -nargs=* -complete=file MySwitchToWorkBuf call MySwitchToWorkBuf()



"Yolin: change molokai color
hi Visual     ctermbg=238
hi CursorLine ctermbg=237   cterm=none
hi Comment    ctermfg=102
hi Underlined ctermfg=78    cterm=underline
"-------------- yolin end---------------
"
"
"
"
"Read pdf
command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> -
command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> - |fmt -csw78

exec ReloadAllCSCOPE()
