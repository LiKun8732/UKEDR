#!/bin/bash
#SBATCH -J pairre
#SBATCH -o pairre-%j.log
#SBATCH -e pairre-%j.err
#SBATCH -N 1
#SBATCH -p gpu
#SBATCH --cpus-per-task=1
#SBATCH --gres=gpu:1
##SBATCH -w xxx # If you want to specify a computing node, you can write its name here and remove the first # 

echo -n "Start at   " >> pairre_time.log
date +%T%t%F >> pairre_time.log

source activate dglke && python clinapp.py --model pairRE -d 512 --train_triples 'train_0_0.txt' --test_triples 'test_0_0.txt' --valid_triples 'valid_0_0.txt' --entities_fix 'entities_fix_0_0.dict' --relation_fix 'relations_fix1.dict' -save 'kgmodel/clinapp/pairRE/repo_0_0_512/' --entity_emb_name 'entity_embedding_0_0' --relation_emb_name 'relation_embedding_0_0'

echo -n "Finish at  " >> pairre_time.log
date +%T%t%F >> pairre_time.log
