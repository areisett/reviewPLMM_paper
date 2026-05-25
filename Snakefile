ms = "lmm-genetic-review"

rule pdf:
    input:
        f"{ms}.tex",
        "main.tex",
        "references.bib"
    output:
        f"build/{ms}.pdf"
    shell:
        f"""
        latexmk --xelatex -output-directory=build -silent {ms}.tex
	texfot xelatex -interaction=nonstopmode -output-directory=build -synctex=1 {ms}.tex
        """

rule arxiv:
    input:
        f"build/{ms}.pdf"
    output:
        f"arxiv/build/{ms}.pdf"
    shell:
        f"""
        mkdir -p arxiv/build
        singletex {ms}.tex arxiv/{ms}.tex
        cd arxiv
        latexmk --xelatex -output-directory=build -silent {ms}.tex
        texfot xelatex -interaction=nonstopmode -output-directory=build -synctex=1 {ms}.tex
        """

rule supplement:
    input:
        f"supplement.tex"
    output:
        f"supplement/supplement.pdf"
    shell:
        f"""
        latexmk --xelatex -output-directory=supplement -silent supplement.tex
	texfot xelatex -interaction=nonstopmode -output-directory=supplement -synctex=1 supplement.tex
        """

