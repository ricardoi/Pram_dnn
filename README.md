# Pram_dnn
Implementation of deep neural networks - to _P. ramorum_ epidemic populations across in Southern Oregon 

### Instalation
```conda
# To activate this environment, use
#     $ conda activate locator
# To deactivate an active environment, use
#     $ conda deactivate
```
Installing other dependencies - like `numpy`, `tensorflow`, `h5py`, `scikit-allel`, `matplotlib`, `scipy`, `tqdm`, `pandas`,
`zarr`, and `seaborn` using `pip3`

## Data Generation and input format
VCF generation - Carleson, N.:
1. GenotypeGVCF curry county: within NA1 against NA1 and within EU1 against EU1
2. Remove all variant types that are not biallelic SNPs
3. Remove all variants with a mapping quality below 20 and convert any genotype to NA if its depth was less than x/3 or more than 3x where x was the average depth of a sample's reads that mapped with quality > 20.
4. Convert genotypes to NA if their depth in the VCF was below 4, and remove SNPs with a Quality score < 20 or have really high missing data (>75%)
5. Remove samples with more than 50% missing genotypes averaged across all loci (only ended up removing just one NA1 sample)
6. Remove variants with more than 25% missing genotypes averaged across all samples, and all variants whose minor allele was only observed once or twice.
7. Optionally - taken farther, removed variants with MAF < 0.05
> email notes: A huge increase in SNPs, keeping fixed heterozygous SNPs. 

### Formatting 
I need the .vcf files and a tab-delimited table with first column 'sampleID' and each entry giving the count of minor (or derived) alleles for an individual at a site. Missing locations must be indicated with `NA` or `NaN`. 

Sample metadata should be a tab-delimited file with the first row:
|sampleID | x | y |
| --      |-- |-- |
| Name    | 0°|45°|


# CQLS data location
`/dfs/Grunwald_Lab/lab_collabs/ramorum_curryco_pops/genotyping_data`
VCF data summary:
|Filtering| type | lineage | SNP count| file name |
| -- | -- | -- | -- |-- |
| Unifltered | polymorphic | NA1 | 330,411 | curryco_na1-vs-na1_filt_mac2.vcf.gz |
| MAF < 0.05 | polymorphic | NA1 | 289,205 | curryco_na1-vs-na1_filt_mac2_maf05.vcf.gz |
| Unfiltered | polymorphic | EU1 | 357,280 | curryco_eu1-vs-eu1_filt_mac2.vcf.gz |
| MAF < 0.05 | polymorphic | EU1 | 312,472 | curryco_eu1-vs-eu1_filt_mac2_maf05.vcf.gz |
|Unfiltered | polymorphic | combined |339,334 | poly.genotyped_CurryCo_EU2_NA2reps_n322.PHRA102_genes_merged.vcf.gz |
|Heavily filtered | polymorphic |combined | 68,787 |  eu1_na1_noms_poly_nofixhet_nofixhomo_maf5.vcf.gz |
Heavily filtered | polymorphic | NA1 | 55,545 | na1_noms_poly_nofixhet_nofixhomo_maf5.vcf.gz |
Heavily filtered | polymorphic | EU1 | 21,352 | eu1_noms_poly_nofixhet_nofixhomo_maf5.vcf.gz |


# Analysis
Running deep neural networks using VCF data of _P. ramorum_ sampled in Southwestern, Oregon.
**Genral Analysis**
```bash
python scripts/locator.py --vcf data/curryco_eu1-vs-eu1_filt_mac2_maf05.vcf.gz --sample_data data/EU1_sample_data.csv --out out/EU1/EU1
```
**Window Analysis**
```bash
python scripts/locator.py --zarr data/EU1_genotypes.zarr --sample_data data/EU1_sample_data.csv --out out/EU1/ --windows --window_size 10000
```

> Note: When trying with the small VCF (only calling genetic SNPS), the model did not like the little datast. For the window analysis, I tried 1000 window size, and 5000, yieldiong an error of zero-size array reduction operation maximum with no identity. I tried 10,000 and it ran more iterations, but at the end it failed.


------------------------------------- 

Data `PATH`:
```bash
/dfs/Grunwald_Lab/lab_collabs/ramorum_curryco_pops/genotyping_data/
    curryco_na1-vs-na1_filt_mac2.vcf.gz
    curryco_na1-vs-na1_filt_mac2_maf05.vcf.gz
    curryco_eu1-vs-eu1_filt_mac2.vcf.gz
    curryco_eu1-vs-eu1_filt_mac2_maf05.vcf.gz
```
