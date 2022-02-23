#!/usr/bin/Rscript
# Script para aplicar a Lei de Benford em uma série de dados

# Definindo bibliotecas conforme endereço (suprimindo mensagens iniciais)
end_libs="~/Rpacks"
suppressPackageStartupMessages(require(benford.analysis,lib=end_libs))

# Carregamento de dados
i = 'candidato'
filename = paste('receita_',i,'.csv', sep = '')
dados = read.csv(filename, header = TRUE, stringsAsFactors = FALSE)

# Analisar os dados contra a lei de Benford
bfd.cp = benford(dados$Valor)

# Imprimir resultados
print(bfd.cp)
cat('\n\n') # quebra de linha

# Analisar suspeitos
suspeitos = getSuspects(bfd.cp, dados)
print(suspeitos)

# Plotar gráficos
filename = paste('receita_',i,'.png', sep = '')
png(filename)
plot(bfd.cp)
dev.off()
