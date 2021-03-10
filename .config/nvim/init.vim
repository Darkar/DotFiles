call plug#begin()
Plug 'preservim/nerdcommenter'
Plug 'junegunn/fzf'
Plug 'preservim/nerdtree'
Plug 'chrisbra/colorizer'
Plug 'vim-scripts/delimitMate.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nanotech/jellybeans.vim'
call plug#end()

set t_Co=256
colorscheme jellybeans
set clipboard+=unnamedplus
filetype on          " Détection du type de fichier 
syntax on            " Coloration syntaxique
set background=dark  " Adapte les couleurs pour un fond noir (idéeal dans PuTTY)
set nowrap	     " Coupe les lignes à la fin de la fenêtre
set linebreak        " Coupe les lignes au dernier mot et pas au caractère (requier Wrap lines, actif par défaut)
set visualbell       " Utilisation du clignotement à la place du "beep"
set showmatch        " Surligne le mots recherchés dans le texte
set hlsearch         " Surligne tous les résultats de la recherche
set autoindent       " Auto-indentation des nouvelles lignes
set smartindent      " Active "smart-indent" (améliore l'auto-indentation, notamment en collant du texte déjà indenté)
set smarttab         " Active "smart-tabs" (améliore l'auto-indentation, Gestion des espaces en début de ligne pour l'auto-indentation)
set shiftwidth=4     " Tab à 4 espace
set number	     " Voir le numéros des lignes   
set signcolumn=no    

hi Search ctermbg=White "Couleur de fond de la recherche
hi Search ctermfg=Black "Couleur du texte de la recherche

"let g:jellybeans_overrides = {
\    'background': { 'guibg': '000000' },
\}

" support pavé numérique dans PuTTY
imap ^[Oq 1
imap ^[Or 2
imap ^[Os 3
imap ^[Ot 4
imap ^[Ou 5
imap ^[Ov 6
imap ^[Ow 7
imap ^[Ox 8
imap ^[Oy 9
imap ^[Op 0
imap ^[On .
"imap ^[OR *
imap ^[OQ /
imap ^[Ol +
imap ^[OS -

" Activation de la souris
set mouse=a

" Airline
let g:airline_theme='jellybeans'
let g:airline#extensions#tabline#enabled = 1

" NERDCommenter
let g:NERDDefaultAlign = 'start'

" COC
let g:python3_host_prog = '/usr/bin/python'
let g:python_host_prog = '/usr/bin/python2'

" Transparence
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
autocmd vimenter * hi EndOfBuffer guibg=NONE ctermbg=NONE

" Mapping 
map <F2> :NERDTreeToggle<CR>
map <F3> <Plug>NERDCommenterToggle('n', 'Toggle')<Cr>
map <F5> :!./%<CR>
map <F9> :FZF --preview cat\ {}<CR>
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv


