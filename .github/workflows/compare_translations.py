import json

def compare_translations(default_translation, other_translation, language):
    missing_translations = []

    for key, default_value in default_translation.items():
        if key not in other_translation:
            missing_translations.append(key)

    if missing_translations:
        print(f"Missing translations in {language}:")
        for key in missing_translations:
            print(f"  {key}")
        print("\n")
    else:
        print(f"All translations present in {language}.")

def check_translations():
    # Load default translation
    with open("../../lang/en.json", "r", encoding="utf-8") as default_file:
        default_translation = json.load(default_file)

    # Load all other translations
    languages = ["en", "es", "fr","de","hi","ja","pt","zh"]  
    for lang in languages:
        if lang == "en":
            continue

        with open(f"../../lang/{lang}.json", "r", encoding="utf-8") as other_file:
            other_translation = json.load(other_file)

        # Compare translations
        compare_translations(default_translation, other_translation, lang)

if __name__ == "__main__":
    check_translations()
