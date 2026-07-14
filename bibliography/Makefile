
BIBFILE= laurence.bib

YEARS= 2026 2025 2024 2023 2022 2021 2020 2019 2018 2017 2016 2015 2014 2013 2012 2011 2010 2009 2008 2007 2005 2004 2002 2001	
PUBLICATIONS=	$(addsuffix .publication.html,$(YEARS))
CITES= $(addsuffix .cite,$(YEARS))
BIBS= $(addsuffix .publication_bib.html,$(YEARS))
ABSTRACTS= $(addsuffix .publication_abstracts.html,$(YEARS))


research.html: publications.html
	cat header.html publications.html footer.html > research.html

publications.html:	$(PUBLICATIONS)
	sh ./mergecites.sh $(PUBLICATIONS) > $@

%.cite:	$(BIBFILE)
	bib2bib -oc $@ -c 'Keywords:"laurence"' -c 'year=$*' $(BIBFILE) > /dev/null

%.publication.html:	$(BIBFILE) %.cite
	bibtex2html --output $*.publication --both --no-keywords --sort-by-date --reverse-sort -citefile $*.cite --no-doc --no-header $(BIBFILE)
	sh ./bibtex2htmlChop.sh $*.publication.html

install: research.html
	mv research.html ../content/research/index.html
	#mv *_bib.html ../content/research/
	#mv *_abstracts.html ../content/research/

clean:	
	rm -f $(TEMP_PAGES) $(CITES) $(PUBLICATIONS) $(BIBS) $(ABSTRACTS) publications.html research.html

$(PAGES):	$(NON_PAGES)

FORCE:

