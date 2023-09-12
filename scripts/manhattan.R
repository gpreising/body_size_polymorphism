library(devtools)
library(tidyverse)
source("scripts/ggmanhattan_v0.R")

dat <- read.csv("data/readlist_PEindivs.allindiv.allchroms.vcf.summary.dedupheaders.filt",sep="\t", header=FALSE)

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
  mutate(group = str_replace(group, "_", " ")) %>%
  filter(depth >= 0.1 & (AF_group1 >= 0.05 | AF_group2 >= 0.05))

ggmanhattanPlot(dat_edited, species="X. multilineatus", colors=c("grey","#FCC000"))

# just Y
dat_edited_Y <- dat_edited %>%
  filter(group == "21 Y")

ggmanhattanPlot(dat_edited_Y, species="X. multilineatus", colors = c("#FCC000","grey"))

# applied mappability filter
dat_mapfilt <- read.csv("data/readlist_PEindivs.allindiv.allchroms.vcf.summary.dedupheaders.filt.mapfilt.bed",sep="\t", header=FALSE)

dat_mapfilt <- dat_mapfilt %>%
  select(-c(V3)) %>%
  rename(group = V1,
         pos = V2,
         ref_allele = V4,
         alt_allele = V5,
         depth = V6,
         AF_group1 = V7,
         AF_group2 = V8,
         LR1 = V9,
         LR2 = V10,
         pchi = V11)

dat_mapfilt <- ggmanhattanFormat(dat_mapfilt)
dat_mapfilt_edited <- dat_mapfilt %>%
  mutate(group = str_extract(group, "(?<=_).*")) %>%
  mutate(group = str_replace(group, "_", " ")) %>%
  filter(depth >= 0.1 & (AF_group1 >= 0.05 | AF_group2 >= 0.05))



