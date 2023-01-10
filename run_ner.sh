export MAX_LENGTH=128
export BERT_MODEL=bert-base-multilingual-cased
#python3 preprocess.py train.txt.tmp $BERT_MODEL $MAX_LENGTH > data/train.txt
#python3 preprocess.py dev.txt.tmp $BERT_MODEL $MAX_LENGTH > data/dev.txt
#python3 preprocess.py test.txt.tmp $BERT_MODEL $MAX_LENGTH > data/test.txt
#cat train.txt dev.txt test.txt | cut -d " " -f 2 | grep -v "^$"| sort | uniq > data/labels.txt
export OUTPUT_DIR=output_dir
export BATCH_SIZE=32
export NUM_EPOCHS=
export SAVE_STEPS=750
export SEED=1

python3 run_ner.py \
--data_dir ./data \
--labels ./data/labels.txt \
--model_name_or_path $BERT_MODEL \
--output_dir $OUTPUT_DIR \
--max_seq_length  $MAX_LENGTH \
--num_train_epochs $NUM_EPOCHS \
--per_gpu_train_batch_size $BATCH_SIZE \
--save_steps $SAVE_STEPS \
--seed $SEED \
--do_train \
--do_eval \
--do_predict
