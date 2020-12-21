SHELL=/bin/bash
TEXMFHOME=`kpsewhich -var-value=TEXMFHOME`

install: classes 

classes:
	mkdir -p $(TEXMFHOME)/tex/latex
	cp -r ufpeexam $(TEXMFHOME)/tex/latex/
	cp -r cindoc $(TEXMFHOME)/tex/latex/

