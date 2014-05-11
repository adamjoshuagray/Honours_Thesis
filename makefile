READ = evince
NAME = FDE_Thesis
COMP = pdflatex
BIB  = bibtex

$(NAME).pdf: $(NAME).tex
	$(COMP) $^; \
	$(COMP) $^; \
	$(COMP) $(NAME).aux; \
	$(COMP) $(NAME).tex

read: $(NAME).pdf
	$(READ) $^ &

clean:
	rm -f *.aux *.log *~ *.save $(NAME).pdf *.bak

spell:
	ispell $(NAME).tex

class_update:
	git submodule foreach git pull origin master; \
	cp -r UNSW_Latex/artwork artwork; \
	cp UNSW_Latex/unswmaths.cls unswmaths.cls; \	
	cp UNSW_Latex/unswshortcuts.sty unswshortcuts.sty
