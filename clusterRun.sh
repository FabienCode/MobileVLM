#!/bin/sh
#BSUB -gpu "num=1:mode=exclusive_process"
#BSUB -n 1
#BSUB -q gpu2
#BSUB -oo ./cluster/tmp.out
#BSUB -eo ./cluster/tmp.err
#BSUB -J  mobileVLM1
#BSUB -R "rusage[ngpus_physical=1]"
nvidia-smi > gpuout
nvcc -V > nvccout
unbuffer bash run.sh mobilevlm_v2_1.7b pretrain-finetune-test weights/MobileLLaMA-1.4B-Chat weights/clip-vit-large-patch14-336 > ./cluster/vx-x-x 2>&1