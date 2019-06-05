#!/bin/bash

RESET_STYLE=$(tput sgr0)
RED_COLOR=$(tput setaf 1)
GREEN_COLOR=$(tput setaf 2)
YELLO_COLOR=$(tput setaf 3)
BOLD=$(tput bold)

read -p 'Enter the search directory absolute Path: ' SEARCH_DIR
read -p 'Enter the search word: ' SEARCH_WORD
read -p 'Enter the replace word: ' REPLACE_WORD

for f in `grep -lr "$SEARCH_WORD" $SEARCH_DIR/`
do
  echo "${GREEN_COLOR} '$SEARCH_WORD' find in ${RESET_STYLE} ${YELLO_COLOR} $f ${RESET_STYLE}"
done

COUNT_FILES=`grep -lr "$SEARCH_WORD" $SEARCH_DIR/ | wc -l`
  echo "********************************************"
  echo "${GREEN_COLOR} The '$SEARCH_WORD' find in ${BOLD} $COUNT_FILES files ${RESET_STYLE}"
  echo "********************************************"
  
#if condition
echo "${GREEN_COLOR}Do you want to replace $SEARCH_WORD to $REPLACE_WORD? [Y,n]${RESET_STYLE}"
read input
if [[ $input == "Y" || $input == "y" ]]; then
  for f in `grep -lr "$SEARCH_WORD" $SEARCH_DIR/`
  do
    sed -i "s/$SEARCH_WORD/$REPLACE_WORD/g" $f;
    echo "${GREEN_COLOR} '$SEARCH_WORD' replacing to '$REPLACE_WORD' in $f...${RESET_STYLE}"
  done
else
  echo "${RED_COLOR}EXIT!!!${RESET_STYLE}"
fi