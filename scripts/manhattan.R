library(devtools)
library(tidyverse)
source("/Users/gabep/Desktop/schumerlab/body_size_evolution/Xmul_GWAS/ggmanhattan_v0.R")

dat <- read.csv("/Users/gabep/Desktop/schumerlab/body_size_polymorphism/data/readlist_PEindivs.allindiv.allchroms.vcf.summary.dedupheaders.filt",sep="\t", header=FALSE)

dat <- dat %>%
  rename(group = V1,
         pos = V2,
         ref_allele = V3,
         alt_allele = V4,
         depth = V5,
         AF_group1 = V6,
         AF_group2 = V7,
         LR1 = V8,
         LR2 = V9,
         pchi = V10)

dat <- ggmanhattanFormat(dat)

dat_edited <- dat %>%
  mutate(group = str_extract(group, "(?<=_).*")) %>%
  mutate(group = str_replace(group, "_", " "))

ggmanhattanPlot(dat_edited, species="X. multilineatus", colors=c("grey","#FCC000"))