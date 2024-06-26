"make leftmost column some beautiful color +
"column 80 red (and scary. don't go)
set foldcolumn=1
highlight FoldColumn ctermbg=6
set colorcolumn=80

"searh options:
"  _h_igh_l_ight _search_ + while typing the search (_inc_rementally)
set hlsearch incsearch
"  _case_ insensitive (_ignore_) +
"  become case sensitive in capital letters (_smart_)
set ignorecase smartcase

"self explanatory and awesome
set autoindent

"tab options:
"  it is 2 spaces + make it actual spaces (_expand_) +
"  auto _shift(width)_ (e.g. inside multiline paren expr) is also 2 spaces
set tabstop=2 expandtab shiftwidth=2

"start _scroll_ing 10 lines (_off_set) before hitting any edge
"because why would you want your cursor that far
set scrolloff=10

"_show_ where a line is broken(_break_) because of hugeness
"with "--->" as the 4 first chars (cannot be reached by cursor)
set showbreak=--->

"_show_ number of selected characters in visual mode
"  (among other things it seems)
set showcmd

"disable swap files (saved my life)
set noswapfile

"You'll probably need -> :help key-notation

"If system clipboard copy and paste don't work: sudo apt intall vim-gtk
"  (if not in debian-based distro figure it out by yourself)

"Always noremap so that I don't use macros inside macros and
"  confuse myself I guess

"general maps (I believe that means normal + visual mode)

  "left/down/up/right for normal people
  "  that follow the standard typing guidelines
  noremap j h
  noremap k j
  noremap l k
  noremap ; l

  "_s_earch
  noremap s /
  "x: delete and get into insert mode (deletes cursor char in normal mode)
  noremap x s

  "go to first char of line
  noremap <Space>j ^
  "go to last char of line
  noremap <Space>; $h
  "toggle between opening and closing in all brackets
  noremap zj %

  "LOVE these
  "  next/previous search match + center cursor vertically
  noremap n nzz
  noremap N Nzz
  "  paragraph down/up (next/previous empty line) + center cursor vertically
  noremap K }zz
  noremap L {zz
  "  half page down/up + center cursor vertically
  noremap <C-k> <C-d>zz
  noremap <C-l> <C-u>zz

  "down/up for huge lines that are broken
  "  (better to use gq to fix them but just in case)
  noremap gk gj
  noremap gl gk

"normal mode maps

  "_c_opy line into system clipboard
  nnoremap c "+yy

  "_D_elete line (into system clipboard)
  nnoremap D "+dd

  "_d_elete single character (into system clipboard)
  nnoremap d "+x

  "_r_eplace all occurences of word under cursor with ...
  nnoremap r :%s/\<<C-r><C-w>\>//g<Left><Left>

  "remove search highlighting
  nnoremap h :noh<CR>

  "_p/P_aste after/at cursor from clipboard
  nnoremap p "+p
  nnoremap P "+P

  "_s_earch word under cursor + center cursor vertically
  nnoremap <Space>s *Nzz

  "_S_earch Word under cursor + center cursor vertically
  nnoremap S viWy/\V<C-R>=escape(@",'/\')<CR><CR>N

  "delete Word and get into insert mode
  nnoremap X viWs

  "save
  nnoremap <Space>z :w<CR>

  "_q_uit (without saving)
  nnoremap <Space>q :q!<CR>

  "add space at/after cursor
  nnoremap <Space>i i<Space><Esc>
  nnoremap <Space>a a<Space><Esc>

  "add empty line above/below cursor
  nnoremap <Space>O O<Esc>j
  nnoremap <Space>o o<Esc>k

  "(add tab/remove tab) at cursor
  nnoremap <Space>> <C-v>>
  nnoremap <Space>< <C-v><

  "space + c + letter => copy line to register with that letter
  nnoremap <expr> <Space>c "\"" . nr2char(getchar()) . "yy"

  "space + p/P + letter
  "  => _p/P_aste from register with that letter: after/at cursor
  nnoremap <expr> <Space>p "\"" . nr2char(getchar()) . "p"
  nnoremap <expr> <Space>P "\"" . nr2char(getchar()) . "P"

  "find character with f + char (does it with search so that n/N can be used)
  nnoremap <expr> f "/" . nr2char(getchar()) . "<CR>:noh<CR>"
  "same but backwards with F instead of f
  nnoremap <expr> F "/" . nr2char(getchar()) . "<CR>N:noh<CR>"

  "enclose Word in () [] {} <> "" ''
  nnoremap <Space>ep viWs(<c-r>")<Esc>%
  nnoremap <Space>es viWs[<c-r>"]<Esc>%
  nnoremap <Space>eb viWs{<c-r>"}<Esc>%
  nnoremap <Space>e< viWs<<c-r>"><Esc>
  nnoremap <Space>e" viWs"<c-r>""<Esc>
  nnoremap <Space>e' viWs'<c-r>"'<Esc>
  nnoremap <Space>e\| viWs\|<c-r>"\|<Esc>

  "edit file under cursor
  nnoremap <Space>f :w<CR>gf
  "In most files I have a few lines with all the other files I usually switch
  "to from there. I use this to switch fast. It's usually a commented area
  "at the bottom of the file so that I can combine it in with G.

  "run command under cursor and print output underneath
  nnoremap <Space>r 0v$h"cy:r!<C-r>c<CR>

  "increase/decrease int
  nnoremap <Space>mi <C-a>
  nnoremap <Space>md <C-x>

  "select all
  nnoremap <C-a> ggVG

  "comment/uncomment selected text
    "Haskell
    nnoremap <Space>CH I-- <Esc>
    nnoremap <Space>UH ^d3l

    "Bash
    nnoremap <Space>CB I# <Esc>
    nnoremap <Space>UB ^d2l<Esc>

    "Python
    nnoremap <Space>CP I# <Esc>
    nnoremap <Space>UP ^d2l<Esc>

  "stop recording
  nnoremap <C-j> q

  "(vim) help on the word under the cursor
  nnoremap <Space>H K

  "latex maps
    "reload pdf
    nnoremap R :w<CR> :! pdflatex -output-directory Pdf %<CR><CR>

"visual mode maps

  "replace all occurences of visually selected text
  vnoremap r "hy:%s/<C-r>h//g<Left><Left>

  "search visually selected text
  vnoremap <Space>s y/\V<C-R>=escape(@",'/\')<CR><CR>N

  "replace something inside only inside the viusally selected text
  vnoremap <Space>r :s///g<Left><Left><Left>

  "go to normal mode
  vnoremap <C-j> <Esc><Esc>

  "space at cursor column (used in visual block for multiple lines)
  vnoremap <Space>i I<Space><Esc>

  "copy/delete visually selected text
  vnoremap c "+y
  vnoremap d "+d

  "space + c + letter => copy visually selected text to register with that letter
  vnoremap <expr> <Space>c "\"" . nr2char(getchar()) . "y"

  "enclose visually selected text in () [] {} <> "" ''
  vnoremap <Space>ep s(<c-r>")<Esc>%
  vnoremap <Space>es s[<c-r>"]<Esc>%
  vnoremap <Space>eb s{<c-r>"}<Esc>%
  vnoremap <Space>e< s<<c-r>"><Esc>
  vnoremap <Space>e" s"<c-r>""<Esc>
  vnoremap <Space>e' s'<c-r>"'<Esc>
  vnoremap <Space>e\| s\|<c-r>"\|<Esc>

  "select all text inside () [] {} || line
  vnoremap ip ib
  vnoremap is i[
  vnoremap ib i{
  vnoremap i\| <Esc>F\|lvf\|h
  vnoremap il <Esc>0v$h

  "select all text inside and including () [] {}
  vnoremap ap ab
  vnoremap as a[
  vnoremap ab a{

  "_p_aste on top of selected text
  vnoremap p "+p
  "space + p + letter: same but for the contents of a register
  vnoremap <expr> <Space>p "\"" . nr2char(getchar()) . "p"

  "find character with f + char (does it with search so that n/N can be used)
  vnoremap <expr> f "/" . nr2char(getchar()) . "<CR>"
  "same but beginning at the previous instance instead of the next
  vnoremap <expr> F "/" . nr2char(getchar()) . "<CR>N"

  "comment/uncomment selected text
    "Haskell
    vnoremap <Space>CH qo<Esc>i-- <Esc>
    vnoremap <Space>UH qo<Esc>d3l

    "Bash
    vnoremap <Space>CB qo<Esc>i# <Esc>
    vnoremap <Space>UB qo<Esc>d2l

    "Python
    vnoremap <Space>CP qo<Esc>i# <Esc>
    vnoremap <Space>UP qo<Esc>d2l

  "latex
    "enclose visually selected text in begin-end block
    vnoremap <Space>be "vdi\begin{__}<CR>\end{__}<CR><Esc>kk"vp/__<CR>N

"insert mode maps

  "autocomplete with tab
  inoremap <Tab> <C-n>
  "k l navigation in autocomplete
  inoremap <expr> k pumvisible() ? "\<C-N>" : "k"
  inoremap <expr> l pumvisible() ? "\<C-P>" : "l"

  "open and close automatically () [] {} <> "" ''
  inoremap ( ()<Esc>i
  inoremap [ []<Esc>i
  inoremap { {}<Esc>i
  inoremap < <><Esc>i
  inoremap " ""<Esc>i
  inoremap ' ''<Esc>i

  "go to normal mode
  inoremap <expr> <C-j> "<Esc>" . (reg_recording() == "v" ? "q" : "")

"command mode maps

  "go to previous/next in searches or commands
  cnoremap <C-l> <C-p>
  cnoremap <C-k> <C-n>

  "paste in command mode
  cnoremap <C-p> <C-r>+

"custom commands
  "source vimrc
  command! S execute "source ~/.vimrc"
  "run current (script) file
  command! R execute "!./%"

  "Latex
    "textit
    command! Ltit execute "norm i\\textit{"
    "texttt
    command! Lttt execute "norm i\\texttt{"
    "textbf
    command! Ltbf execute "norm i\\textbf{"
    "\verb
    command! Lverb execute "norm i\\verb||"
    "\begin - end
    command! Lbegin execute
      \ "norm o\\begin{__<Esc>o\\end{__<Esc><Space>oO<CR>\\item<CR><Esc>" .
      \ "{{/__<CR>"

    "enclose textit
    command! Letit execute "norm viW<Space>ebi\\textit<Esc>:noh<CR>E"
    "enclose texttt
    command! Lettt execute "norm viW<Space>ebi\\texttt<Esc>:noh<CR>E"
    "enclose textbf
    command! Letbf execute "norm viW<Space>ebi\\textbf<Esc>:noh<CR>E"
    "enclose verb
    command! Leverb execute "norm viW<Space>e|Bi\\verb<Esc>:noh<CR>E"


  "Haskell
    "value
    command! Hvalue execute
      \ "norm o___ :: __<CR>___ = __<Cr><Esc>{/___<CR>"
    "data
    command! Hdata execute
      \ "norm odata __ =<CR>  __ \| __<CR><Esc>{/__<CR>"
    "type
    command! Htype execute
      \ "norm otype __ = __<CR><Esc>{/__<CR>"
    "class
    command! Hclass execute
      \ "norm oclass __ where<CR>  __ :: __<CR><Esc>{/__<CR>"
    "instance
    command! Hinstance execute
      \ "norm oinstance __ where<CR>  __ = __<CR><Esc>{/__<CR>"

  "save + load current (haskell) file in ghci
  command! G execute "call Ghci()"
  command! GL execute "call GhciLong()"

"vim functions
function Ghci()
  w
  !ghci -XLambdaCase %
endfunction

function GhciLong()
  w
  !file=$(basename $(pwd))/%; cd ..; ghci -XLambdaCase $file
endfunction

"encoding
set encoding=utf-8
"syntax highlihting
syntax on
"autocomplete in command mode (it helps, not really sure how though :p)
set wildmode=full

"enable K (which is mapped to <Space>h above)
"for help about word under cursor in vimrc
autocmd BufRead ~/.vimrc setlocal keywordprg=:help

"regular tab for Makefile
autocmd BufRead */Makefile set noexpandtab

"remove all whitespace before end of line
"  because if there is an empty line with space jumping paragraphs doens't work
"  properly and it's very annoying
autocmd BufWritePre * :%s/\s\+$//e
