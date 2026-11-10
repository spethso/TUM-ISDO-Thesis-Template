# LaTeX Template for Theses at TUM

A clean LaTeX template for Bachelor's and Master's theses, and their exposés, at the
[TUM School of Computation, Information and Technology](https://www.cit.tum.de/) of the
Technical University of Munich (TUM).

> **Unofficial template.** This is not an official template of TUM. It is not provided,
> endorsed, or checked by TUM or its examination offices, and using it does not guarantee that
> your thesis meets all formal requirements. **Always check the current requirements of your
> examination regulations and your examiner before you hand in.**

## Quickstart

1. Copy this folder (or upload it as a ZIP to [Overleaf](https://www.overleaf.com/)).
2. Set your thesis information in `main.tex` (`\TUMsetup{...}`), including whether you
   write the exposé or the thesis (`document = expose` or `document = thesis`).
3. Compile `main.tex` with **pdfLaTeX** (or LuaLaTeX) and **Biber**:
   - Command line: `latexmk` (or `make`), which produces `main.pdf`. `make check` also checks
     the log for problems (see below).
   - Overleaf: works out of the box (pdfLaTeX is the default compiler).
   - VS Code: install *LaTeX Workshop*; it uses the provided `.latexmkrc`.
4. Search for `TODO` comments and follow them.
5. Before you hand in, set `mode = final`, run `make check`, and work through
   [`docs/thesis-checklist.md`](docs/thesis-checklist.md).

## Exposé or thesis

The same template produces both the exposé for your thesis and the thesis itself. Switch in
`main.tex`:

```latex
\TUMsetup{
  document = expose,  % or: thesis
  ...
}
```

Both share the title page data, `settings.tex`, `acronyms.tex`, and `bibliography.bib`, so you
can reuse references and research questions from the exposé in the thesis.

The exposé (3--4 pages) follows the structure required by the
[Chair of Information System Development and Operation](https://www.cs.cit.tum.de/en/isdo/teaching/theses/):

| Part | File |
|------|------|
| Title page ("Master's Thesis Exposé", without commenced/completed dates) | generated from `\TUMsetup{...}` |
| 1 Motivation (problem, research gap, initial literature search, research questions) | `expose/01-motivation.tex` |
| 2 Methodology | `expose/02-methodology.tex` |
| 3 Planned Use of (Generative) AI | `expose/03-ai-use.tex` |
| 4 Evaluation | `expose/04-evaluation.tex` |
| 5 Timeline & Risks (with a Gantt chart and a risk table) | `expose/05-timeline-risks.tex` |
| References, followed by the lists of figures and tables | `main.tex` |

The exposé has no abstract, table of contents, acknowledgments, list of acronyms, appendix, or
declarations. Its sections, figures, and tables are numbered without chapter numbers.

## Draft or final version

While you write, keep `mode = draft` in `\TUMsetup` (the default). The draft version

- numbers the lines, so your supervisor can refer to them in feedback,
- shows the date and the git commit in the footer ("Draft of November 10, 2026, commit 6ce8784"),
  so feedback rounds cannot be mixed up (a `+` after the commit marks uncommitted changes;
  without git, e.g., on Overleaf, only the date is shown), and
- shows TODO notes and the hints of this template.

For the version you submit, set `mode = final`. The final version hides line numbers, the
draft mark, and all TODO notes. Every TODO note, missing figure, and the appendix *LaTeX
Examples* that is still included is reported as a warning with its file and line, so you can
resolve them. `make check` lists them.

## Checking the document

`make check` builds the document and runs `scripts/check-log.sh`, which reports

- LaTeX errors,
- undefined references and citations (`??` in the PDF),
- overfull boxes that stick out more than 1pt, and
- leftovers in the final version (TODO notes, template examples).

The GitHub Action (`.github/workflows/build.yml`) builds both the thesis and the exposé on every
push, runs the same check, fails if it finds problems, and provides both PDFs as artifacts.

## PDF/A

If your thesis is archived or published in a repository that requires PDF/A, remove the `%` in
front of the `\DocumentMetadata{pdfstandard=a-2b, lang=en-US}` line at the top of `main.tex`
(`lang=de-DE` for a German thesis). This requires LaTeX 2024 or newer. Check the result with a
PDF/A validator such as [veraPDF](https://verapdf.org). Some packages are not compatible with
`\DocumentMetadata` yet; if you add packages, build once with PDF/A enabled to check.

## Structure of the thesis

| Part | File |
|------|------|
| Title page | generated from `\TUMsetup{...}` in `main.tex` |
| Abstract (English) | `frontmatter/abstract.tex` |
| Kurzzusammenfassung (German) | `frontmatter/kurzzusammenfassung.tex` |
| Acknowledgments (optional) | `frontmatter/acknowledgments.tex` |
| Table of contents, lists of figures, tables, listings, algorithms | `main.tex` |
| Acronyms, with the page of their first use | `acronyms.tex` |
| Introduction (context, problem, research questions, results, contributions, thesis structure) | `chapters/01-introduction.tex` |
| Foundations | `chapters/02-foundations.tex` |
| Methodology | `chapters/03-methodology.tex` |
| Related work (incl. literature search methodology) | `chapters/04-related-work.tex` |
| Requirements (optional) | `chapters/05-requirements.tex` |
| Concept (rename or split according to your approach) | `chapters/06-concept.tex` |
| Architecture and implementation | `chapters/07-implementation.tex` |
| Evaluation (GQM plan, study design, results, discussion per research question, threats to validity) | `chapters/08-evaluation.tex` |
| Conclusion and future work (summary, benefits, limitations, future work) | `chapters/09-conclusion.tex` |
| References | `bibliography.bib` |
| Appendix | `appendix/*.tex` (`b-latex-examples.tex` shows how to use the template; remove it) |
| Declaration of AI use (tool, model, type of usage, location) | `backmatter/ai-use.tex` |
| Declaration of independent work | `backmatter/declaration.tex` |

The chapters contain guidance on what belongs where. Replace it with your own content, and
adapt the chapter structure to your thesis together with your supervisor.

## Title page

```latex
\TUMsetup{
  type       = master,  % master | bachelor | free text, e.g., {Guided Research}
  title      = {The Title of Your Thesis},
  title-de   = {Der Titel Ihrer Arbeit},
  author     = {Your Name},
  program    = {Informatics},
  examiner   = {Prof.\ Dr.\ Ingo Weber},
  supervisor = {Dr.\ Sandro Speth},
  supervisor = {Second Supervisor, M.Sc.},  % optional: shows "Supervisors"
  start-date = {May 15, 2026},
  end-date   = {November 15, 2026},
  school     = {TUM School of Computation, Information and Technology},
  department = {Department of Computer Science},
  chair      = {Chair of Information System Development and Operation},
  location   = {Munich},
}
```

- Repeat `supervisor` for every supervisor. With more than one, the label changes from
  *Supervisor* to *Supervisors*.
- Empty or omitted fields (e.g., `department`) are not shown.
- The TUM logo is read from `logos/tum-logo.pdf` (key `logo`).
- The values are also used for the PDF metadata and the declaration.
- `signature = true` (default) adds a signature line to the declaration. Sign the submitted PDF
  digitally (e.g., via the TUM Trust Center) or as your examination office requires. For a version
  that is published, use `signature = false`: the declaration then shows only name, place, and
  date. Never put an image of your handwritten signature into a published PDF.

## Language

The thesis language is set by the class options in `main.tex`; the **last** language is the main
language:

- English thesis: `ngerman,english` (default)
- German thesis: `english,ngerman`. Use `title-en` instead of `title-de` for the second title.

All labels generated by the template (title page, list of acronyms, declaration, ...) switch
automatically.

## Acronyms

Define acronyms in `acronyms.tex`:

```latex
\newacronym{llm}{LLM}{large language model}
```

Use `\gls{llm}` in the text: the first use prints *large language model (LLM)*, all further uses
*LLM*. Use `\glspl{...}` for the plural and `\Gls{...}` at the beginning of a sentence.
The list of acronyms only contains the acronyms you use, together with the page of their first use.
Do not use `\gls{...}` in the abstract, headings, or captions, because the first use would be
recorded there. No external tool (such as `makeglossaries`) is needed.

## References

Add your references to `bibliography.bib`, ideally managed with [JabRef](https://www.jabref.org)
or [Zotero](https://www.zotero.org). Cite with `\cite{key}` or `\textcite{key}`.
The citation style is set in `settings.tex` (`style=numeric-comp`; alternatives: `alphabetic`,
`authoryear`). URLs are only printed if an entry has no DOI.

## Useful commands

| Command | Purpose |
|---------|---------|
| `\ifTUMexpose ... \else ... \fi` | Content only for the exposé or only for the thesis |
| `\cref{label}`, `\Cref{label}` | Reference with type, e.g., "Figure 3.1" |
| `\defRQ{question}{label}`, `\refRQ{label}` | State a research question in the introduction and reference it ("RQ 1") |
| `\discussRQ{label}` | Repeat a research question as a heading, e.g., in the discussion |
| `\finding[label]{text}` | Highlighted, numbered finding ("Finding 1: ...") |
| `\begin{contributions} \item ... \label{c:label} \end{contributions}`, `\refC{label}` | List of contributions (C1), (C2), ... and reference to one ("C1") |
| `\todo{...}`, `\todo[inline]{...}`, `\missingfigure{...}` | Notes to yourself (`todonotes`); hidden and reported as warnings with `mode = final` |
| `\ifTUMfinal ... \else ... \fi` | Content only for the final or only for the draft version |
| `\enquote{...}` | Quotation marks matching the language |
| `\num{...}`, `\qty{...}{...}` | Numbers and units (`siunitx`) |
| `\includeonly{chapters/...}` | Compile only selected chapters (in `main.tex`) |

## Working with AI agents

If you use AI agents such as Claude Code, GitHub Copilot, Cursor, or Codex, they read the
instructions in [`AGENTS.md`](AGENTS.md) (`CLAUDE.md` imports it for Claude Code). The file
describes the template's structure, build, and conventions, and asks agents to respect academic
integrity: no invented references, data, or results, and documenting AI use in the declaration
of AI use. Adapt it to the rules of your examiner, e.g., which AI use is allowed.

## Layout options

In `main.tex`:

- **One- or two-sided:** the default is one-sided (best for the digital version). For a printed,
  two-sided thesis, use `twoside, BCOR=12mm, open=right`.
- **Paragraphs:** `parskip=half-` separates paragraphs by space; remove it for indented paragraphs.

In `settings.tex`: fonts (Palatino, Helvetica, Inconsolata), colors (TUM corporate design),
colored links, citation style.

## Files

```text
main.tex              Thesis information and document structure
settings.tex          Packages and layout
tumthesis.sty         Title page, labels, colors, and signature block
acronyms.tex          Acronyms
bibliography.bib      References
expose/               Exposé sections
frontmatter/          Abstract, Kurzzusammenfassung, acknowledgments
chapters/             Main chapters
appendix/             Appendix chapters
backmatter/           Declaration of AI use and declaration of independent work
figures/              Your figures
logos/                TUM logo
docs/                 Thesis checklist
scripts/check-log.sh  Checks the log for errors, undefined references, overfull boxes, leftovers
AGENTS.md, CLAUDE.md  Instructions for AI agents
.latexmkrc, Makefile  Build configuration
.github/workflows/    GitHub Action that builds and checks thesis and exposé on every push
```

## Credits and license

This template combines ideas from

- the [TUM thesis template](https://github.com/fwalch/tum-thesis-latex) by Florian Walch and
  contributors, and
- the [scientific thesis template](https://github.com/latextemplates/scientific-thesis-template)
  of the University of Stuttgart and contributors and its
  [ISTE fork](https://github.com/ISTE-SQA/template-thesis), including the structure of the
  chapters, the declaration of AI use, the declaration text, and the thesis checklist.

The template is licensed under the [BSD Zero Clause License (0BSD)](LICENSE): you may use,
copy, modify, and distribute it for any purpose, without any conditions, and you do not need to
keep a license notice in your thesis. The license applies only to the template; your thesis is
entirely yours.

**Exception:** The TUM logo (`logos/tum-logo.pdf`) is a trademark of the Technical University of
Munich and is **not** covered by this license. It may only be used in accordance with the TUM
corporate design guidelines, e.g., on theses written at TUM.
