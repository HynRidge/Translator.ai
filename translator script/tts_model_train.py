from transformers import SpeechT5ForTextToSpeech, Seq2SeqTrainingArguments, Seq2SeqTrainer, SpeechT5Processor
from datasets import load_dataset, Audio



def main():

    # Load Dataset
    dataset = load_dataset("indonesian-nlp/librivox-indonesia", "ind")
    # Limit Sampling rate to 16kHz for SpeechT5
    # dataset = dataset.cast_column("audio", Audio(sampling_rate=16000))
    print(dataset)
    # # Data Preprocessing

    # checkpoint = "microsoft/speecht5_tts"
    # processor = SpeechT5Processor.from_pretrained(checkpoint)

    # model = SpeechT5ForTextToSpeech.from_pretrained(checkpoint)

    # # Default Training Args from HuggingFace guide
    # training_args = Seq2SeqTrainingArguments(
    #     output_dir="model",  # change to a repo name of your choice
    #     per_device_train_batch_size=4,
    #     gradient_accumulation_steps=8,
    #     learning_rate=1e-5,
    #     warmup_steps=500,
    #     max_steps=4000,
    #     gradient_checkpointing=True,
    #     evaluation_strategy="steps",
    #     per_device_eval_batch_size=2,
    #     save_steps=1000,
    #     eval_steps=1000,
    #     logging_steps=25,
    #     report_to=["tensorboard"],
    #     load_best_model_at_end=True,
    #     greater_is_better=False,
    #     label_names=["labels"],
    # )

    # trainer = Seq2SeqTrainer(
    #     args=training_args,
    #     model=model,
    #     train_dataset=dataset["train"],
    #     eval_dataset=dataset["test"],
    #     # data_collator=data_collator,
    #     tokenizer=processor,
    # )
    # trainer.train()

if __name__ == '__main__':
    main()