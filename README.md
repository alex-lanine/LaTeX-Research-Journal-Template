# LaTeX-Research-Journal-Template

A clean and customizable $\LaTeX$ template for maintaining a research log. 
This repository includes a script for automating daily entries, **desinged specifically for Visual Studio Code (VS Code)**.

## Prerequisites

### Visual Studio Code (VS Code)
- [Download VS Code](https://code.visualstudio.com/).
- Install the [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) extension for LaTeX editing and PDF compilation.

### LaTeX Distribution
- Install a LaTeX distribution such as [TeX Live](https://www.tug.org/texlive/) or [MiKTeX](https://miktex.org/).

### Git
- Clone and version-control this repository.

### Bash Shell (Optional)
- For running automation scripts, ensure you have access to a Bash shell (default on Linux and macOS).

## Getting Started

### Install LaTeX Workshop
1. Open the Extensions view (`Ctrl+Shift+X` or `Cmd+Shift+X` on macOS) and search for "LaTeX Workshop."
2. Install the extension to enable LaTeX editing, compilation, and PDF preview.

### Open the Project in VS Code
1. Clone this repository and open the folder in VS Code:
   ```bash
   git clone https://github.com/alex-lanine/LaTeX-Research-Journal-Template.git
   cd template
   code .
   ```
2. Use the provided Bash script to generate a new daily entry:
  ```
  ./new_entry.sh
  ```

This:
- Creates a new `.tex` file in the `content/` directory with the current date as its name (e.g. `content/241208.tex`), populated with a `\chapter*` heading with the current date.
- Automatically opens the new file in VS Code for immediate editng.
- Updates the main `researchlog.tex` file by inserting an `\input{}` line for the new entry above the `%end of entries` marker. 