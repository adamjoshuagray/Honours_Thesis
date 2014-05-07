READ = evince
NAME = FDE_Existance_Uniq
COMP = pdflatex
CLASS = unswmaths.cls

$(NAME).pdf: $(NAME).tex $(CLASS)
	$(COMP) $^

read: $(NAME).pdf
	$(READ) $^ &

clean:
	rm -f *.aux *.log *~ *.save $(NAME).pdf *.bak

spell:
	ispell $(NAME).tex

class_update:
	git submodule foreach git pull origin master; \
	cp -r UNSW_Latex/artwork artwork; \
	cp UNSW_Latex/unswmaths.cls unswmaths.cls	
	cp UNSW_Latex/unswshortcuts.sty unswshortcuts.sty
