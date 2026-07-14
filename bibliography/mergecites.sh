#!/bin/sh

CITES=$@

#echo "Merging $CITES..."

for CITE in $CITES; do
	YEAR=`basename $CITE .publication.html`
	echo "<h3>Publications for $YEAR</h3>"
	cat $CITE
done


