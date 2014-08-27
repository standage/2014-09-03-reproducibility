pres.html:		pres.md reveal.js
			pandoc -t revealjs -s pres.md --self-contained -o pres.html

reveal.js:		reveal.js-2.6.2
			ln -s reveal.js-2.6.2 reveal.js

reveal.js-2.6.2:	
			curl -LO https://github.com/hakimel/reveal.js/archive/2.6.2.tar.gz
			tar xzf 2.6.2.tar.gz

clean:			
			rm -rf pres.html 2.6.2.tar.gz reveal.js-2.6.2 reveal.js
