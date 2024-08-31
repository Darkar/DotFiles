#!/bin/bash

# Vérification de la présence de rsync
if ! command -v rsync &> /dev/null; then
    echo "Rsync est requis !"
    exit 1
fi

OPTION="-v -r --delete-after"

dotfiles=(
    "$HOME/.config/hypr/"
    "$HOME/.config/waybar/"
    "$HOME/.config/mako/"
    "$HOME/.config/rofi/"
    "$HOME/.config/kitty/"
    "$HOME/.config/nvim/"
    "/boot/grub/themes/arch/"
    "$HOME/.zshrc"
)

# Déterminer le dossier du script
script_dir="$(dirname "$(realpath "$0")")"

echo "Synchronisation de:"
for path in "${dotfiles[@]}" ; do
    # Supprimer la valeur de $HOME dans le chemin cible
    if [[ "$path" == "$HOME"* ]]; then
        relative_path="${path/#$HOME/}"
        target_path="$script_dir/$relative_path"
    else
        # Si le chemin ne contient pas $HOME, on le synchronise tel quel
        target_path="$script_dir/$path"
    fi

    # Créer les répertoires si nécessaire dans le dossier cible
    mkdir -p "$(dirname "$target_path")"
    
    # Synchroniser les fichiers/dossiers
    rsync $OPTION "$path" "$target_path"
    
    # Vérifier si la commande s'est bien passée
    if [ "$?" -ne 0 ]; then
        echo "- $path NOK"
    else
        echo "- $path OK"
    fi
done