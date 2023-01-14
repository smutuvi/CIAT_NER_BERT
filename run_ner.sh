rm -r output_dir/* runs/*

task=epidemic
MAX_LENGTH=128
MODEL=bert-base-cased
OUTPUT_DIR=output_dir
BATCH_SIZE=32
NUM_EPOCHS=2
SAVE_STEPS=1000
LOGGING_STEPS=1000
SEED=42

#cat train.txt dev.txt test.txt | cut -d " " -f 2 | grep -v "^$"| sort | uniq > labels.txt

python3 run_ner.py \
  --data_dir=./data \
  --model_type=bert \
  --labels=./data/labels.txt \
  --model_name_or_path=${MODEL} \
  --output_dir=${OUTPUT_DIR} \
  --max_seq_length=${MAX_LENGTH} \
  --num_train_epochs=${NUM_EPOCHS} \
  --per_gpu_train_batch_size=${BATCH_SIZE} \
  --save_steps=${SAVE_STEPS} \
  --logging_steps=${LOGGING_STEPS} \
  --seed=${SEED} \
  --task=${task} \
  --do_train \
  --do_eval \
  --do_predict \
  --overwrite_output_dir \
  # --do_lower_case \
  #--max_grad_norm=0.5 \
  # --do_lower_case \
