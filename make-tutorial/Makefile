manuscript.pdf:		manuscript.md distances.png observations.png
			pandoc -f markdown -t latex -o manuscript.pdf -V geometry:margin=1in manuscript.md

manuscript.md:		manuscript-template.md table.md embed-table.py
			./embed-table.py table.md manuscript-template.md > manuscript.md

table.md:		control.dist treatment.dist table.py
			./table.py control.dist treatment.dist > table.md

distances.png:		control.dist treatment.dist dist.R
			./dist.R control.dist treatment.dist distances.png

observations.png:	control.dat treatment.dat pos.R
			./pos.R control.dat treatment.dat observations.png

control.dist:		control.dat dist.py
			./dist.py < control.dat > control.dist

treatment.dist:		treatment.dat dist.py
			./dist.py < treatment.dat > treatment.dist

clean:			
			rm -f manuscript.pdf manuscript.md table.md distances.png observations.png control.dist treatment.dist
