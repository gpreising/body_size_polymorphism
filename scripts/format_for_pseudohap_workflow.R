library(tidyverse)

focal_snps <- read.csv("data/readlist_PEindivs.allindiv.allchroms.vcf.summary.dedupheaders.filt",
                       sep="\t",
                       header = FALSE)

# still need to filter for allele frequency and read depth
focal_snps <- focal_snps %>%
  # select SNPs with depth > 0.1, AF_group1 and AF_group2 >=0.05
  filter(V5 >= 0.1 & (V6 >= 0.05 | V7 >= 0.05)) %>%
  mutate(V11 = paste(V3,V4,sep=",")) %>%
  dplyr::select(V1,V2,V11)

write.table(focal_snps,file="data/readlist_PEindivs.allindiv.allchroms.vcf.summary.dedupheaders.filt.reformatted", row.names=F, col.names=F, sep = "\t", quote = FALSE)
