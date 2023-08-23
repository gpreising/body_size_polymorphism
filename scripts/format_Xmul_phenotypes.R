library(tidyverse)
library(readxl)

# read in phenotype data from old and new Xmul samples
xmul_XI_22_phen <- read.csv("data/xmul_phenotyping_XI-22.csv")
f2_and_wc_morris_phen <- read.table("data/sneaker_courter_status_ID.txt", sep=" ")

# read in read data list for order
readlist <- read.table("data/readlist_PE", sep="\t")

# format nov22 phenotype data
xmul_XI_22_phen <- xmul_XI_22_phen %>%
  mutate(day = as.character(str_extract(ID,"(?<=TABQ-).*?(?=-)")),
         num = as.character(str_extract(ID,"(?<=-).{2,3}(?=-M)")),
         ID = paste(day, num, sep="")) %>%
  select(ID,tactic)

# format the genome list
readlist <- readlist %>%
  mutate(ID = case_when(str_detect(V1, "TABQ") == T ~ paste(str_extract(V1,"(?<=TABQ-).{2}?(?=-)"), str_extract(V1, "(?<=_).{2,3}(?=_M)"), sep = ""),
                        str_detect(V1, "TABQ") == F ~ str_extract(V1,"(?<=-).{4}?(?=\\.R)"))) %>%
  select(ID)

#rename the f2 variables
f2_and_wc_morris_phen <- f2_and_wc_morris_phen %>%
  rename(ID = V1,
         tactic = V2)

## now we can rbind the phenotype data
all_phen <- rbind(xmul_XI_22_phen, f2_and_wc_morris_phen)

# see how many courters/sneakers there are in the phenotype dataset
all_phen %>%
  group_by(tactic) %>%
  summarise(n())

# only consider fish with genome data and phenotype data available
all_case_control <- inner_join(readlist, all_phen, by="ID")

# see how many that drops the numbers by
all_case_control %>%
  group_by(tactic) %>%
  summarise(n())

# n=168 courters, n=118 sneakers
write.table(all_case_control$tactic, file="all_case_control_20230823.txt", row.names=F, col.names=F, sep = "\t", quote = FALSE)

