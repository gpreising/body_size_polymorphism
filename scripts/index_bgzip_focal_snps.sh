#!/bin/bash

ml biology htslib

bgzip -c data/readlist_PEindivs.allindiv.allchroms.vcf.summary.dedupheaders.filt.reformatted > data/readlist_PEindivs.allindiv.allchroms.vcf.summary.dedupheaders.filt.reformatted.gz && tabix -s1 -b2 -e2 data/readlist_PEindivs.allindiv.allchroms.vcf.summary.dedupheaders.filt.reformatted.gz
