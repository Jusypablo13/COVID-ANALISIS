#Librerias

library(Biostrings)
library(seqinr)
library(Biostrings)
library(seqinr)
library(adegenet)
library(ape)
library(ggtree)
library(DECIPHER)
library(viridis)
library(ggplot2)
library(tidyverse)


virus <- c("OM337016", "OR655408", "OR856918", "OQ901987", "OW679447", "OW049043", "OQ318441", "OM295705", "ON507051", "OQ080084", "OP012915", "OP012539", "OP402781", "ON416565", "OQ085068", "OU598005", "OM065381", "OP053465", "ON545854", "ON532666")
#USA, India, Brasil, Francia, Alemania, Reino Unido, Rusia, Turquía, Italia, España, Argentina, Colombia, Irán, Indonesia, México, Polonia, China, Sudáfrica, Países Bajos, Australia

#Secuencias de GenBank
virus_sequences <- read.GenBank(virus)

#Estructurazión de DNABin
str(virus_sequences)
attributes(virus_sequences)
names(virus_sequences)
attr(virus_sequences, "species")

#Archivo
write.dna(virus_sequences,  file ="sequencias.fasta", format = "fasta", append =
            FALSE, nbcol = 6, colsep = " ", colw = 10)

#Carga de archivos ADN
virus_seq_not_align <- readDNAStringSet("sequencias.fasta", format = "fasta")
virus_seq_not_align

#Alineamiento de secuencias de ADN
virus_seq_not_align <- OrientNucleotides(virus_seq_not_align)
virus_seq_align <- AlignSeqs(virus_seq_not_align)
virus_seq_align

#Visualización de secuencias alineadas ADN
BrowseSeqs(virus_seq_align, highlight=0)

#Guardar el resultado
writeXStringSet(virus_seq_align, file="secuencias_alineadas.fasta")

#Leer el archivo de alineamiento
virus_aligned <- readDNAStringSet("secuencias_alineadas.fasta")

#Longitud de las secuencias
longitud <- data.frame(width(virus_seq_not_align))
longitud

#Definir la cadena de caracteres del árbol en formato Newick
covid_arbol <- "((((((((((((ON416565-Indonesia, OW679447-Alemania), OW049043-Reino Unido), OP402781-Iran, OR655408-India)), ON532666-Australia), ON545854-Holanda), ON507051-Italia, OR856918-Brasil, OM065381-China), OQ901987-Francia, OQ085068-México, OQ318441-Rusia), OM295705-Turquía, OQ080084-España, OP012915-Argentina), OM337016-Estados Unidos), OP012539-Colombia, OP053465-Sudáfrica), OU598005-Polonia );"
#Leer el árbol desde la cadena de caracteres
covid_arbol <- read.tree(text = covid_arbol)
# Visualizar el árbol
plot(covid_arbol, no.margin = TRUE, edge.width = 2)

#Función para calcular la frecuencia de Nucleotidos
calculate_frequencies <- function(dna_seq) {
  dna_string <- as.character(dna_seq)
  frequencies <- table(strsplit(dna_string, "")[[1]])
  frequencies <- frequencies[c("A", "T", "G", "C")]
  frequencies[is.na(frequencies)] <- 0
  return(frequencies)
}

#Calcular la frecuencia para cada secuencia
virus_frequencies <- sapply(virus_seq_align, calculate_frequencies)
#Convertir a data frame
virus_freq_df <- as.data.frame(t(virus_frequencies))
virus_freq_df$virus <- rownames(virus_freq_df)

virus_freq_long <- virus_freq_df %>%
  pivot_longer(cols = c("A", "T", "G", "C"), names_to = "Nucleotide", values_to = "Count")

#Gráfica de barras
ggplot(virus_freq_long, aes(x = virus, y = Count, fill = Nucleotide)) +
  geom_bar(stat = "identity", position = "stack") +
  labs(x = "Variante de Virus", y = "Conteo de Nucleotidos", title = "Conteo de Nucleotidos para cada Variante") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
