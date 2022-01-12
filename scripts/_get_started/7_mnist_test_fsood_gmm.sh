#!/bin/bash
# sh scripts/0_get_started/0_mnist_train.sh

GPU=1
CPU=1
node=67
jobname=openood

PYTHONPATH='.':$PYTHONPATH \
srun -p dsta --mpi=pmi2 --gres=gpu:${GPU} -n1 \
--cpus-per-task=${CPU} --ntasks-per-node=${GPU} \
--kill-on-bad-exit=1 --job-name=${jobname} -w SG-IDC1-10-51-2-${node} \
python main.py \
--config configs/datasets/mnist_datasets.yml \
configs/networks/lenet.yml \
configs/train/mnist_baseline.yml \
--dataset.image_size 28 \
--network.name lenet