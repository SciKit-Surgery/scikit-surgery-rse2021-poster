default: build/index.html 

ASSETS = build/assets/UCL_logo_white.png \
	 build/assets/EPSRC+logo.png \
	 build/assets/logo.png \
	 build/assets/weiss.png \
	 build/assets/Wellcome_Black.png

build/assets: build/
	mkdir -p $@

build/assets/poster.css: poster.less build/assets/
	lessc --strict-units=on $< $@

%/:
	mkdir -p $@

build/index.html: scikit-surgery-poster.jinja2 poster.jinja2 \
		  build/assets/poster.css $(ASSETS)
	./render.py $< $@

build/assets/%.png: logos/%.png build/assets
	cp $< $@

clean:
	rm -r build

.SECONDARY:
