##################################
#Changements des raccourcis claviers
##################################
#On change Control +b par Control +x
set -g prefix C-x
unbind C-b
bind C-x send-prefix
 
#On utlise control + flèches pour naviguer entre les terminaux
bind-key -n C-right next
bind-key -n C-left prev
 
#on utilise alt + flèches our naviguer entre les panels
bind-key -n M-left select-pane -L
bind-key -n M-right select-pane -R
bind-key -n M-up select-pane -U
bind-key -n M-down select-pane -D
 
#On change les raccourcis pour faire du split vertical et horizontal
#On utilise la touche "|" (pipe) pour faire un split vertical
bind | split-window -h
#Et la touche "-" pour faire un split horizontal
bind - split-window -v
 
##################################
#Changements pratiques
##################################
#On permet l'utilisation de la souris pour changer de terminal et de panel
set -g mouse-select-pane on
set-option -g mouse-select-window on
set -g mode-mouse on
 
#Les fenêtres commencent par 1 et non par 0
set -g base-index 1
 
##################################
#Changements visuels
##################################
#On met les panneaux non actif en gris
set -g pane-border-fg colour244
set -g pane-border-bg default
 
#On met le panneau actif en rouge
set -g pane-active-border-fg colour124
set -g pane-active-border-bg default
 
#On met la barre de status en gris
set -g status-fg colour235
set -g status-bg colour250
set -g status-attr dim
 
# On surligne les fenêtres actives dans la barre de status en gris foncés
set-window-option -g window-status-current-fg colour15
set-window-option -g window-status-current-bg colour0
