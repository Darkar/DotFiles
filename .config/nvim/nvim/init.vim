call plug#begin()
 Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
 Plug 'nvim-lualine/lualine.nvim'
 Plug 'kyazdani42/nvim-web-devicons'
call plug#end()

" Lua
lua << END
vim.cmd[[colorscheme tokyonight]]
vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }

vim.cmd[[colorscheme tokyonight]]

require('lualine').setup {
  options = {
      theme = 'tokyonight'
  }
}
END

" Theme config
colorscheme tokyonight

" Bonus
set clipboard+=unnamedplus
filetype on          	" Détection du type de fichier 
syntax on            	" Coloration syntaxique
set background=dark  	" Adapte les couleurs pour un fond noir (idéeal dans PuTTY)
set nowrap	     	" Coupe les lignes à la fin de la fenêtre
set linebreak        	" Coupe les lignes au dernier mot et pas au caractère (requier Wrap lines, actif par défaut)
set visualbell       	" Utilisation du clignotement à la place du "beep"
set showmatch        	" Surligne le mots recherchés dans le texte
set hlsearch         	" Surligne tous les résultats de la recherche
set autoindent       	" Auto-indentation des nouvelles lignes
set mouse=a		" Souris
set autoindent       	" Auto-indentation des nouvelles lignes
set smartindent      	" Active "smart-indent" (améliore l'auto-indentation, notamment en collant du texte déjà indenté)
set smarttab         	" Active "smart-tabs" (améliore l'auto-indentation, Gestion des espaces en début de ligne pour l'auto-indentation)
set shiftwidth=4     	" Tab à 4 espace
set number	     	" Voir le numéros des lignes

" Tab
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
