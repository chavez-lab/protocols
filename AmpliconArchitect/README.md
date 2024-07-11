# Running Amplicon Architect on the SBP Pines Compute Cluster
Assuming that you have created an account, login to pines using `ssh usernames@pines` and input your password.

The tutorial is based on the Bafna Lab's [Amplicon Suite Github repo](https://github.com/AmpliconSuite/AmpliconSuite-pipeline). 

The pipeline is located in the directory `/mnt/beegfs/shares/chavez_lab/expanse/scripts/AmpliconSuite-pipeline`. You can see what is in the directory by using the commands: 
```bash
cd /mnt/beegfs/shares/chavez_lab/expanse/scripts/AmpliconSuite-pipeline
ls
```
Now, you need to create the conda environment and install the required packages. It is recommended to use Conda to do so with the following commands:
```bash 
conda create -n ampsuite && conda activate ampsuite
conda install -c bioconda -c conda-forge ampliconsuite 
conda install -c mosek mosek
```

The mosek license required to run AA is placed in `/mnt/beegfs/shares/chavez_lab/expanse/scripts/AmpliconSuite-pipeline/mosek/8/licenses`. 

It is also recommend to use a script to run AA on the Pines cluster, as the tool can take a lot of time and computing resources to run. Create an .sh file using Visual
Studio Code or your preferred code editing software. This example script uses the mm10 reference genome, but you can install any other one that is not in the directory 
`/mnt/beegfs/shares/chavez_lab/expanse/scripts/AmpliconSuite-pipeline/` by using:
```bash
cd /mnt/beegfs/shares/chavez_lab/expanse/scripts/AmpliconSuite-pipeline/data_repo
wget [url of reference_build]
tar zxf [reference_build].tar.gz
rm [reference_build].tar.gz
```
This example command starts from .fastq files and uses CNVkit (`already installed in /mnt/beegfs/shares/chavez_lab/expanse/scripts/AmpliconSuite-pipeline/cnvkit`) for seed generation.
You may adapt the command accordingly if you wish to start with .bam files. Your script will look something like this:
```bash
#!/bin/bash

# Activate the Conda environment if needed
source activate ampsuite
export AA_SRC=/mnt/beegfs/shares/chavez_lab/expanse/scripts/AmpliconSuite-pipeline/AmpliconArchitect/src/
export AC_SRC=/mnt/beegfs/shares/chavez_lab/expanse/scripts/AmpliconSuite-pipeline/AmpliconClassifier/
python3 /mnt/beegfs/shares/chavez_lab/expanse/scripts/AmpliconSuite-pipeline/AmpliconSuite-pipeline.py \
-s MP040819_L7 -t 16 --fastqs /mnt/beegfs/shares/chavez_lab/expanse/data/2024-01-05_tanja-mouse-wgs/MP040819/MP040819_CKDO230001655-1A_22GHJCLT3_L7_1.fq.gz \
/mnt/beegfs/shares/chavez_lab/expanse/data/2024-01-05_tanja-mouse-wgs/MP040819/MP040819_CKDO230001655-1A_22GHJCLT3_L7_2.fq.gz \
--ref mm10 --cnsize_min 10000 --run_AA --run_AC
```
You can run the script using `sbatch file_name.sh`. The resulting output file is slurm-jobid.out. To find the job id number, run `squeue -u username`. Then view your output file by running `cat slurm-jobid.out`, and this will tell you the resulting errors or progress of running the corresponding script.


Another alternative is to use a script that involves the AmpliconArchitect Docker container found in `/mnt/beegfs/shares/chavez_lab/expanse/scripts/AmpliconSuite-pipeline.sbatch` written by Owen. To step back a little, let's first define what a docker container is. A Docker container is essentially a self-contained environment in which we do not need to manually install the required packages or set up the virtual environment as in the previous option. For AA, the docker container, `docker://jluebeck/prepareaa:latest`, includes the tool itself, all dependencies, and libraries required. 

The usage for this is simple:
```bash
cd /mnt/beegfs/shares/chavez_lab/expanse/scripts/
sbatch AmpliconSuite-pipeline.sbatch --sample_name MP040819_L7 --fastqs /mnt/beegfs/shares/chavez_lab/expanse/data/2024-01-05_tanja-mouse-wgs/MP040819/MP040819_CKDO230001655-1A_22GHJCLT3_L7_1.fq.gz \
/mnt/beegfs/shares/chavez_lab/expanse/data/2024-01-05_tanja-mouse-wgs/MP040819/MP040819_CKDO230001655-1A_22GHJCLT3_L7_2.fq.gz \
-t 16 --ref mm10 --cnsize_min 10000 --run_AA --run_AC
