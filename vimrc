" Set some defaults
filetype off
set nocompatible      "make VIM non compatible with Vi
set directory=/tmp/   "directory to place swp files in
set number            "turn on line numbers
set mouse=a           "use the mouse everywhere
set showmatch         "show matching brackets
set stal=2            "always show tabs on gui


" Get and append all bundles
call pathogen#runtime_append_all_bundles()

" Set fonts and colors
syntax enable             "enable sytax coloring
set t_Co=256              "set terminal vim to use 256 colors
set background=dark       "Set the bkgd to dark
set guifont=Monaco:h13    "sets font to Monaco 13pt
colorscheme ae-color      "use the custom AngelsEye color scheme

" Set text manipulations (indents, word wrap, etc)
filetype plugin indent on   "detect file types
set ai                      "automatically indent the line on carriage return
set nowrap                  "cancels line wrap
set ts=2                    "sets tab stop == 2 spaces
set sw=2                    "sets the shift width using < or > to 2

" Mapping functions
let mapleader = "\\"
map <Leader>n :NERDTreeToggle<CR>
map <leader>F :FufFile<CR>
map <leader>f :FufTaggedFile<CR>
map <leader>s :FufTag<CR>

"remaps tab and shift tab to switch between windows
nnoremap <Tab> <C-w>w
nnoremap <S-Tab> <C-w>W


runtime! macros/matchit.vim

" Set commands based on file types (NOT USING AT THIS TIME)
"augroup myfiletypes
"  autocmd!
"  autocmd FileType ruby,eruby,yaml,cucumber set ai sw=2 et
"augroup END

" Other settings
let g:ackprg="ack -H --column"
au FileType html,xhtml,xml so ~/Utilities/dotmatrix/vim/bundle/vim-autoclose/ftplugin/html_autoclosetag.vim
au BufRead,BufNewFile *.haml	setfiletype haml
