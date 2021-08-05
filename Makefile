all: index.html assets/poster.css

assets/poster.css: poster.less assets/
	lessc --strict-units=on $< $@

%/:
	mkdir -p $@

index.html: scikit-surgery-poster.jinja2 poster.jinja2 assets/poster.css
	./render.py $< $@

clean:
	rm index.html
	rm -fr assets/poster.{html,css}

.SECONDARY:
