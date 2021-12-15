set encoding=utf-8
set autoindent
set background=dark
set backspace=indent,eol,start
set browsedir=current
set colorcolumn=80
set completeopt=menu
set completefunc=.,w,b,u,t,i
"set cursorbind
set encoding=utf-8
set expandtab
set hlsearch
set incsearch
set list
set listchars=tab:>-,trail:~,extends:>,precedes:<
set number
set tabstop=4
set scrolloff=8
set shiftwidth=4
set splitright
syntax on

"Disable EX mode
:map Q <Nop>


"plugins
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'ctrlp.vim'
Plugin 'roxma/nvim-yarp'
Plugin 'tpope/vim-surround'
"Plugin 'shougo/deoplete.nvim'
Plugin 'vim-airline/vim-airline'
Plugin 'roxma/vim-hug-neovim-rpc'
Plugin 'udalov/kotlin-vim'
Plugin 'evidens/vim-twig'
call vundle#end()
filetype plugin indent on


"syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_go_checkers = ['govet', 'go', 'golint']
let g:loaded_syntastic_java_javac_checker = 1
let g:syntastic_css_csslint_args = "--warnings=none"


" deoplete config
let g:deoplete#enable_at_startup = 1

" airline config
let g:airline#extensions#tabline#enabled = 1


" Search highlighting colors
hi Search guifg=NONE guibg=DarkMagenta
hi Search ctermfg=NONE ctermbg=DarkMagenta


" autoclosing brackets
inoremap {          {}<Left>
inoremap {<CR>      {<CR>}<Esc>O
inoremap {<Right>   {
inoremap {<Backspace> <Left><Right>
inoremap {}         {}

" autoclosing parenthesis
inoremap (        ()<Left>
inoremap (<Right> (
inoremap (<Backspace> <Left><Right>
inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"

" autoclosing crochet
inoremap [        []<Left>
inoremap [<Right> [
inoremap [<Backspace> <Left><Right>
inoremap <expr> ] strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"

" autoclosing quotes
inoremap <expr> ' strpart(getline('.'), col('.')-1, 1) == "\'" ? "\<Right>" : "\'\'\<Left>"
inoremap '<Right> '
inoremap '<Backspace> <Left><Right>
inoremap <expr> " strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<Right>" : "\"\"\<Left>"
inoremap "<Right> "
inoremap "<Backspace> <Left><Right>

" other extensions
au BufNewFile,BufRead *.ejs set filetype=html
autocmd FileType html setlocal noet

au BufNewFile,BufRead *.vue set filetype=vue
autocmd FileType vue setlocal et
autocmd FileType vue setlocal ts=2
autocmd FileType vue setlocal sw=2
autocmd FileType vue setlocal syntax=html

" haskell
let hs_highlight_types = 1

" eclipse-like tab movements
inoremap <expr> <tab> EclipseTab()
function EclipseTab()
    let chr = strpart(getline('.'), col('.')-1, 1)
    if chr == "}"
        return "\<Right>"
    elseif chr == ")"
        return "\<Right>"
    elseif chr == "'"
        return "\<Right>"
    elseif chr == "\""
        return "\<Right>"
    elseif chr == "]"
        return "\<Right>"
    else
        return "\<tab>"
    endif
endfunction

" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function AutoHighlightToggle()
    let @/ = ''
    if exists('#auto_highlight')
        au! auto_highlight
        augroup! auto_highlight
        setl updatetime=4000
        echo 'Highlight current word: off'
        return 0
    else
        augroup auto_highlight
            au!
            au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
        augroup end
        setl updatetime=1250
        echo 'Highlight current word: On'
        return 1
    endif
endfunction
