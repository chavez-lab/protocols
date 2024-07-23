#!/bin/bash
# This line specifies the script interpreter to be Bash. No touchy!

#SBATCH --job-name=jupyter
# The name of the job as it will appear in the job queue. You can change it as you see fit. 

#SBATCH --nodes=1
# Request 1 node for the job. 

#SBATCH --ntasks=1
# Request 1 task for the job

#SBATCH --cpus-per-task=4
# Request 4 CPUs for this task 

#SBATCH --mem=16G
# Request 16 GB of memory for the job. Can change this to how much memory you need. 

#SBATCH --time=04:00:00
# Set a time limit for the job of 4 hours. Can change this to however long you need. 

#SBATCH --output=jupyter_%j.log
# Direct the output of the job to a file named jupyter_<job_id>.log, where <job_id> is replaced with the job ID

#SBATCH -D .
# start the jupyter server in the current working directory.

jupyter-lab --no-browser --port=8893 --ip=0.0.0.0
# Start JupyterLab without opening a browser, set it to listen on port 8893 and on all IP addresses (0.0.0.0)
