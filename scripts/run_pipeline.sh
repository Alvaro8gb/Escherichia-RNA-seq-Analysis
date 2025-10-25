#!/bin/bash



# 🎨 Define color codes
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
BLUE="\033[0;34m"
MAGENTA="\033[0;35m"
CYAN="\033[0;36m"
BOLD="\033[1m"
RESET="\033[0m"



if [ "$#" -ne 1 ]
then
  echo -e "${RED}❌ Error:${RESET} faltan argumentos."
  echo -e "Uso: ${YELLOW}bash $0 /ruta/al/proyecto ${RESET}"
  echo -e "Ejemplo: ${CYAN}bash $0 /home/user/proyecto ${RESET}"
  exit 1
fi

BASE_PATH=$1

echo -e "${CYAN}📂 Base path:${RESET} $BASE_PATH"
echo 

for sample in $(ls $BASE_PATH/data/*.fastq.gz | cut -d "_" -f1 | sed 's:data/::' | sort | uniq)
do
  echo "${GREEN}Start $sample ${RESET}"
  bash "$BASE_PATH/scripts/analyse_sample.sh" "$sample"
  echo "${BLUE}End $sample ${RESET}"
  echo
done

mkdir -p "$BASE_PATH/out/multiqc"
multiqc -o "$BASE_PATH/out/multiqc" "$BASE_PATH"
