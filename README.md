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


# Analysis
Running deep neural networks using VCF data of _P. ramorum_ sampled in Southwestern, Oregon.
**Genral Analysis**
```bash
python scripts/locator.py --vcf data/eu1_noms_poly_nofixhet_nofixhomo_maf5.vcf.gz --sample_data data/EU1_sample_data.csv --out out/EU1/EU1
```
**Window Analysis**
```bash
python scripts/locator.py --zarr data/EU1_genotypes.zarr --sample_data data/EU1_sample_data.csv --out out/EU1/ --windows --window_size 10000
```
> Note: did not like 1000 window size - nor 5000, zero-size array reduction operation maximum has no identity, trying with 10,000 and its running more and more iterations.
