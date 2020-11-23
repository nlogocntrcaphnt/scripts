#!/bin/bash

#thread has to be from threadreaderapp.com
POST_ID="$(echo $1 | sed 's:.*/::')"

POSTER="$(echo $1 | sed 's/^.*\(com.*status\).*$/\1/' | sed 's/.\{7\}$//' | cut -c 5-)"
FILENAME="$(curl $1 | grep "<title>" |  sed 's/^.*on Twitter/on Twitter/' | sed 's/.\{14\}$//' | cut -c 19-)"

FILENAMEArr=($FILENAME)
FILENAMEFINAL="$(echo "${FILENAMEArr[@]:0:9}")"

FILENAMEFINAL=${FILENAMEFINAL////_}

DIR=/home/kostis/Documents/Twatter_archive/$POSTER

if ! [ -d "$DIR" ]; then
  	mkdir "$DIR"
fi

COUNT="$(ls -1 $DIR | wc -l)"
INFILE="${DIR}/${FILENAMEFINAL}.pdf"


echo "For debugging purposes, INFILE=$INFILE and OUTFILE = $OUTFILE"

if [ -z "$(curl https://threader.app/thread/$POST_ID | grep "404 not found")" ]
then
	THREAD="https://threader.app/thread/$POST_ID"

	wkhtmltopdf $THREAD "$INFILE"
#	i3 exec zathura "$INFILE"
else
	THREAD="https://threadreaderapp.com/thread/${POST_ID}.html"

	OUTFILE="${DIR}/${FILENAMEFINAL}_threadreader.pdf"

	wkhtmltopdf --no-images --page-size A4 $THREAD "$INFILE"

	page_count=`pdfinfo "$INFILE" | grep 'Pages:' | awk '{print $2}'`
	page_count=$(( $page_count - 1 ))
	pdftk A="$INFILE" cat A1-$page_count output "$OUTFILE"
		
	rm "$INFILE"
#	i3 exec zathura "$OUTFILE"
fi 

cd /home/kostis/Documents/Twatter_archive/
#git init 
git add .
git commit -m "Update"
git remote add origin https://github.com/nlogocntrcaphnt/twatter_archive.git
#git remote -v
git push -u origin master
cd
