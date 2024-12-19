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
```
### 2. Submit the Job:
Once the job script is ready, submit it using the sbatch command:
```bash
sbatch my_job_script.sh
```
### 3. Monitor Job Status:
You can track the status of your job with the squeue command. This command will show you the queue status of your job and other jobs running on the cluster:
```bash
squeue -u username
```
If you want to check the status of a specific job, use its job ID:
```
squeue -j <job_id>
```
### 4. Job Output and Logs:
After your job completes, you can check the job’s output and error logs specified in your script (e.g., my_job.out, my_job.err). You can view the log files directly in your terminal:

```bash
cat my_job.out
```
You can also monitor real-time output while the job is running using the tail command:
```bash
tail -f my_job.out
```
### 5. Canceling a Job:
If you need to cancel a running job, use the scancel command followed by the job ID:

```bash
scancel <job_id>
```
### 6. Check Detailed Job Information:
For more detailed information about a specific job, use the scontrol command:

```bash
scontrol show job <job_id>
```

Here is an overview of the avaialable resources that includes partitions, nodes, and their statuses:
| PARTITION  | AVAIL | TIMELIMIT | NODES | STATE | NODELIST        |
|------------|-------|-----------|-------|-------|-----------------|
| normal*    | up    | infinite  | 2     | mix   | n[009-010]      |
| normal*    | up    | infinite  | 8     | alloc | n[001-008]      |
| normal*    | up    | infinite  | 2     | idle  | n[011-012]      |
| low        | up    | infinite  | 2     | mix   | n[009-010]      |
| low        | up    | infinite  | 8     | alloc | n[001-008]      |
| low        | up    | infinite  | 2     | idle  | n[011-012]      |
| high       | up    | infinite  | 2     | mix   | n[009-010]      |
| high       | up    | infinite  | 8     | alloc | n[001-008]      |
| high       | up    | infinite  | 2     | idle  | n[011-012]      |
| gpu-normal | up    | infinite  | 5     | mix   | gpu[001,003-006]|
| gpu-normal | up    | infinite  | 1     | alloc | gpu002          |
| gpu-l40    | up    | infinite  | 3     | mix   | gpu[007-009]    |


