#!/bin/bash

ml biology htslib

bgzip -c data/readlist_PEindivs.allindiv.allchroms.vcf.summary.dedupheaders.mapfilt.mafAFfilt.reformatted > data/readlist_PEindivs.allindiv.allchroms.vcf.summary.dedupheaders.mapfilt.mafAFfilt.reformatted.gz && tabix -s1 -b2 -e2 data/readlist_PEindivs.allindiv.allchroms.vcf.summary.dedupheaders.mapfilt.mafAFfilt.reformatted.gz
