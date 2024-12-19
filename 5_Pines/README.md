# Introduction to Pines Server and Job Scheduling with SLURM

The **Pines** server is a high-performance computing (HPC) cluster designed to handle computational tasks, such as data analysis, machine learning, and simulations, across multiple nodes and processing units. To manage and distribute jobs efficiently across the system, **SLURM** (Simple Linux Utility for Resource Management) is used as the job scheduler. SLURM is a powerful workload manager that allows users to submit, manage, and monitor jobs running on the cluster.

## SBP Compute Cluster Pines:
The Pines server is a high-performance computing (HPC) cluster designed to handle computational tasks, such as data analysis, machine learning, and simulations, across multiple nodes and processing units. To manage and distribute jobs efficiently across the system, SLURM (Simple Linux Utility for Resource Management) is used as the job scheduler. SLURM is a powerful workload manager that allows users to submit, manage, and monitor jobs running on the cluster.

Key Features of SLURM on Pines:
Job Submission: Users can submit jobs to SLURM, specifying the resources needed (e.g., CPUs, GPUs, memory) and the expected runtime. SLURM automatically assigns resources based on availability.

Resource Allocation: SLURM handles resource allocation across different partitions, ensuring that jobs are run efficiently based on their resource requirements. For example, jobs that require GPUs can be scheduled on specific GPU partitions like gpu-I40.

Job Monitoring: Users can monitor the status of their submitted jobs, check whether they are running, queued, or completed, and retrieve job output or error logs.

Interactive Jobs: SLURM supports interactive jobs, which allow users to allocate resources for direct command-line access to the system (useful for debugging or running long tasks interactively).

Job Scripts: Jobs on Pines are typically submitted through batch scripts (SLURM job scripts) that define resource requests and commands to be executed. These scripts ensure that jobs run with the required environment and configurations.
1. **Job Submission**: Users can submit jobs to SLURM, specifying the resources needed (e.g., CPUs, GPUs, memory) and the expected runtime. SLURM automatically assigns resources based on availability.
   
2. **Resource Allocation**: SLURM handles resource allocation across different partitions, ensuring that jobs are run efficiently based on their resource requirements. For example, jobs that require GPUs can be scheduled on specific GPU partitions like `gpu-I40`.

3. **Job Monitoring**: Users can monitor the status of their submitted jobs, check whether they are running, queued, or completed, and retrieve job output or error logs.

4. **Interactive Jobs**: SLURM supports interactive jobs, which allow users to allocate resources for direct command-line access to the system (useful for debugging or running long tasks interactively).

5. **Job Scripts**: Jobs on Pines are typically submitted through batch scripts (SLURM job scripts) that define resource requests and commands to be executed. These scripts ensure that jobs run with the required environment and configurations.

## Basic Steps for Using SLURM on Pines:

### 1. Create a Job Script:
Write a SLURM batch script that includes the necessary resources (e.g., CPUs, memory, GPUs), job name, and commands to run your tasks. A typical job script looks like:

```bash
#!/bin/bash
#SBATCH --partition=gpu-I40      # Specify partition
#SBATCH --gres=gpu:1             # Request 1 GPU
#SBATCH --job-name=my_job        # Job name
#SBATCH --output=my_job.out      # Output file
#SBATCH --time=02:00:00          # Time limit (e.g., 2 hours)

# Run the application
python my_script.py

### 2. Submit the Job:
Once the job script is ready, submit it using the sbatch command:
