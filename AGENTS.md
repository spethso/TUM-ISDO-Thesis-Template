# Instructions for AI Agents

This repository contains a student's thesis (or the exposé for it) at the Technical University
of Munich (TUM), written in LaTeX with an unofficial TUM template. These instructions apply to
any AI agent working in this repository (e.g., Claude Code, GitHub Copilot, Cursor, Codex).

## Academic integrity comes first

A thesis is an examination. The student is responsible for its entire content and signs a
declaration that they wrote it independently. Therefore:

- **Never invent references.** Only cite sources that exist and that the student provided or
  that you have verified (e.g., via the DOI). Never guess authors, titles, venues, years, page
  numbers, or DOIs. If a statement needs a source you cannot verify, add a TODO note instead:
  `\todo{Source needed}`.
- **Never invent data, results, or quotes.** Measurements, study results, interview statements,
  and numbers in tables and figures must come from the student's actual work. Use clearly
  marked placeholders if something is missing.
- **Respect the rules on AI use.** The examiner decides which AI use is allowed. If the student
  has not told you what is allowed, ask before generating substantial text, figures, or code
  that will become part of the thesis.
- **Document AI use.** Whenever your output (text, figures, code, translations, ...) is adopted
  into the thesis, remind the student to add an entry to `backmatter/ai-use.tex` with the tool,
  the exact model and version, the type of usage, and the location. Offer to add the entry.
- **Do not touch the declaration.** Do not change the text of `backmatter/declaration.tex`
  unless the student explicitly asks, never sign it, and never add an image of a signature.
- **Prefer helping over ghostwriting.** Good tasks are, e.g., explaining concepts, giving
  feedback on structure and argumentation, finding unclear sentences, fixing LaTeX problems,
  checking consistency, and preparing figures from the student's data.

## Project structure

| Path | Content |
|------|---------|
| `main.tex` | Thesis data (`\TUMsetup{...}`) and document order. `document = thesis` or `document = expose` switches between thesis and exposé. |
| `settings.tex` | Packages, layout, and helper commands. Change only when asked. |
| `tumthesis.sty` | Title page, labels, colors, predefined study programs, signature block. Change only when asked. |
| `people.tex` | Predefined examiners and supervisors (keys such as `weber`, `speth` for `\TUMsetup`). |
| `frontmatter/` | Abstract, Kurzzusammenfassung (German abstract), acknowledgments |
| `chapters/` | Thesis chapters (`01-introduction.tex` to `09-conclusion.tex`) |
| `expose/` | Exposé sections (Motivation, Methodology, Planned Use of (Generative) AI, Evaluation, Timeline & Risks) |
| `appendix/` | Appendix chapters. `b-latex-examples.tex` demonstrates the template and must be removed before submission. |
| `backmatter/` | Declaration of AI use and declaration of independent work |
| `acronyms.tex` | Acronym definitions |
| `bibliography.bib` | References (biblatex/Biber) |
| `figures/` | Figures (prefer vector graphics: PDF or TikZ) |
| `docs/thesis-checklist.md` | Checklist before submission |

## Building

- Build with `latexmk` (or `make`) in the repository root. This runs pdfLaTeX and Biber and
  produces `main.pdf`. LuaLaTeX also works: `latexmk -lualatex`.
- After every change, run `make check` (builds and runs `scripts/check-log.sh`). It must
  report no errors, no undefined references or citations (`??` in the PDF), and no overfull
  boxes you introduced.
- `mode = draft` (default in `\TUMsetup`) shows line numbers, the draft date and commit, and
  TODO notes. Do not switch to `mode = final` unless the student asks; in the final version,
  every remaining TODO note is reported by `make check` and must be resolved.
- PDF/A output is opt-in via the `\DocumentMetadata` line at the top of `main.tex`. When you add
  packages, check that the document still builds with it enabled.
- `make clean` removes auxiliary files. Do not commit build output or `gitinfo.tex`
  (see `.gitignore`).

## Reviewing the thesis or exposé

When the student asks you to review the document (or a part of it), review it like a
scientific reviewer and focus on the following criteria:

- **Soundness and scientific rigor.** Are the research questions precise? Is the methodology
  appropriate for answering them and applied correctly? Are claims supported by evidence,
  citations, or arguments? Do the conclusions follow from the results, without
  overgeneralizing? Are threats to validity and limitations discussed honestly?
- **Significance and importance.** Is the problem relevant, and is its relevance motivated
  convincingly? Is it clear who benefits from the results and how?
- **Novelty and originality.** Is the research gap clearly shown based on related work? Is it
  clear what is new, i.e., what the contributions are and how they differ from prior work?
- **Transparency and reproducibility.** Could another person repeat the study? Are the
  method, setup, data, parameters, tools, and versions described? Is a replication package
  provided? Is the use of AI tools documented?
- **Clarity.** Is the text easy to understand and well structured? Is every term introduced
  before it is used? Does each chapter start with an introduction of its sections? Are
  figures and tables explained in the text? Does the text follow the writing style below?

How to give the review:

- Start with a short summary of the document and its main strengths.
- Then list the issues, ordered by severity (major issues before minor ones), each with its
  location (file and line, or section), an explanation of why it is a problem, and a concrete
  suggestion for how to address it.
- Be honest and specific. Do not praise without reason, and do not invent problems.
- Give feedback instead of rewriting large parts yourself. The student revises the text.

## Writing style

Apply these rules when you write or review text, and point out violations in the student's
text. They follow Strunk's *The Elements of Style* and assume American English (use German
equivalents for a German thesis).

- **Easy to understand.** Write short, clear sentences in plain language. Prefer common words
  over fancy ones, and concrete statements over vague ones. One idea per sentence.
- **No typical AI phrasing.** Text you produce must not read like AI-generated text. Avoid in
  particular:
  - dashes as punctuation (em dashes `---` or spaced en dashes ` -- ` for insertions or
    asides); use commas, parentheses, or separate sentences instead. En dashes for ranges
    (`3--4`) are fine;
  - inflated or buzzword vocabulary, e.g., delve, crucial, pivotal, seamless, robust,
    leverage, landscape, realm, tapestry, intricate, comprehensive, groundbreaking,
    "plays a vital role";
  - constructions such as "not only ..., but also ...", "It's not X, it's Y",
    "Whether you ... or ...", and rhetorical questions;
  - lists of three by reflex, filler introductions ("It is important to note that",
    "In today's world"), and summary sentences that only repeat the paragraph
    ("In conclusion, ...", "Overall, ...");
  - bullet lists, bold text, and headings where running text belongs.
- **Active voice.** Name who acts: the developer, the end user, the tool, "we", "this chapter",
  or the authors of a cited work ("\textcite{Runeson2009} provide a checklist" instead of
  "A checklist is provided in~\cite{Runeson2009}").
- **Stylistic "we".** Use "we" whenever the student did something ("We implement a
  prototype", "We conducted interviews"), even though the student wrote the thesis alone. Do
  not use "I". Still keep the focus on the work rather than on the author: not every sentence
  needs "we".
- **Present tense**, unless there is a good reason for another tense (e.g., for the steps of a
  study that was conducted in the past).
- **Positive form.** State what is, not what is not ("usually came late", not "was not very
  often on time").
- **Paragraphs are the unit of composition.** One topic per paragraph; no single-sentence
  paragraphs. Begin each paragraph with a sentence that introduces its topic or provides the
  transition from the previous paragraph.
- **Transitions.** Connect sentences with conjunctive adverbs such as however, furthermore,
  moreover, subsequently, therefore, or for example. At the beginning of a sentence, a comma
  follows them; in the middle of a sentence, they are enclosed in commas. Do not start
  sentences with conjunctions such as "and", "but", or "while".
- **Oxford comma.** Always use it, as it helps reading: in a series of three or more items with
  a single conjunction, put a comma after each item except the last ("red, white, and blue").
- **Colons** follow a complete clause and introduce a list, an explanation, or a quotation.
- **Agreement.** The number of the subject determines the number of the verb.
- **Articles.** Use "a"/"an" and "the" wherever needed: "the" for specific things, "a"/"an" for
  non-specific ones, and no article when talking about things in general ("Developers write
  tests.").
- **Abbreviations** "e.g.," and "i.e.," are followed by a comma.
- **Abstract, introduction, and conclusion** follow the structure given in the template files.
  The introduction elaborates on the abstract instead of repeating its sentences, and the
  conclusion summarizes key insights instead of repeating the thesis.

## LaTeX conventions

- **One sentence per line** in the `.tex` files. This keeps diffs readable.
- **Language:** the main language is set by the class options in `main.tex` (the last of
  `ngerman,english`). Write in that language. The abstract is in English, the
  Kurzzusammenfassung in German.
- **Labels** use prefixes: `chap:`, `sec:`, `fig:`, `tab:`, `lst:`, `alg:`, `eq:`,
  `rq:` (research questions), `c:` (contributions). Reference with `\cref{...}`, or `\Cref{...}`
  at the beginning of a sentence. Never hard-code numbers such as "Figure 3".
- **Acronyms:** define them in `acronyms.tex` with `\newacronym{label}{SHORT}{long form}` and
  use `\gls{label}`, `\glspl{label}`, `\Gls{label}`. Do not use `\gls` in the abstract, in
  headings, or in captions, because the first use would be recorded there.
- **Research questions:** `\defRQ{question}{label}` in the introduction (or exposé motivation),
  `\refRQ{label}` to reference them, `\discussRQ{label}` to repeat them in the discussion.
- **Contributions:** `\begin{contributions} \item ... \label{c:label} \end{contributions}`,
  referenced with `\refC{label}`.
- **Findings:** `\finding[label]{text}` in the evaluation discussion.
- **Citations:** `\cite{key}`, or `\textcite{key}` if the authors are part of the sentence.
  Bibliography entries need complete data; add `doi` where available and `urldate` for web pages.
- **Quotes and units:** `\enquote{...}` for quotation marks, `\num{...}` and `\qty{...}{...}`
  (siunitx) for numbers and units.
- **Tables:** `booktabs` rules (`\toprule`, `\midrule`, `\bottomrule`), no vertical lines.
  Table captions above the table, figure captions below the figure.
- **Every figure and table** is referenced and explained in the text.
- **Notes:** use `\todo{...}` or `\todo[inline]{...}` for open points. Do not delete the
  student's TODO notes unless they are resolved.

## Structure of the thesis

Keep the overall order in `main.tex`: title page, abstract, Kurzzusammenfassung,
acknowledgments, table of contents and lists, acronyms, chapters, references, appendix,
declaration of AI use, declaration. Chapters may be renamed, split, merged, or removed (e.g.,
the optional requirements chapter) in agreement with the supervisor; update the thesis
structure at the end of the introduction accordingly.

The exposé (`document = expose`) is 3--4 pages and consists of the sections in `expose/`
followed by references and the lists of figures and tables. It has no abstract, table of
contents, acknowledgments, acronym list, appendix, or declarations.

## Before submission

Work through `docs/thesis-checklist.md` with the student. In particular: `mode = final` and
`make check` without problems (no `??`, no TODO notes, `appendix/b-latex-examples.tex`
removed), declaration of AI use complete, data availability described, and title page data
correct.
