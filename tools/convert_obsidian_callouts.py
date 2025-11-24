import os
import re
import shutil
from pathlib import Path

SOURCE_DIR = "docs"
OUTPUT_DIR = "site_docs"   # dossier temporaire destiné à MkDocs
RES_DIR = os.path.join(SOURCE_DIR, "Ressources")

CALL_OUT_MAP = {
    "note": "note",
    "info": "note",
    "tip": "tip",
    "important": "important",
    "warning": "warning",
    "attention": "warning",
    "danger": "danger",
    "error": "danger",
    "failure": "failure",
    "success": "success",
    "example": "example",
    "question": "question",
    "abstract": "abstract"
}

CALL_OUT_REGEX = re.compile(r'^\s*>\s*\[!(\w+)\]\s*(.*)$')
OBSIDIAN_IMAGE_REGEX = re.compile(r'!\[\[(.*?)\]\]')

def convert_callout_type(obsidian_type):
    key = obsidian_type.lower()
    return CALL_OUT_MAP.get(key, "note")  # fallback

def convert_obsidian_images(line, current_md_path):
    """
    Convertit ![[image.png]] → ![image.png](/TP-AlpineLinux/Ressources/image.png)
    """
    def repl(match):
        img_name = match.group(1).strip()
        real_path = Path(RES_DIR) / img_name

        if real_path.exists():
            # Chemin ABSOLU pour GitHub Pages
            return f"![{img_name}](/TP-AlpineLinux/Ressources/{img_name})"
        else:
            print(f"[WARNING] Image introuvable: {img_name}")
            return f"![{img_name}](/TP-AlpineLinux/Ressources/{img_name})"

    return OBSIDIAN_IMAGE_REGEX.sub(repl, line)



def convert_file(input_path, output_path):
    output_lines = []
    inside_callout = False

    with open(input_path, "r", encoding="utf-8") as f:
        lines = f.readlines()

    for line in lines:

        # --- 1) Conversion images Obsidian ---
        line = convert_obsidian_images(line, input_path)

        # --- 2) Conversion admonitions ---
        match = CALL_OUT_REGEX.match(line)
        if match:
            obsidian_type = match.group(1)
            title = match.group(2).strip()

            md_type = convert_callout_type(obsidian_type)

            if title:
                output_lines.append(f'!!! {md_type} "{title}"\n')
            else:
                output_lines.append(f'!!! {md_type}\n')

            inside_callout = True
            continue

        if inside_callout:
            if line.strip().startswith(">"):
                cleaned = line.lstrip(">").rstrip("\n")
                output_lines.append("    " + cleaned.strip() + "\n")
                continue
            else:
                inside_callout = False

        output_lines.append(line)

    with open(output_path, "w", encoding="utf-8") as f:
        f.writelines(output_lines)


def process_all_files():
    # On régénère site_docs
    if os.path.exists(OUTPUT_DIR):
        shutil.rmtree(OUTPUT_DIR)
    shutil.copytree(SOURCE_DIR, OUTPUT_DIR)

    # On convertit chaque fichier dans site_docs
    for root, dirs, files in os.walk(OUTPUT_DIR):
        for filename in files:
            if filename.endswith(".md"):
                src = os.path.join(root, filename)
                convert_file(src, src)


if __name__ == "__main__":
    print("Converting Obsidian → MkDocs (callouts + images)…")
    process_all_files()
    print(f"Done. Converted files are in: {OUTPUT_DIR}/")