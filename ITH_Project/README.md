# Mapping Intratumoral Heterogeneity Using Spatial-ATAC Sequencing
First, some background information is neccessary to understand the goals of this project. 

Spatial-ATAC sequencing is a relatively novel type of sequencing that utilizes spatial coordinates to map cell types via analysis of chromatin accessibility profiles in a spatial manner. In essence, it enables researchers to determine which regions are open and accessible to transcription factors and other regulatory proteins in specific locations within the tissue, along with where difference cell types are located within the context of the tissue itself. 

Extrachromosomal DNA (ecDNA) are circular DNAs without a centromere that drive intratumoral heteregoenity and known to be associated with poor survival in many cancer types. One of our other ongoing projects with a manuscript in progress involves a pediatric pancancer study of ecDNA. We have taken 9 samples, with some of them as pairs coming from the same patient with different stages, from this cohort to run spatial-ATAC/deep sequencing on. Here is a table detailing the information corresponding to these samples: 


| Sample        | Diagnosis     | Type               |  ecDNA Status | Spatial ATAC? | Multiomic? |
| ------------- | ------------- | ------------------ | ------------- | ------------- | ---------------- |
| 7316-178      | MB-SHH        | Initial            |  Yes          |  Yes          |  Yes             |
| 7316-2178     | MB-G4         | Initial            |  Yes          |  Yes          |  Yes             |
| 7316-153      | MB-G3         | Initial            |  Yes          |  Yes          |  Yes             |
| 7316-272      | ETMR          | Initial            |  Yes          |  No           |  Yes             |
| 7316-2577     | ETMR          | Recurrence         |  No           |  No           |  Yes             |
| 7316-883      | MB-G3         | Initial            |  No           |  No           |  Yes             |
| 7316-1772     | MB-G3         | Progressive/Autopsy|  Yes          |  No           |  Yes             |
| 7316-1801     | MB-G4         | Initial            |  Yes          |  Yes          |  No              |
| 7316-2107     | MB-G4         | Initial            |  Yes          |  No           |  No              |


As seen in the table, there are three samples that we have sent for spatial-ATAC sequencing, each of which have ecDNA. Using this type of sequencing, we want to visualize where in the brain tumor tissue (spatial context) the ecDNA is located. There is a tool that Owen developed that I have used to try and accomplish this called [ecdna-quant](https://github.com/auberginekenobi/ecdna-quant). The directory to the results of this that may prove useful in your analysis is located at `/mnt/beegfs/shares/chavez_lab/rkenkre/spatial_ATAC/ecdna-quant/7316-178_spatial`, `/mnt/beegfs/shares/chavez_lab/rkenkre/spatial_ATAC/ecdna-quant/7316-2178_spatial`, and `/mnt/beegfs/shares/chavez_lab/rkenkre/spatial_ATAC/ecdna-quant/7316-153_spatial` on the Pines server. 

For the ones that we have multiome (RNA/ATAC) sequencing for, analysis involving clustering of the different cell types located within each sample has been completed using Seurat. Markers and corresponding cell types within brain tissue were assessed for each cluster, and for the samples that have ecDNA, the ecDNA-amplified genes were used as markers to determine which clusters are ecDNA+. 

We want to somehow use this analysis to provide insight into how we can define these cell types of the samples using the spatial data we have acquired. Perhaps doing some sort of label transfer using Seurat from the multiome to the spatial data may work out, but it may not be evident whether those same cell types will show up within the spatial data. Seurat may be the best tool to perform this analysis, but feel free to explore this with any other tool if you feel that works better. 
