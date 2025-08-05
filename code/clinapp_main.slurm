#!/bin/bash
#SBATCH -J clinapp
#SBATCH -o clinapp-%j.log
#SBATCH -e clinapp-%j.err
#SBATCH -N 1
#SBATCH -p gpu
#SBATCH --cpus-per-task=1
#SBATCH --gres=gpu:1
##SBATCH -w xxx # If you want to specify a computing node, you can write its name here and remove the first # 

echo -n "Start at   " >> clinapp_time.log
date +%T%t%F >> clinapp_time.log

source activate pykeen && python run.py --data_path '~/data/atom/clinapp/' --emb 512 --batch_size 512 --dataset 'kgepre_512_0_0'

echo -n "Finish at  " >> clinapp_time.log
date +%T%t%F >> clinapp_time.log





