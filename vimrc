" .vimrc

let loaded_matchit = 1
let b:match_ignorecase = 1
"set tags=tags
set tags=./tags;/,tags;/
set expandtab

" Autoformatting: Kommentare automatisch formatieren.
" set comments=sr:/*,mb:*,el:*/,://
" Indentation nicht absolut, sondern abh. vom Dateityp setzen
" hilft gegen den nervigen # Effekt
" https://unix.stackexchange.com/questions/106526/stop-vim-from-messing-up-my-indentation-on-comments
" set nosmartindent
" set cindent
" set cinkeys-=0#
" set indentkeys-=0#
"autocmd FileType * set cindent
"autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"filetype plugin indent on

"set autoindent
"set smartindent
"filetype indent on
" für matchit
filetype plugin on

" Suche schon bei eingabe der ersten Buchstaben starten
set incsearch 
" Den bei einer Suche gefundenen Text highlighten
set hlsearch  

" Hilfe
"map  <F1> :pman 

" F5/F6: Verzweige in File, in den der Tag unter dem Cursor definiert ist
map  <F5> 

" F12: springe zurueck
map  <F6> 

"hi Todo	      term=bold cterm=bold ctermfg=Red ctermbg=DarkBlue guifg=Red guibg=DarkBlue 

set csprg=/usr/bin/cscope
set csto=0
set cst
set tagrelative
set nocsverb
" add any database in current directory
if filereadable("cscope.out")
	cs add cscope.out
" else add database pointed to by environment
elseif $CSCOPE_DB != "" 
	cs add $CSCOPE_DB 
endif
set csverb

" tabstop und shiftwidth auf den selben Wert setzen
set ts=4
set sw=4
set expandtab

" fuer taglist.vim
let Tlist_Ctags_Cmd='/usr/bin/ctags'
filetype off

map <C-'> :cs find 3 <C-R>=expand("<cword>")<CR><CR>
map <C-\> :cs find 0 <C-R>=expand("<cword>")<CR><CR>

iabbr _SIG <CR>lune / <Esc>:read !date +\%d.\%m.\%Y\ \%H:\%M<Esc><Up>J<CR>

let g:fullid='neven@luetic.de'
colorscheme delek

syntax on

"
"für Vundle
set nocompatible
filetype off

"set rtp+=~/.vim/bundle/vundle/
"call vundle#rc()

set rtp+=~/.vim/bundle/Vundle.vim
"let g:ycm_server_python_interpreter='/usr/bin/python'
call vundle#begin()
" This is the Vundle package, which can be found on GitHub.
" For GitHub repos, you specify plugins using the
" 'user/repository' format
" enable from cli: vim +PluginInstall +qall
Plugin 'VundleVim/Vundle.vim'
Plugin 'gmarik/vundle'
Plugin 'wavded/vim-stylus'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'viewdoc'
Plugin 'vim-js-pretty-template'
Plugin 'rodjek/vim-puppet'
Plugin 'hashivim/vim-vagrant'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'nxadm/syntastic-perl6'
Plugin 'vim-airline/vim-airline.git'
Plugin 'vim-airline/vim-airline-themes.git'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-fugitive'
Plugin 'plasticboy/vim-markdown'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"airline statusbar
set laststatus=2
set ttimeoutlen=50
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='luna'
let g:airline_powerline_fonts = 1

"syntastic syntax checking
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" wg. Steuerzeichen durch airline/term
" s. https://github.com/vim-airline/vim-airline/issues/393
"set t_RV=

"Strip trailing whitespace for certain type of files
autocmd BufWritePre *.{erb,md,pl,pl6,pm,pm6,pp,rb,t,xml,yaml,go} :%s/\s\+$//e
set sw=2
set ts=2
set sts=2
autocmd FileType perl6 setlocal sw=4 ts=4
set expandtab 
"autocmd BufNewFile,BufReadPost *.styl set filetype=stylus
"
map <c-f> :call JsBeautify()<cr>
"autocmd FileType javascript noremap <buffer>  <c-f> :call
"JsBeautify()<cr>
" für closetag
au Filetype html,xml,xsl source ~/.vim/bundle/closetag.vim/plugin/closetag.vim 
let g:closetag_filenames = "*.html,*.xhtml,*.phtml"

" I want to see everything on startup - markdown plugin 
let g:vim_markdown_folding_disabled = 1

" um Pfade, die mit / anfangen relativ zu behandeln - Feder PHP
set includeexpr=substitute(v:fname,'^\\/','./','')

" für viewdoc
" au Filetype php,inc source ~/.vim/bundle/viewdoc/plugin/viewdoc_pman.vim
set formatoptions=crotn
