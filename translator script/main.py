# Use a pipeline as a high-level helper
import time

from transformers import pipeline

def main():
      # Load Module
      pipe = pipeline("translation", model="Helsinki-NLP/opus-mt-en-id")

      # Process Input Speech to Text

      input_text = "At the moment I have no clue wtf I'm doing, please help me bang Hein"

      # Translation

      start_translation_time = time.perf_counter()
      output_text = pipe(input_text)
      end_translation_time = time.perf_counter()

      print(output_text[0]['translation_text'])

      # Performance Measurement
      print(f"""
      Translation Speed : {end_translation_time - start_translation_time :.4f}
      """
      )
if __name__ == '__main__':
      main()