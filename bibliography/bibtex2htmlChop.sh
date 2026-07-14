#!/bin/sh
# Strip the html2bibtex reference from the bottom of the pubs list.

FILE="$1"
FILECHOP="$FILE.chop"

LINES=`wc -l < $FILE`
LINES=`expr $LINES - 2`
head -$LINES $FILE > $FILECHOP
echo "</table>" >> $FILECHOP
rm -fr $FILE
mv $FILECHOP $FILE
