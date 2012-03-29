"getplugin
call pathogen#helptags()
call pathogen#runtime_append_all_bundles() 

" Enable filetype plugin
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
set mouse=a
"set esckeys
" Sets how many lines of history VIM has to remember.vimrc
set history=700
set display=lastline
" Set to auto read when a file is changed from the outside
if exists("&autoread")
set autoread
endif 

"no sound on errors
set noerrorbells
set novisualbell



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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4
"set expandtab
"set softtabstop=4
"set shiftwidth=4
"set smarttab
"set autoindent

set lbr
set tw=500

set wrap "Wrap lines

"set list
"set listchars=tab:\|\ 
"supertab
"minibuf
"
au BufWinEnter \[Buf\ List\] setl nonumber

function! AutoReflash()
    if !exists("g:grep_tmpfile")
        return
    else
        call MyReflashOpen()
    endif
endfunction
"autocmd SessionLoadPost *.cpp,*.h,*.c call AutoReflash()
"autocmd WinEnter *.cpp,*.h,*.c call AutoReflash()


"a.vim
let g:alternateSearchPath = 'sfr:./h,sfr:./include,sfr:./source,sfr:./src,sfr:./,sfr:./inc,sfr:../source,sfr:../src,sfr:../include,sfr:../inc'

"auto remove blank on line end
"autocmd FileType c,cpp,java,php,perl,python,ruby,sh,html,htm autocmd BufWritePre  :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

"Tlist.vim 
let Tlist_Exit_OnlyWindow = 1         "If only Tlist window works, vim exit.
let Tlist_Sort_Type = "order"          "sort by name
let Tlist_Show_One_File = 1
let Tlist_Use_Right_Window = 0

let g:EasyMotion_leader_key = 0

"NERD.vim
let NERDTreeWinPos="right"
"let NERDTreeMouseMode=3
"let NERDTreeShowBookmarks=1
"autorun
"autocmd VimEnter * NERDTreeToggle
"autocmd VimEnter * wincmd p

"map
set winaltkeys=no

noremap mf <esc>:FufFile<cr>
noremap mb <esc>:FufBuffer<cr>
noremap mm <esc>:FufBookmarkFileAdd<cr><cr>
noremap ms <esc>:FufBookmarkFile<cr>

nnoremap <space><space> :noh<cr>:call MySwitchToWorkBuf()<cr>

noremap <xF1> <esc>:TlistToggle<cr>:call MySwitchToWorkBuf()<cr>
noremap <leader><xF2> <esc>:NERDTreeFind<cr>
noremap <xF2> <esc>:NERDTreeToggle<cr>
noremap <xF3> <esc>:call MySwitchToWorkBuf()<cr>:let g:myGrepDir = "<c-r>=getcwd()<cr>/"<cr>:call MyGrep()<cr>
"map <xF4> <esc>:call MySavePrePos()<cr>]`zz:call MySaveNextPos()<cr>:call MyCircleMark()<cr>
"map <xF4> <esc>:call MyReplace()<cr>
"map <xF4> <esc>:FufFile<cr>
"map <xF5> <esc>:FufFile<cr>
"map <F7> <esc>:register<cr>
"map <F7> <esc>:silent! !cd <c-r>=getcwd()<cr>;ctags -R -f <c-r>=getcwd()<cr>/tags;cd - &<cr>
noremap <F6> <esc>:call SavePrePos()<cr>[`zz:call SaveNextPos()<cr>:call MyCircleMark(0)<cr>
noremap <F7> <esc>:call SavePrePos()<cr>]`zz:call SaveNextPos()<cr>:call MyCircleMark(1)<cr>
noremap <F8> <esc>:BufExplorer<cr>
noremap <F9> <esc>:set noexpandtab softtabstop=8 shiftwidth=8 tabstop=8
noremap <F10> :set cursorline!<CR><Bar>:echo "Highlight active cursor line: " . strpart("OffOn", 3 * &cursorline, 3)<CR>
noremap <F11> <esc>:call MyGenTag()<cr>
noremap <F12> <esc>:call MyReflashOpen()<cr>

inoremap <xF1> <esc>:call MySwitchToWorkBuf()<cr>:TlistToggle<cr>
inoremap <xF2> <esc>:call MySwitchToWorkBuf()<cr>:NERDTreeToggle<cr>
inoremap <leader><c-xF2> <esc>:NERDTreeFind<cr>
inoremap <xF3> <esc>:let g:myGrepDir = "<c-r>=getcwd()<cr>/"<cr>:MyGrep()<cr>
"inoremap <xF4> <esc>:FufFile<cr>
"inoremap <xF5> <esc>:FufFile<cr>
"inoremap <xF4> <esc>:call MyReplace()<cr>
"inoremap <F7> <esc>:register<cr>
"inoremap <F7> <esc>:silent! !cd <c-r>=getcwd()<cr>;ctags -R -f <c-r>=getcwd()<cr>/tags;cd - &<cr>
inoremap <F6> <esc>:call SavePrePos()<cr>[`zz:call SaveNextPos()<cr>:call MyCircleMark(0)<cr>
inoremap <F7> <esc>:call SavePrePos()<cr>]`zz:call SaveNextPos()<cr>:call MyCircleMark(1)<cr>
inoremap <F8> <esc>:BufExplorer<cr>
inoremap <F9> <esc>:set noexpandtab softtabstop=8 shiftwidth=8 tabstop=8
inoremap <F10> :set cursorline!<CR><Bar>:echo "Highlight active cursor line: " . strpart("OffOn", 3 * &cursorline, 3)<CR>
inoremap <F11> <esc>:call MyGenTag()<cr>
inoremap <F12> <esc>:call MyReflashOpen()<cr>

vnoremap <xF3> y<esc>:let g:myGrepDir = "<c-r>=getcwd()<cr>/"<cr>:let g:myGrepName = "<c-r>0"<cr>:call MyGrep()<cr>
"vnoremap <xF4> y<esc>:let g:myReplaceName = "<c-r>0"<cr>:call MyReplace()<cr>

"map <leader><leader> <c-w>w
"map <leader><backspace> <c-w>W
"map <leader>k <c-w>k
"map <leader>j <c-w>j
"map <leader>h <c-w>h
"map <leader>l <c-w>l

noremap <leader>/ <esc>:noh<cr>

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


"noremap <m-xLeft> <esc>:call MyShiftBuf(-1)<cr>
"noremap <m-xRight> <esc>:call MyShiftBuf(1)<cr>
"
"inoremap <m-xLeft> <esc>:call MyShiftBuf(-1)<cr>
"inoremap <m-xRight> <esc>:call MyShiftBuf(1)<cr>
noremap <m-xLeft> <esc>:bp<cr>
noremap <m-xRight> <esc>:bn<cr>

inoremap <m-xLeft> <esc>:bp<cr>
inoremap <m-xRight> <esc>:bn<cr>

"nnoremap <c-v> <c-r>+
vnoremap <c-x> "+x
vnoremap <c-c> "+y
vnoremap <c-v> "+p
inoremap <c-z> <esc>ui

inoremap <c-v> <space><esc>:set paste<cr>i<del><c-r>+<esc>:set nopaste<cr>i
"nnoremap <leader>u <ESC>:silent! !~/.vim/gentag.sh <c-r>=getcwd()<cr> &<cr>
inoremap <c-s> <ESC>:call MySwitchToWorkBuf()<cr>:update<cr>
nnoremap <c-s> <ESC>:call MySwitchToWorkBuf()<cr>:update<cr>
nnoremap <leader>q <ESC>:q<cr>:call MySwitchToWorkBuf()<cr>
nnoremap <leader>aq <ESC>:qa<cr>

"nnoremap <leader>f <ESC>i/*--$fake*/<CR>/*--$endfake*/<ESC>
"nnoremap <leader>r <ESC>i/*--$real<CR>*//*$endreal*/<ESC>
"nnoremap <leader>l <ESC>i$loop(int i=1; i <= function() ; i++)<CR>#STR function(i)#<CR>$endloop<ESC>
"nnoremap <leader>s <ESC>iprintf("[%d]yolin_debug:[%s]\n",__LINE__,<c-r>0);<ESC>
"nnoremap <leader>d <ESC>iprintf("[%d]yolin_debug:[%d]\n",__LINE__,<c-r>0);<ESC>
"nnoremap <leader>a <ESC>ialert("[1]yolin_debug:["+<c-r>0+"]");<ESC>

"nnoremap <leader>o <ESC>:FufFile<cr>
"nnoremap <leader>m <ESC>:FufBookmarkDir<cr>
"nnoremap <leader>b <ESC>:FufBuffer<cr>
"nnoremap <leader>r <ESC>i/*--$real<CR>*//*$endreal*/<ESC>

"au Filetype html,htm,xml,xsl source ~/.vim/scripts/closetag.vim
"autocmd VimEnter * source ~/.vim/Session.vim 
au BufRead * set expandtab softtabstop=4 shiftwidth=4
au BufRead *.ISD set noexpandtab softtabstop=8 shiftwidth=8
au BufRead *.in set noexpandtab softtabstop=4 shiftwidth=8
au BufRead Makefile set noexpandtab softtabstop=8 shiftwidth=8
au BufRead *.htm set filetype=htmlm4 noexpandtab softtabstop=8 shiftwidth=8
au BufRead *.html set filetype=htmlm4 noexpandtab softtabstop=8 shiftwidth=8
au BufRead *js.htm set filetype=js noexpandtab softtabstop=8 shiftwidth=8
au BufRead *js.html set filetype=js noexpandtab softtabstop=8 shiftwidth=8
au BufRead *css.htm set filetype=js noexpandtab softtabstop=8 shiftwidth=8
au BufRead *css.html set filetype=js noexpandtab softtabstop=8 shiftwidth=8
"au VimEnter * NERDTreeFind
set cscopequickfix=s-,c-,d-,i-,t-,e-

if has("cscope")
    set cscopetag
    set csto=0
    set nocsverb
    let i = 1
    while i < 20
        if filereadable("cscope.out")
            let db = getcwd() . "/cscope.out"
            "echo db
            let $CSCOPE_DB = db
            cs add $CSCOPE_DB
            let i = 20
        else
            cd ..
            let i += 1
        endif
    endwhile
    cs add /CSCOPE/cscope.out
    set cscopeverbose


    "nnoremap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>:bot cw<CR>:wincmd j<CR>
    "nnoremap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>:bot cw<CR>:wincmd j<CR>
    "nnoremap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>:bot cw<CR>:wincmd j<CR>
    "nnoremap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>:bot cw<CR>:wincmd j<CR>
    "nnoremap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>:bot cw<CR>:wincmd j<CR>
    "nnoremap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>:bot cw<CR>:wincmd j<CR>
    "nnoremap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>:bot cw<CR>:wincmd j<CR>
    "nnoremap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>:bot cw<CR>:wincmd j<CR>

    nmap <LEADER>s :cs find s <C-R>=expand("<cword>")<CR><CR>:bot cw<CR>:wincmd j<CR>
    "nmap <LEADER>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    "nmap <LEADER>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    "nmap <LEADER>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    "nmap <LEADER>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <LEADER>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    "nmap <LEADER>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <LEADER>d :cs find d <C-R>=expand("<cword>")<CR><CR>

    " Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
    " makes the vim window split horizontally, with search result displayed in
    " the new window.
    "
    " (Note: earlier versions of vim may not have the :scs command, but it
    " can be simulated roughly via:
    "    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>

    "nnoremap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>:bot cw<CR>:wincmd j<CR>
    "nnoremap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>:bot cw<CR>:wincmd j<CR>
    "nnoremap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>:bot cw<CR>:wincmd j<CR>
    "nnoremap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>:bot cw<CR>:wincmd j<CR>
    "nnoremap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>:bot cw<CR>:wincmd j<CR>
    "nnoremap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>:bot cw<CR>:wincmd j<CR>
    "nnoremap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>:bot cw<CR>:wincmd j<CR>
    "nnoremap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>:bot cw<CR>:wincmd j<CR>


    " Hitting CTRL-space *twice* before the search type does a vertical 
    " split instead of a horizontal one (vim 6 and up only)
    "
    " (Note: you may wish to put a 'set splitright' in your .vimrc
    " if you prefer the new window on the right instead of the left

    "nnoremap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>:bot cw
    "nnoremap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>:bot cw
    "nnoremap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>:bot cw
    "nnoremap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>:bot cw
    "nnoremap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>:bot cw
    "nnoremap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>:bot cw
    "nnoremap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>:bot cw
    "nnoremap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>:bot cw

endif



set hlsearch
colors yzlin256
"colors yolin

filetype on
filetype plugin on
filetype indent on
syntax on
set autochdir
"tabline
set tabline=%!SetTabLine()


function! SetTabLine()
    " NOTE: left/right padding of each tab was hard coded as 1 space.
    " NOTE: require Vim 7.3 strwidth() to display fullwidth text correctly.

    " settings
    let tabMinWidth = 0
    let tabMaxWidth = 40
    let tabMinWidthResized = 15
    let tabScrollOff = 5
    let tabEllipsis = '…'
    let tabDivideEquel = 0

    let s:tabLineTabs = []

    let tabCount = tabpagenr('$')
    let tabSel = tabpagenr()

    " fill s:tabLineTabs with {n, filename, split, flag} for each tab
    for i in range(tabCount)
        let tabnr = i + 1
        let buflist = tabpagebuflist(tabnr)
        let winnr = tabpagewinnr(tabnr)
        let bufnr = buflist[winnr - 1]

        let filename = bufname(bufnr)
        let filename = fnamemodify(filename, ':p:t')
        let buftype = getbufvar(bufnr, '&buftype')
        if filename == ''
            if buftype == 'nofile'
                let filename .= '[Scratch]'
            else
                let filename .= '[New]'
            endif
        endif
        let split = ''
        let winCount = tabpagewinnr(tabnr, '$')
        if winCount > 1   " has split windows
            let split .= winCount
        endif
        let flag = ''
        if getbufvar(bufnr, '&modified')  " modified
            let flag .= '+'
        endif
        if strlen(flag) > 0 || strlen(split) > 0
            let flag .= ' '
        endif

        call add(s:tabLineTabs, {'n': tabnr, 'split': split, 'flag': flag, 'filename': filename})
    endfor

    " variables for final oupout
    let s = ''
    let l:tabLineTabs = deepcopy(s:tabLineTabs)

    " overflow adjustment
    " 1. apply min/max tabWidth option
    if s:TabLineTotalLength(l:tabLineTabs) > &columns
        unlet i
        for i in l:tabLineTabs
            let tabLength = s:CalcTabLength(i)
            if tabLength < tabMinWidth
                let i.filename .= repeat(' ', tabMinWidth - tabLength)
            elseif tabMaxWidth > 0 && tabLength > tabMaxWidth
                let reserve = tabLength - StrWidth(i.filename) + StrWidth(tabEllipsis)
                if tabMaxWidth > reserve
                    let i.filename = StrCrop(i.filename, (tabMaxWidth - reserve), '~') . tabEllipsis
                endif
            endif
        endfor
    endif
    " 2. try divide each tab equal-width
    if tabDivideEquel
        if s:TabLineTotalLength(l:tabLineTabs) > &columns
            let divideWidth = max([tabMinWidth, tabMinWidthResized, &columns / tabCount, StrWidth(tabEllipsis)])
            unlet i
            for i in l:tabLineTabs
                let tabLength = s:CalcTabLength(i)
                if tabLength > divideWidth
                    let i.filename = StrCrop(i.filename, divideWidth - StrWidth(tabEllipsis), '~') . tabEllipsis
                endif
            endfor
        endif
    endif
    " 3. ensure visibility of current tab 
    let rhWidth = 0
    let t = tabCount - 1
    let rhTabStart = min([tabSel - 1, tabSel - tabScrollOff])
    while t >= max([rhTabStart, 0])
        let tab = l:tabLineTabs[t]
        let tabLength = s:CalcTabLength(tab)
        let rhWidth += tabLength
        let t -= 1
    endwhile
    while rhWidth >= &columns
        let tab = l:tabLineTabs[-1]
        let tabLength = s:CalcTabLength(tab)
        let lastTabSpace = &columns - (rhWidth - tabLength)
        let rhWidth -= tabLength
        if rhWidth > &columns
            call remove(l:tabLineTabs, -1)
        else
            " add special flag (will be removed later) indicating that how many
            " columns could be used for last displayed tab.
            if tabSel <= tabScrollOff || tabSel < tabCount - tabScrollOff
                let tab.flag .= '>' . lastTabSpace
            endif
        endif
    endwhile

    " final ouput
    unlet i
    for i in l:tabLineTabs
        let tabnr = i.n

        let split = ''
        if strlen(i.split) > 0
            if tabnr == tabSel
                let split = '%#TabLineSplitNrSel#' . i.split .'%#TabLineSel#'
            else
                let split = '%#TabLineSplitNr#' . i.split .'%#TabLine#'
            endif
        endif

        let text = ' ' . split . i.flag . i.filename . ' '

        if i.n == l:tabLineTabs[-1].n
            if match(i.flag, '>\d\+') > -1 || i.n < tabCount
                let lastTabSpace = matchstr(i.flag, '>\zs\d\+')
                let i.flag = substitute(i.flag, '>\d\+', '', '')
                if lastTabSpace <= strlen(i.n)
                    if lastTabSpace == 0
                        let s = strpart(s, 0, strlen(s) - 1)
                    endif
                    let s .= '%#TabLineMore#>'
                    continue
                else
                    let text = ' ' . i.split . i.flag . i.filename . ' '
                    let text = StrCrop(text, (lastTabSpace - strlen(i.n) - 1), '~') . '%#TabLineMore#>'
                    let text = substitute(text, ' ' . i.split, ' ' . split, '')
                endif
            endif
        endif

        let s .= '%' . tabnr . 'T'  " start of tab N

        if tabnr == tabSel
            let s .= '%#TabLineNrSel#' . tabnr . '%#TabLineSel#'
        else
            let s .= '%#TabLineNr#' . tabnr . '%#TabLine#'
        endif

        let s .= text

    endfor

    let s .= '%#TabLineFill#%T'
    return s
endf

function! s:CalcTabLength(tab)
    return strlen(a:tab.n) + 2 + strlen(a:tab.split) + strlen(a:tab.flag) + StrWidth(a:tab.filename)
endf

function! s:TabLineTotalLength(dict)
    let length = 0
    for i in (a:dict)
        let length += strlen(i.n) + 2 + strlen(i.split) + strlen(i.flag) + StrWidth(i.filename)
    endfor
    return length
endf



" }}}2   字串長度（column 數）   {{{2

function StrWidth(str)
    if exists('*strwidth')
        return strwidth(a:str)
    else
        let strlen = strlen(a:str)
        let mstrlen = strlen(substitute(a:str, ".", "x", "g"))
        if strlen == mstrlen
            return strlen
        else
            " Note: 暫不處理全形字（以下值不正確）
            return strlen
        endif
    endif
endf

" }}}2   依字串長度（column 數）裁切多餘文字   {{{2

function! StrCrop(str, len, ...)
    let l:padChar = a:0 > 0 ? a:1 : ' '
    if exists('*strwidth')
        let text = substitute(a:str, '\%>' . a:len . 'c.*', '', '')
        let remainChars = split(substitute(a:str, text, '', ''), '\zs')
        while strwidth(text) < a:len
            let longer = len(remainChars) > 0 ? (text . remove(remainChars, 0)) : text
            if strwidth(longer) < a:len
                let text = longer
            else
                let text .= l:padChar
            endif
        endwhile
        return text
    else
        " Note: 暫不處理全形字（以下值不正確）
        return substitute(a:str, '\%>' . a:len . 'c.*', '', '')
    endif
endf

set statusline=%1*%n%m%r%h%w%*\ %F\ [FORMAT=%{&ff}:%{&fenc!=''?&fenc:&enc}]\ [TYPE=%Y]\ [COL=%03v]\ [ROW=%03l/%L(%p%%)]

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

    if(tempname == '' || nerdname == 'NERD_tree_' || tempname == '-MiniBufExplorer-' || tempname == '__Tag_List__')
        2 wincmd w
    endif

    let tempname = bufname("%")
    let nerdname = tempname

    if( strlen(nerdname) > 10 )
        let nerdname = strpart(nerdname,0,10)
    endif

    if(nerdname == 'NERD_tree_')
        execute "wincmd h"
    endif
    if(tempname == '__Tag_List__')
        execute "wincmd l"
    endif
    if(tempname == '-MiniBufExplorer-')
        execute "wincmd j"
    endif
    return 0
endfunction
command! -nargs=* -complete=file MySwitchToWorkBuf call MySwitchToWorkBuf()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" myGrep by Yolin 
"
"
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:reflash_flag = 0
let g:myGrepName = ""
let g:myGrepDir = "/"
"we find the file before grep, so we neednot use option -r
let g:myGrepOption = "-snI"
let g:myGrepFiletype = "*"
let g:myGrepWholeName = "true"
let g:myGrepCmd = ""
let g:myGrepIndex = 0
function! MyGrep()
    "let g:myGrepDir = expand(getcwd())
    execute "silent! !killall -q pscheck.sh"
    let tmp = 1
    while tmp != 0 
        if g:myMenuIndex == 0
            let tmp = RecMyGrep()
            if tmp ==1
                let g:myMenuIndex = 0
            elseif tmp == 3
                let g:myMenuIndex = 1
            elseif tmp == 4
                let g:myMenuIndex = 0
            endif
        elseif g:myMenuIndex == 1
            let tmp = RecMyReplace()
            if tmp ==1
                let g:myMenuIndex = 1
            elseif tmp == 3
                let g:myMenuIndex = 1
            elseif tmp == 4
                let g:myMenuIndex = 0
            endif
        endif
        if tmp == 0
            redraw!
            return
        endif

    endwhile
    return 0
endf

function! ShowMyGrep()
    redraw!
    let startidx = 0
    let endidx = 5

    let flag = 0
    let i = 1
    let fttemp = split(g:myGrepFiletype,',')
    let findfiletype = '-name "'.fttemp[0]
    while flag == 0
        let a = exists("fttemp[i]")
        if (a != 0)
            let findfiletype = findfiletype.'" -o -name "'.fttemp[i]
            let i += 1
        else
            let findfiletype = findfiletype.'"'
            let flag = 1
        endif
    endwhile
    if(g:myGrepWholeName=="true")
        let grepname = '"'.g:myGrepName.'"'
    else
        let grepname = g:myGrepName
    endif

    let g:myGrepCmd = 'find '.g:myGrepDir.' '.findfiletype.' | xargs -l10 egrep '.g:myGrepOption.' '.grepname

    let tmp = [ 'command:'.g:myGrepCmd, ' 1) Name:'.g:myGrepName, ' 2) Dir:'.g:myGrepDir, ' 3) Option:'.g:myGrepOption, ' 4) File type:'.g:myGrepFiletype, ' 5) Match all:'.g:myGrepWholeName] 

    echo '=[Search]= Replace ='
    echo '-----------------------------------------'
    let sting = ' '
    let i = 0
    while i <= endidx
        if( g:myGrepIndex == i )
            let string = '>'.tmp[i]
        else
            let string = ' '.tmp[i]
        endif
        echo string
        let i += 1
    endwhile
    echo '-----------------------------------------'
    echo 'Usage: <F12> start, <q> quit' 
    let idxdo = [0,0]
    let idxdo =  MyGetInput(startidx,endidx,g:myGrepIndex)
    let g:myGrepIndex = idxdo[0]
    return idxdo[1]
endf
"command! -nargs=* -complete=file ShowMyGrep call ShowMyGrep()

function! RecMyGrep()
    let action = ShowMyGrep()
    let recursive = 1
    if(action==1)
        if(g:myGrepName == "" || g:myGrepDir == "" || g:myGrepOption == "")
            redraw!
            echohl ErrorMsg | echo "Input error" | echohl None
        else
            let tmpfile = ''
            call delete(tmpfile)
            let g:grep_tmpfile = tempname()
            execute "silent! !killall -q egrep"
            execute 'silent! !'.g:myGrepCmd.' > '.g:grep_tmpfile.'&'
            redraw!
            let old_efm = &efm
            set efm=%f:%\\s%#%l:%m
            execute 'silent! !cat '.g:grep_tmpfile.' > '.g:grep_tmpfile.'.tmp'
            execute "silent! cgetfile ".g:grep_tmpfile.'.tmp'
            let &efm = old_efm
            botright copen
            redraw!
            let g:reflash_flag = 0
            let recursive = 0
            execute 'silent! !~/.vim/pscheck.sh '.g:grep_tmpfile.' find egrep xxxxxxx &'
        endif
    elseif(action == 2 || action ==5 )
        if(g:myGrepIndex == 1)
            echo "\n"
            if (action == 5)
                let tmp = input("Word:","", "file")
            else
                let tmp = input("Word:",g:myGrepName, "file")
            endif
            if(tmp!="")
                let g:myGrepName = tmp
            endif
        elseif(g:myGrepIndex == 2)
            echo "\n"
            if (action == 5)
                let tmp = input("Dir:","","file")
            else
                let tmp = input("Dir:",g:myGrepDir,"file")
            endif
            if(tmp!="")
                let g:myGrepDir = tmp
            endif
            if(!isdirectory(g:myGrepDir))
                let g:myGrepDir = expand(getcwd())
            endif
        elseif(g:myGrepIndex == 3)
            echo "\n"
            if (action ==5)
                let tmp = input("options:","")
            else
                let tmp = input("options:(don't use r)","-isnI")
            endif
            if(tmp!="")
                let g:myGrepOption = tmp
            endif
        elseif(g:myGrepIndex == 4)
            echo "\n"
            if (action ==5)
                let tmp = input("Filetype:","")
            else
                let tmp = input("Filetype:","*")
            endif
            if(tmp!="")
                let g:myGrepFiletype = tmp
            endif
        elseif(g:myGrepIndex == 5)
            echo "\n"
            if (g:myGrepWholeName=="true")
                let g:myGrepWholeName = "flase"
            else
                let g:myGrepWholeName = "true"
            endif
        endif
    elseif( action == -1)
        let recursive = 0
    elseif( action ==4 )
        let recursive = 4
    elseif( action ==3 )
        let recursive = 3
    endif
    return recursive
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" myReplace by Yolin 
"
"
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:myReplaceRange = "%s"
let g:myReplaceName = ""
let g:myReplaceToName = ""
let g:myReplaceOption = "gce"
let g:myReplaceDir = ""
let g:myReplaceWholeName = "true"
let g:myReplaceCmd = "" 
let g:myReplaceIndex = 0

function! MyReplace()
    return 0
endf

function! ShowMyReplace()
    redraw!
    
    let startidx = 0
    let endidx = 6

    if(g:myReplaceWholeName=="true")
        let replacename = "\\<".g:myReplaceName."\\>"
    else
        let replacename = g:myReplaceName
    endif
    let g:myReplaceCmd = g:myReplaceRange."/".replacename."/".g:myReplaceToName."/".g:myReplaceOption
    let tmp = [ 'command:'.g:myReplaceCmd,' 1) Range:'.g:myReplaceRange, ' 2) Name:'.g:myReplaceName, ' 3) NameTo:'.g:myReplaceToName, ' 4) Option:'.g:myReplaceOption, ' 5) Forder or File:'.g:myReplaceDir, ' 6) Match all:'.g:myReplaceWholeName] 

    echo '= Search =[Replace]='
    echo '-----------------------------------------'
    let sting = ' '
    let i = 0
    while i <= endidx 
        if( g:myReplaceIndex == i )
            let string = '>'.tmp[i]
        else
            let string = ' '.tmp[i]
        endif
        echo string
        let i += 1
    endwhile
    echo '-----------------------------------------'
    echo 'Usage: <F12> start, <q> quit'
    
    let idxdo = [0,0] "return index and options
    let idxdo =  MyGetInput(startidx,endidx,g:myReplaceIndex)
    let g:myReplaceIndex = idxdo[0]
    return idxdo[1]
endf
"command! -nargs=* -complete=file ShowMyReplace call ShowMyReplace()

function! RecMyReplace()
    let action = ShowMyReplace()
    let recursive = 1
    if(action == 1) "press F12
        if(g:myReplaceRange == "" || g:myReplaceName == "" || g:myReplaceOption == "")
            redraw!
            echohl ErrorMsg | echo "Input error" | echohl None
        else
            if (g:myReplaceDir=="")
                execute g:myReplaceCmd
            else
                execute 'argdelete *'
                execute 'args `ls '.g:myReplaceDir.'`'
                execute 'argdo '.g:myReplaceCmd
            endif
            redraw!
            let recursive = 0
        endif
    elseif (action == 2 || action == 5)
        if(g:myReplaceIndex==1)
            echo "\n"
            if (action ==5)
                let tmp = input("Range:","")
            else
                let tmp = input("Range:","%s")
            endif
            if(tmp!="")
                let g:myReplaceRange = tmp
            endif
        elseif(g:myReplaceIndex==2)
            echo "\n"
            if (action ==5)
                let tmp = input("Name:","")
            else
                let tmp = input("Name:",g:myReplaceName)
            endif
            if(tmp!="")
                let g:myReplaceName = tmp
            endif
        elseif(g:myReplaceIndex==3)
            if (action ==5)
                let g:myReplaceToName = input("NameTo:","")
            else
                let g:myReplaceToName = input("NameTo:",g:myReplaceToName)
            endif
        elseif(g:myReplaceIndex==4)
            echo "\n"
            if (action ==5)
                let g:myReplaceOption = input("Option:","")
            else
                let g:myReplaceOption = input("Option:",g:myReplaceOption)
            endif
        elseif(g:myReplaceIndex==5)
            echo "\n"
            if (action ==5)
                let tmp = input("Dir:","")
            else
                let tmp = input("Dir:",expand(getcwd()))
            endif
            if(isdirectory(tmp) || tmp=="")
                let g:myReplaceDir = tmp
            endif
        elseif(g:myReplaceIndex==6)
            echo "\n"
            if (g:myReplaceWholeName=="true")
                let g:myReplaceWholeName = "flase"
            else
                let g:myReplaceWholeName = "true"
            endif
        endif
    elseif( action == -1)
        let recursive = 0
    elseif( action == 4 )
        let recursive = 4
    elseif( action == 3 )
        let recursive = 3
    endif
    return recursive
endf

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" myGenTag by Yolin 
"
"
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:CSCOPE_FILE = 'cscope.files'
let g:CSCOPE_OUT = 'cscope.out'
let g:myGenTagDir = '/'
let g:myGenTagFileType = "*.c,*.h,*.cpp,*.htm,*.html,*.js,Makefile.*,Makefile,*.make"
let g:myGenTagOption = "cscope"
let g:myGenIndex = 1
"let g:myGenGetcsshow = ""

function! MyGenTag()
    call MySwitchToWorkBuf()
    execute "cs show" 
    let g:myGenTagDir = expand(getcwd())
    let tmp = 1
    while tmp != 0
        let tmp = RecMyGenTag()
        if tmp == 0
            redraw!
            return
        elseif tmp == 3
        elseif tmp == 4
        endif
    endwhile
endfunc

function! ShowMyGenTag()
    let startidx = 0
    let endidx = 7
    let tmp = ['Gen action:', ' 1) Dir:'.g:myGenTagDir, ' 2) Type:'.g:myGenTagFileType, ' -----------', 'cscope action:', ' 5) Show', ' 6) Add',' 7) Delete']
    let sting = ' '
    let i = 0
    while i <= endidx 
        if( g:myGenIndex == i )
            let string = '>'.tmp[i]
        else
            let string = ' '.tmp[i]
        endif
        echo string
        let i += 1
    endwhile

    let idxdo = [0,0] "return index and options
    let idxdo =  MyGetInput(startidx,endidx,g:myGenIndex)
    let g:myGenIndex = idxdo[0]

    return idxdo[1]
endfunc

function! RecMyGenTag()
    let action = ShowMyGenTag()
    let recursive = 1
    if(action == 0)
        redraw!
    elseif(action == 1) "press <f12>
        redraw!
        let recursive = 0
        let tmpfile = ''
        call delete(tmpfile)
        let g:tag_tmpfile = tempname()
        execute "silent! !killall -q cscope &"

        let fttemp = split(g:myGenTagFileType,',')
        let findfiletype = '-name "'.fttemp[0]
        let i = 1
        let flag = 0
        while flag == 0
            let a = exists("fttemp[i]")
            if (a != 0)
                let findfiletype = findfiletype.'" -o -name "'.fttemp[i]
                let i += 1
            else
                let findfiletype = findfiletype.'"'
                let flag = 1
            endif
        endwhile

        let old_efm = &efm
        set efm=%f:%\\s%#%l:%m
        execute 'silent! !find '.g:myGenTagDir.' '.findfiletype.' > '.g:myGenTagDir.'/'.g:CSCOPE_FILE. ' && cscope -bkq -i '.g:myGenTagDir.'/'.g:CSCOPE_FILE.' -f '.g:myGenTagDir.'/'.g:CSCOPE_OUT. ' && echo start > '.g:tag_tmpfile. '&& cp ' .g:tag_tmpfile.' '.g:tag_tmpfile.'.tmp &'
        redraw!
        "execute "silent! cgetfile ".g:tag_tmpfile.'.tmp'
        "execute "silent! cs kill -1"
        "execute "silent! cs add ".g:myGenTagDir
        "let &efm = old_efm
        "botright copen
        let g:reflash_flag = 1
    elseif(action == 2 || action ==5 )
        if (g:myGenIndex==1)
            if (action ==5)
                let g:myGenTagDir=input("Dir:","","file")
            else
                let g:myGenTagDir=input("Dir:",expand("%:p:h"),"file")
            endif
            redraw!
        elseif (g:myGenIndex==2)
            if (action ==5)
                let g:myGenTagFileType=input("File type:","")
            else
                let g:myGenTagFileType=input("File type:",g:myGenTagFileType)
            endif
            redraw!
        "not use
        " elseif (g:myGenIndex==3)
        "     if (action ==5)
        "         let g:myGenTagOption=input("cscope or ctags(both,cscope,ctags):","")
        "     else
        "         let g:myGenTagOption=input("cscope or ctags(both,cscope,ctags):",g:myGenTagOption)
        "     endif
        "     redraw!
        "--not use
        elseif(g:myGenIndex == 5)
            redraw!
            execute 'cs show'
        elseif(g:myGenIndex == 6)
            let cstemp = input("Dir?",expand("%:p:h"),"file")
            redraw!
            execute 'cs add '.cstemp
        elseif(g:myGenIndex == 7)
            let cstemp = input("Delete?")
            redraw!
            execute 'cs kill '.cstemp
        endif
    elseif(action == 3)
        let recursive = 3
        redraw!
    elseif(action ==4)
        let recursive = 4
        redraw!
    elseif(action == -1)
        let recursive = 0
        redraw!
    endif
    return recursive

endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" myReflash by Yolin 
"
"
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! MyReflashOpen()
    let old_efm = &efm
    if(bufname("%")== '') "quickfix
        let savepos = line('.')
    endif
    set efm=%f:%\\s%#%l:%m
    if(g:reflash_flag==0)
        if !exists("g:grep_tmpfile")
            echohl ErrorMsg | echo "MyGrep must be run first" | echohl None
            return
        else
            let filename = g:grep_tmpfile
        endif
    elseif(g:reflash_flag==1)
        if !exists("g:tag_tmpfile")
            echohl ErrorMsg | echo "MyGenTag must be run first" | echohl None
            return
        else
            let filename = g:tag_tmpfile
        endif
    endif
    
    if !filereadable(filename)
        echohl ErrorMsg | echo "Cannot open : " . filename | echohl None
        return
    endif

    if(g:reflash_flag==0)
        "execute 'silent! !~/.vim/pscheck.sh '.filename.' find egrep xxxxxxx'
        execute 'silent! !cp '.filename.' '.filename.'.tmp'
        redraw!
        execute "silent! cgetfile ".filename.'.tmp'
        let &efm = old_efm
        if(bufname("%")== '') "quickfix
            "botright copen
            execute savepos
        endif
    elseif(g:reflash_flag==1) "gentag
        "execute 'silent! !~/.vim/pscheck.sh '.filename.' find cscope xxxxx &'
        execute "silent! cs kill -1"
        execute "silent! cs add ".g:myGenTagDir
        execute "cs show"
    endif
    return
endfunction

function! MyGetInput(start,end,idx)
    let tmp = [0,0] "index,option  -1:quit,0:do nothing,1:enter,2:edit,3:switch,4:back switch
    let tmp[0] = a:idx
    let gc = getchar()
    let nc = nr2char(gc)
    let i = '0'

    if gc=="\<right>" || nc == 'l'
        let tmp[1] = 3
    elseif gc=="\<left>" || nc == 'h'
        let tmp[1] = 4
    elseif gc == "\<backspace>"
        let tmp[1] = 5
    elseif nc == "i" || nc == 'a' || nc == "\r" || nc == "\n"
        let tmp[1] =  2
    elseif gc == "\<up>" || nc == 'k'
        let tmp[0] -= 1
        if(tmp[0]<a:start)
            let tmp[0] = a:end
        endif
        let tmp[1] =  0
    elseif gc == "\<down>" || nc == 'j'
        let tmp[0] += 1
        if(tmp[0]>a:end)
            let tmp[0] = a:start
        endif
        let tmp[1] = 0
    elseif  gc == "\<F12>"
        let tmp[1] = 1 
    elseif nc == nr2char(27)  || nc == "q" "escape
        let tmp[1] = -1
    elseif nc == '0'
        if(0<=a:end)
            let tmp = [0,2]
        endif
    elseif nc == '1'
        if(1<=a:end)
            let tmp = [1,2]
        endif
    elseif nc == '2'
        if(2<=a:end)
            let tmp = [2,2]
        endif
    elseif nc == '3'
        if(3<=a:end)
            let tmp = [3,2]
        endif
    elseif nc == '4'
        if(4<=a:end)
            let tmp = [4,2]
        endif
    elseif nc == '5'
        if(5<=a:end)
            let tmp = [5,2]
        endif
    elseif nc == '6'
        if(6<=a:end)
            let tmp = [6,2]
        endif
    elseif nc == '7'
        if(7<=a:end)
            let tmp = [7,2]
        endif
    elseif nc == '8'
        if(8<=a:end)
            let tmp = [8,2]
        endif
    elseif nc == '9'
        if(9<=a:end)
            let tmp = [9,2]
        endif
    endif
    return tmp
endfunc

"function! MyToggle()
"    if(bufwinnr("__Tagbar__") != -1 && bufwinnr("NERD_tree_1") == -1)
"        execute "TagbarToggle"
"    elseif(bufwinnr("__Tagbar__") == -1 && bufwinnr("NERD_tree_1") != -1)
"        execute "NERDTreeToggle"
"    elseif(bufwinnr("__Tagbar__") != -1 && bufwinnr("NERD_tree_1") != -1)
"        execute "NERDTreeToggle"
"        execute "TagbarToggle"
"        2 wincmd w
"    else
"        execute "TagbarToggle"
"        execute "NERDTreeToggle"
"    endif
"endfunction

let g:mySavePrePos = 0
let g:mySaveNextPos = 0
let g:mySearchPos = ""
function! SavePrePos()
    let g:mySavePrePos = line('.')
endfunc
function! SaveNextPos()
    let g:mySaveNextPos = line('.')
endfunc
function! MyCircleMark(goto)
        if g:mySavePrePos == g:mySaveNextPos
            if a:goto == 0
                execute "silent".feedkeys("G")
                let g:mySearchPos="Search start on Bottom."
            else
                execute "silent".feedkeys("gg")
                let g:mySearchPos="Search start on Top."
            endif
            return
        else
            echo g:mySearchPos
            let g:mySearchPos = "Mark search."
            return
        endif
    endif
endfunction

function! MyShiftBuf(direct)
    call MySwitchToWorkBuf()
    if(a:direct == -1)
        execute "bprevious"
        if(bufname("%")=="")
            execute "bprevious"
        endif
    elseif(a:direct == 1)
        execute "bnext"
        if(bufname("%")=="")
            execute "bnext"
        endif
    endif
endfunction
