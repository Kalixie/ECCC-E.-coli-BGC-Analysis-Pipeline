# BGC Diversity Analysis for *E. coli*

## Overview

This project aims to characterize biosynthetic gene clusters (BGCs) using genome mining tools (antiSMASH 8.0.4 and GECCO v0.10.3), identify the impact of environment on BGC profiles, and identify novel BGC candidates through a developed pipeline and framework. This pipeline includes 333 (to date) One Health *E. coli* isolates spanning human clinical, livestock, and aquatic/environmental sources.

## Methods

### Pipeline Tools

| Tool | Version | Purpose |
|------|---------|---------|
| QUAST | v5.2.0 | Assembly quality control |
| FastANI | v1.32 | Species Conformation |
| Kraken2 | v2.1.6 | Species Conformation |
| Bakta | v1.12.0 | Genome annotation |
| antiSMASH | v8.0.4 | Rule-based BGC prediction |
| GECCO | v0.10.3 | ML-based BGC prediction |
| BiG-SCAPE | v2.0.3 | BGC family clustering with MIBiG integration |
| MOB-suite | v3.1.9 | Plasmid/chromosome location |
| MLST | v2.33.1 | Sequence typing |
| EzClermont | v1.0.0 | Phylogroup assignment |
| RGI/CARD | v6.0.8 | AMR gene detection |
| clinker | v0.0.32 | BGC synteny comparison |
| Cytoscape | v3.10.4 | Network visualization |
| RStudio/tidyverse | v4.5.3 | Statistical analysis and visualization |

The pipeline was conducted on the Narval cluster (Compute Canada / Digital Research Alliance of Canada).
Citations for all tools are included in Tool_citations.txt

### R Analysis

R scripts for statistical analysis and visualization are not yet uploaded. These include crosstool overlap detection, novelty investigations, and NMDS/dbRDA ordination. To be added in a future commit as project progresses.

## Key Findings

- BGC composition is primarily driven by sequence type (ST) rather than collection source, suggesting lineage impacts BGC profiles over environment
- A conserved ~42kb arylpolyene/HR-T2PKS candidate cluster was identified in 8 phylogroup D/E livestock isolates with no MIBiG compound match, along with several other smaller clusters that warrant further investigation
