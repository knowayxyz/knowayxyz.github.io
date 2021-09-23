PAGES_SRC = sources
PAGES_DIR = pages
HOME_MD = home.md
HOME_HTML = index.html

PAGES_MD = $(wildcard $(PAGES_SRC)/*.md)
PAGES_HTML = $(wildcard $(PAGES_DIR)/*.html)

GEN_HOMEPAGE = ./pagegen.sh genpage $(HOME_MD) $(HOME_HTML)
GEN_PAGES = ./pagegen.sh pages $(PAGES_SRC) $(PAGES_DIR)
COPY_RESUME = cp ../resume/*.pdf static/
all: $(PAGES_MD) $(HOME_MD)
	$(GEN_PAGES)
	$(GEN_HOMEPAGE)
	$(COPY_RESUME)

server: all
	python3 -m http.server

deploy: all
	git add . && git commit -m "update site:`date`" && git push origin main

clean:
	rm $(HOME_HTML)
	rm $(PAGES_HTML)
	