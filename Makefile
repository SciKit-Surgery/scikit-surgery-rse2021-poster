all: docs/tutorial/poster.html docs/koika/poster.html docs/poster.css

docs/poster.css: poster.less
	lessc --strict-units=on $< $@

docs/%/:
	mkdir -p $@

docs/scikit-surgery-poster.html: scikit-surgery-poster.jinja2 poster.jinja2 docs/poster.css
	./render.py $< $@

clean:
	rm docs/poster.css
	rm -fr docs/poster.{html,css}

.SECONDARY:
