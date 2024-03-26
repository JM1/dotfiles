" 2016-2024 Jakob Meng, <jakobmeng@web.de>
" vim:set fileformat=unix tabstop=8 shiftwidth=4 expandtab autoindent:
" kate: end-of-line unix; space-indent on; indent-width 4;

if filereadable(expand("~/.vim/autoload/plug.vim"))
    " vim-plug: A minimalist Vim plugin manager.
    " Ref.: https://github.com/junegunn/vim-plug
    call plug#begin()
        Plug 'tpope/vim-sensible'
        "Plug 'dracula/vim'
        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'
        "Plug 'raimondi/delimitmate'
        Plug 'scrooloose/nerdtree'
        "Plug 'nathanaelkane/vim-indent-guides'
        "Plug 'itchyny/lightline.vim'
        "Plug 'SirVer/ultisnips', { 'on': [] }
        "Plug 'valloric/youcompleteme', { 'on': [] }
        Plug 'ciaranm/securemodelines'
        Plug 'ervandew/supertab'
        Plug 'tpope/vim-surround'
        "Plug 'dpelle/vim-LanguageTool'
        Plug 'reedes/vim-lexical'

        " colorschemes
        "Plug 'altercation/vim-colors-solarized'
        "Plug 'lifepillar/vim-solarized8'
        "Plug 'fneu/breezy'
        "Plug 'arcticicestudio/nord-vim'
        "Plug 'morhetz/gruvbox'
        "Plug 'tomasr/molokai'
        Plug 'chriskempson/base16-vim'
    call plug#end()

    "autocmd FileType cpp,c Plug 'valloric/youcompleteme'
    "augroup load_us_ycm
    "    autocmd!
    "    autocmd InsertEnter * call plug#load('ultisnips', 'youcompleteme')
    "                       \| autocmd! load_us_ycm
    "augroup END

    "if filereadable(expand("~/.vim/lightline.vimrc"))
    "    source ~/.vim/lightline.vimrc
    "endif

    if filereadable(expand("~/.vim/vim-airline.vimrc"))
        source ~/.vim/vim-airline.vimrc
    endif

    " warn when a modeline attempts to set any other option than on whitelist
    let g:secure_modelines_verbose=1

    " number of lines to check
    let g:secure_modelines_modelines=10

    " Spell-check language configuration
    " Ref.: https://vimawesome.com/plugin/vim-lexical
    let g:lexical#spelllang = ['de_de', 'en_us']
    augroup lexical
        autocmd!
        autocmd FileType markdown,mkd call lexical#init()
        autocmd FileType textile call lexical#init()
        autocmd FileType text call lexical#init({ 'spell': 0 })
    augroup END

    " allowable options for modeline
    " Ref.: https://www.vim.org/scripts/script.php?script_id=1876
    let g:secure_modelines_allowed_items =
        \ [
            \ 'autoindent', 'ai',
            \ 'expandtab', 'et', 'noexpandtab', 'noet',
            \ 'fileencoding', 'fenc',
            \ 'fileformat', 'ff',
            \ 'filetype', 'ft',
            \ 'foldmarker', 'fmr',
            \ 'foldmethod', 'fdm',
            \ 'rightleft', 'rl', 'norl',
            \ 'shiftwidth', 'sw',
            \ 'softtabstop', 'sts',
            \ 'spell', 'nospell',
            \ 'startofline', 'sol', 'nostartofline', 'nosol',
            \ 'syntax', 'syn',
            \ 'tabstop', 'ts',
            \ 'textwidth', 'tw',
            \ 'wrap', 'nowrap',
            \ 'wrapmargin', 'wm'
        \ ]

    " Map CTRL-SPACE in terminal vim.
    " Ref.: https://stackoverflow.com/a/7725796/6490710
    if !has("gui_running")
        "inoremap <C-@> <C-Space>
        "inoremap <C-@> <C-x><C-o>
        imap <C-@> <C-Space>
    endif
    let g:SuperTabMappingForward='<c-space>'
    let g:SuperTabMappingBackward='<s-c-space>'

    " Special characters such as trailing whitespace, tabs, newlines, when
    " displayed using :set list can be set to one of three levels depending on
    " your needs. Default value is normal with high and low options.
    " Ref.: https://github.com/altercation/vim-colors-solarized
    let g:solarized_visibility='high'

    " We do not change base colors in linux terminal/tty currently 
    " hence the base16-* colorschemes for vim would look awful
    if &term != "linux"
        " Ref.: http://stackoverflow.com/questions/5698284/in-my-vimrc-how-can-i-check-for-the-existence-of-a-color-scheme
        "
        ":silent! colorscheme solarized
        " :silent! colorscheme solarized
        " :silent! colorscheme solarized8
        " :silent! colorscheme flattened_dark
        " :silent! colorscheme nord
        " colorscheme nord
        " colorscheme breezy
        " colorscheme gruvbox
        " colorscheme molokai
        " colorscheme base16-materia
        " colorscheme base16-material
        colorscheme base16-onedark
        " colorscheme base16-material-palenight
    endif
endif

if has("syntax")
  syntax on
endif

" enable line numbers
set number

set wrap
"set background=dark
set list

" enable true colors in the terminal
" Ref.: https://stackoverflow.com/questions/62702766/termguicolors-in-vim-makes-everything-black-and-white/62703167#62703167
if &term != "linux"
    set termguicolors
endif

" Workaround to fix spelling issues in solarized theme
" Ref.:
"  https://github.com/vim/vim/issues/2424
"  https://github.com/altercation/vim-colors-solarized/issues/195
if &term != "linux"
    set t_Cs=
endif

" For default (non-solarized) terminals highlight special chars (e.g. line
" ends, trailing white spaces) with red color.
if !filereadable(expand("~/.vim/autoload/plug.vim"))
    exe ":hi SpecialKey ctermfg=DarkRed guifg=DarkRed"
    exe ":hi NonText    ctermfg=DarkRed guifg=DarkRed"
    if &listchars ==# 'eol:$'
        set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
    endif
endif

" ATTENTION: See security implications of modeline at
" http://vim.wikia.com/wiki/Modeline_magic
"set modeline

" Stop automatic wrapping
" 'set tw=0' is overwritten if filetype plugin is used.

" Work-around incomplete terminfo databases
" Particulalry useful when under `screen`, which may or may not be attached to
" a physical terminal capable of 256color mode.
" Ref.: http://www.robmeerman.co.uk/unix/256colours
"if match($TERMCAP, 'Co#256:') == 0 || match($TERMCAP, ':Co#256:') > 0
"    set t_Co=256
"endif

" How to get shift+arrows and ctrl+arrows working in Vim in screen/tmux (with TERM=screen...)
" Ref.: https://superuser.com/questions/401926/how-to-get-shiftarrows-and-ctrlarrows-working-in-vim-in-tmux/402084#402084
if &term =~ '^screen'
    " screen/tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

" Handle tmux $TERM quirks in vim
" Reference: http://stackoverflow.com/questions/8604150/with-term-screen-256color-under-tmux-home-and-end-keys-dont-work-why
if $TERM =~ '^screen-256color'
    map <Esc>OH <Home>
    map! <Esc>OH <Home>
    map <Esc>OF <End>
    map! <Esc>OF <End>
endif

" Do not automatically yank (copy) selection in visual mode to system clipboard
" Reference: http://stackoverflow.com/a/11020240
set clipboard-=autoselect

" When selection is copied to vi buffer in visual mode then also copy it to system clipboard automatically
" Reference: http://stackoverflow.com/a/11489440
set clipboard^=unnamed

" Press Ctrl+c after selection in visual mode to yank (copy) to system clipboard
" Reference: http://stackoverflow.com/a/11489440
" vnoremap <C-c> "*y

" Press Ctrl+v in insert mode to paste from system clipboard
" Reference: http://stackoverflow.com/a/16582932
imap <C-v> <ESC>"+pa

" Indenting source code
" Ref.: http://vim.wikia.com/wiki/Indenting_source_code
filetype plugin indent on

" Omni completion
" Ref.: http://vim.wikia.com/wiki/Omni_completion
"filetype plugin on
"set omnifunc=syntaxcomplete#Complete

" Specify ruler
" Ref.: https://vi.stackexchange.com/a/357
set colorcolumn=72,80,120
