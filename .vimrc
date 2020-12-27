syntax enable
set t_Co=256
colorscheme codedark

filetype on          " Détection du type de fichier 
syntax on            " Coloration syntaxique
set background=dark  " Adapte les couleurs pour un fond noir (idéeal dans PuTTY)
set linebreak        " Coupe les lignes au dernier mot et pas au caractère (requier Wrap lines, actif par défaut)
set visualbell       " Utilisation du clignotement à la place du "beep"
set showmatch        " Surligne le mots recherchés dans le texte
set hlsearch         " Surligne tous les résultats de la recherche
set autoindent       " Auto-indentation des nouvelles lignes
set smartindent      " Active "smart-indent" (améliore l'auto-indentation, notamment en collant du texte déjà indenté)
set smarttab         " Active "smart-tabs" (améliore l'auto-indentation, Gestion des espaces en début de ligne pour l'auto-indentation)
hi Search ctermbg=White "Couleur de fond de la recherche
hi Search ctermfg=Black "Couleur du texte de la recherche

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
imap ^[OR *
imap ^[OQ /
imap ^[Ol +
imap ^[OS -

