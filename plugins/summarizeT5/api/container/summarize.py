#!/usr/bin/env python3
"""T5 Small Text Summarization Script.

This script provides both command-line and API interfaces for text
summarization using T5-small model.

"""

import argparse
import sys
from typing import Optional
import torch
from transformers import T5ForConditionalGeneration, T5Tokenizer
import os


class T5Summarizer:
    """T5Summarizer Class."""

    def __init__(
        self,
        model_name: str = "t5-base",
        max_length: int = 512,
        min_length: int = 10,
    ):
        """Initialize T5 summarizer.

        Args:
            model_name: Name of the T5 model to use
            max_length: Maximum length of input text
            min_length: Minimum length of summary

        Returns:
            None
        """
        self.model_name = model_name
        self.max_length = max_length
        self.min_length = min_length
        self.device = torch.device(
            "cuda" if torch.cuda.is_available() else "cpu"
        )

        print(f"Loading {model_name} model...")
        print(f"Using device: {self.device}")

        # Load tokenizer and model
        self.tokenizer = T5Tokenizer.from_pretrained(model_name)
        self.model = T5ForConditionalGeneration.from_pretrained(model_name)

        # Move model to device
        self.model.to(self.device)

        print("Model loaded successfully!")

    def summarize(self, text: str, max_summary_length: int = 150) -> str:
        """Summarize the input text.

        Args:
            text: Input text to summarize
            max_summary_length: Maximum length of the summary

        Returns:
            summary: Summarized text
        """
        # Preprocess the text
        text = text.strip()
        if not text:
            return "No text provided for summarization."

        # Add summarization prefix for T5
        input_text = f"summarize: {text}"

        # Tokenize input
        inputs = self.tokenizer.encode(
            input_text,
            max_length=self.max_length,
            padding=True,
            truncation=True,
            return_tensors="pt",
        ).to(self.device)

        # Generate summary
        with torch.no_grad():
            summary_ids = self.model.generate(
                inputs,
                max_length=max_summary_length,
                min_length=self.min_length,
                length_penalty=2.0,
                num_beams=4,
                early_stopping=True,
            )

        # Decode the summary
        summary = self.tokenizer.decode(
            summary_ids[0], skip_special_tokens=True
        )

        return summary.strip()


def main():
    """Main function.

    Args:
        None

    Returns:
        None

    """
    parser = argparse.ArgumentParser(description="T5 Small Text Summarization")
    parser.add_argument("--text", type=str, help="Text to summarize")
    parser.add_argument(
        "--file", type=str, help="File containing text to summarize"
    )
    parser.add_argument(
        "--max-summary-length",
        type=int,
        default=150,
        help="Maximum length of summary (default: 150)",
    )
    parser.add_argument(
        "--model",
        type=str,
        default="t5-base",
        help="T5 model to use (default: t5-base)",
    )

    args = parser.parse_args()

    # Initialize summarizer
    summarizer = T5Summarizer(model_name=args.model)

    # Get input text
    if args.text:
        input_text = args.text
    elif args.file:
        try:
            with open(args.file, "r", encoding="utf-8") as f:
                input_text = f.read()
        except FileNotFoundError:
            print(f"Error: File '{args.file}' not found.")
            sys.exit(1)
    else:
        # Interactive mode
        print("Enter text to summarize (press Ctrl+D when done):")
        try:
            input_text = sys.stdin.read()
        except KeyboardInterrupt:
            print("\nExiting...")
            sys.exit(0)

    if not input_text.strip():
        print("No text provided for summarization.")
        sys.exit(1)

    # Generate summary
    print("\nGenerating summary...")
    summary = summarizer.summarize(input_text, args.max_summary_length)

    # Output results
    print("\n" + "=" * 50)
    print("ORIGINAL TEXT:")
    print("=" * 50)
    print(input_text[:500] + "..." if len(input_text) > 500 else input_text)

    print("\n" + "=" * 50)
    print("SUMMARY:")
    print("=" * 50)
    print(summary)
    print("=" * 50)


if __name__ == "__main__":
    main()
