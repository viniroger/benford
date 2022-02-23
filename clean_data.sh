cat receita.csv | awk -F';' '{print $7}' | sed 's/R\$\ //g' | sed 's/\.//g' | sed 's/,/./g' > receita_candidato.csv
sed -i "1s/.*/Valor/" receita_candidato.csv
