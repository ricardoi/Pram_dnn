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

## Inputs
I need the .vcf files or a tab-delimited table with first column 'sampleID' and each entry giving the count of minor (or derived) alleles for an individual at a site. Missing locations must be indicated with `NA` or `NaN`. 

Sample metadata should be a tab-delimited file with the first row:
|sampleID | x | y |
| --      |-- |-- |
| Name    | 0°|45°|


# CQLS data location
`/dfs/Grunwald_Lab/lab_collabs/ramorum_curryco_pops/genotyping_data`
VCF data summary:
|Filtering| type | lineage | SNP count| file name |
| -- | -- | -- | -- |-- |
|Unfiltered | polymorphic | combined |339,334 | poly.genotyped_CurryCo_EU2_NA2reps_n322.PHRA102_genes_merged.vcf.gz |
|Heavily filtered | polymorphic |combined | 68,787 |  eu1_na1_noms_poly_nofixhet_nofixhomo_maf5.vcf.gz |
Heavily filtered | polymorphic | NA1 | 55,545 | na1_noms_poly_nofixhet_nofixhomo_maf5.vcf.gz |
Heavily filtered | polymorphic | EU1 | 21,352 | eu1_noms_poly_nofixhet_nofixhomo_maf5.vcf.gz |
