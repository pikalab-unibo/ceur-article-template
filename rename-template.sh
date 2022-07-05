#!bash

CWD=`pwd`
DIR_NAME=${CWD##*/}

NEW_NAME=${1:-$DIR_NAME}

if [[ -z "$NEW_NAME" ]]; then
    echo "Must provide a new name as argument" 1>&2
    exit 1
fi

for EXT in tex sty bib; do
    mv ceur-article-template.$EXT $NEW_NAME.$EXT 
done

for FILE in `ls $NEW_NAME.{tex,sty,bib} .gitignore .github/workflows/*.yml`; do
    sed -i '.bak' -e "s/ceur-article-template/$NEW_NAME/g" $FILE
done

rm *.bak .github/workflows/*.bak *.sh
