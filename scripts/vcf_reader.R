library(vcfR)

setwd("~/git_local/locator/data/")

dir()
vcf <- read.vcfR("curryco_eu1-vs-eu1_filt_mac2_maf05.vcf.gz", verbose = T)
str(vcf)
tabla <- extract.gt(vcf)

cnames <-tabla|>
  colnames()

md <- read.table("../data/EU1_sample_data.txt", header = T)
md$sampleID %in% cnames
sort(md$sampleID) == sort(cnames)
