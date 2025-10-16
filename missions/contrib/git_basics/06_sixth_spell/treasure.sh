#!/usr/bin/env bash
# beer_bubbles_up.sh — Chope ASCII avec bulles montantes, mousse à gauche et grande anse
# Quitter avec Ctrl+C

DELAY=0.2
trap 'tput cnorm; exit' INT
tput civis

frame=0

# Largeur intérieure (zone bière)
INNER_WIDTH=19
INNER_START=2
INNER_END=13

# Colonnes où les bulles apparaissent
bubble_cols=(3 6 9 12 15 18)

# Tableau pour la mousse qui coule à gauche
declare -a left_mousse
for ((i=INNER_START;i<=INNER_END;i++)); do
  left_mousse[$i]=" "
done

while true; do
  clear

  # --- Mousse animée sur le dessus ---
  foam_patterns=(
"          ~~~~~~~~"
"         ~~~oOoo~~~"
"          ~~OoOo~~"
"         ~ooOoOoo~"
  )
  echo "${foam_patterns[$((frame % 4))]}"

  # --- Haut de la chope ---
  top="         .-----------------.   _______"
  bottom1="         \\#################/"
  bottom2="          '---------------'"
  feet="               |||||"

  echo "$top"

  for ((i=INNER_START; i<=INNER_END; i++)); do
    # Mousse qui coule sur le côté gauche (descend)
    if (( frame % 2 == 0 )); then
      for ((line_idx=INNER_END; line_idx>INNER_START; line_idx--)); do
        left_mousse[$line_idx]="${left_mousse[$((line_idx-1))]}"
      done
      left_mousse[$INNER_START]="|"
    fi

    # Construire la zone intérieure
    middle=""
    for ((j=0; j<INNER_WIDTH; j++)); do
      middle+="#"
    done

    # Convertir en tableau
    middle_chars=()
    for ((j=0;j<${#middle};j++)); do
      middle_chars+=("${middle:j:1}")
    done

    # Bulles qui montent 🫧
    height=$((INNER_END - INNER_START + 1))
    for col in "${bubble_cols[@]}"; do
      pos=$((col-1))
      # La bulle monte : en haut quand frame augmente
      bubble_line=$(( (INNER_END - INNER_START) - ((frame + col) % height) ))
      if (( bubble_line == i - INNER_START )); then
        middle_chars[$pos]="o"
      fi
    done

    # Ajouter la mousse sur le côté gauche
    middle_chars[0]="${left_mousse[$i]}"

    # Reconstruire la zone bière
    middle_new=$(printf "%s" "${middle_chars[@]}")

    # Ligne complète avec bords fixes
    printf "        |%s||         |\n" "$middle_new"
  done

  # Bas de la chope
  echo "        |###################|\\_________/"
  echo "$bottom1"
  echo "$bottom2"
  ((frame++))
  sleep "$DELAY"
done

