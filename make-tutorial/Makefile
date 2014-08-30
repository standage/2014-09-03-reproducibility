manuscript.pdf:		manuscript.md distances.png observations.png
			pandoc -f markdown -t latex -o manuscript.pdf manuscript.md

manuscript.md:		manuscript-template.md table.md
			./embed-table.py table.md manuscript-template.md > manuscript.md

table.md:		control.dist treatment.dist
			./table.py control.dist treatment.dist > table.md

distances.png:		control.dist treatment.dist
			./dist.R control.dist treatment.dist distances.png

observations.png:	control.dat treatment.dat
			./pos.R control.dat treatment.dat observations.png

%.dist:			%.dat
			./dist.py < $^ > $@

clean:			
			rm -f manuscript.pdf manuscript.md table.md distances.png observations.png control.dist treatment.dist
