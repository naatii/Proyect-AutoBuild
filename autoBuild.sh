#!/bin/bash

echo -n "Indica el path absoluto local: "
read ruta

pregunta() {
  echo "1.- GitHub"
  echo "2.- Windows"
  echo "3.- ayuda"
  echo "4.- salir"
}

while true; do
  pregunta
  echo -n "¿Que quieres hacer? "
  read pregunta

  case $pregunta in
    1)
      echo -n "Indique el path del repo para clonarlo: "
      read repo
      cd "$ruta" || exit
      git clone "$repo"
      cd "$repo" || exit
      echo "$repo"
      echo
      ;;
    2)
      echo "Se va a crear la estructura del proyecto para Windows"
      echo -n "Indica el path absoluto local: "
      read ruta
      cd "$ruta" || exit
      mkdir src
      mkdir test
      python3 -m venv venv
      source venv/bin/activate
      pip install pytest
      echo "source venv/bin/activate" | xclip -selection clipboard
      ;;
    3)
      echo "Esta es la ayuda del programa AutoGit por Natalia Cortés:"
      echo "    -1 GitHub (baja el repositorio de GitHub)"
      echo "    -2 Build (Construye el proyecto)"
      echo "    -3 ayuda (Muestra este menú)"
      echo "    -4 salir (Sale del programa)"
      ;;
    4)
      echo "Pulsa una tecla para salir."
      read -n 1 -s
      exit
      ;;
    *)
      echo "Opción no válida, por favor selecciona una opción válida."
      ;;
  esac
done
