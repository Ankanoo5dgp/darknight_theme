#!/bin/bash
set -ueo pipefail

if [ ! "$(which sassc 2> /dev/null)" ]; then
  echo sassc needs to be installed to generate the css.
  exit 1
fi

_COLOR_VARIANTS=('' '-dark' '-darker')
if [ ! -z "${COLOR_VARIANTS:-}" ]; then
  IFS=', ' read -r -a _COLOR_VARIANTS <<< "${COLOR_VARIANTS:-}"
fi


SASSC_OPT="-M -t expanded"

for color in "${_COLOR_VARIANTS[@]}"; do
    sassc $SASSC_OPT src/gtk/3.0/gtk${color}.{scss,css}
    echo ">> generating 3.0 gtk${color}.css."
    sassc $SASSC_OPT src/gtk/4.0/gtk${color}.{scss,css}
    echo ">> generating 4.0 gtk${color}.css."
done

sassc $SASSC_OPT src/gnome-shell/shell-3-36/gnome-shell.{scss,css}
echo ">> generating 3-36 gnome-shell.css."
sassc $SASSC_OPT src/gnome-shell/shell-3-36/gnome-shell-dark.{scss,css}
echo ">> generating 3-36 gnome-shell-dark.css."
sassc $SASSC_OPT src/gnome-shell/shell-40-0/gnome-shell.{scss,css}
echo ">> generating 40-0 gnome-shell.css."
sassc $SASSC_OPT src/gnome-shell/shell-40-0/gnome-shell-dark.{scss,css}
echo ">> generating 40-0 gnome-shell-dark.css."
sassc $SASSC_OPT src/gnome-shell/shell-42-0/gnome-shell.{scss,css}
echo ">> generating 42-0 gnome-shell.css."
sassc $SASSC_OPT src/gnome-shell/shell-42-0/gnome-shell-dark.{scss,css}
echo ">> generating 42-0 gnome-shell-dark.css."
