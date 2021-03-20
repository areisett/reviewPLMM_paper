#!/bin/bash
cp ../../main.tex main.tex
cp ../../supplement.tex supplement.tex 
cp ../../ims.bst ims.bst
cp ../../references.bib references.bib
cp ../../figures/*.eps figures/
cp ../genetic_epi.tex genetic_epi.tex
sed -i 's#\\graphicspath{{../}{../logs/}}##g' genetic_epi.tex 
sed -i 's#../##g' genetic_epi.tex 
sed -i 's#.pdf}#.eps}#g' main.tex 
sed -i 's#.pdf}#.eps}#g' supplement.tex 