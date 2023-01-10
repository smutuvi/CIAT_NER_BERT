rm -r output_dir/* runs/*

task=epidemic
MAX_LENGTH=310
MODEL=bert-base-multilingual-cased
OUTPUT_DIR=output_dir
BATCH_SIZE=16
NUM_EPOCHS=10
SAVE_STEPS=1000
LOGGING_STEPS=1000
SEED=42

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
  --max_grad_norm=0.5 \
 # --do_lower_case \
