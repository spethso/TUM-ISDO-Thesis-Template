#!/bin/sh
# Checks the LaTeX log file for problems that should not remain in the thesis:
#   - LaTeX errors
#   - undefined references and citations (shown as ?? in the PDF)
#   - overfull boxes that stick out more than 1pt
#   - leftovers reported in the final version (TODO notes, template examples)
# Usage: scripts/check-log.sh [main.log]   (run `latexmk` first)
# Exit code: 0 if no problems were found, 1 otherwise.

log="${1:-main.log}"
if [ ! -f "$log" ]; then
  echo "Log file '$log' not found. Build the document first, e.g., with latexmk."
  exit 2
fi

problems=0

report() {
  # $1: title, $2: lines found
  if [ -n "$2" ]; then
    echo "== $1"
    printf "%s\n" "$2" | sed "s/^/   /"
    echo
    problems=1
  fi
}

report "LaTeX errors" "$(grep -E '^! |^[^ ]+\.(tex|aux|sty|cls|bbl|toc):[0-9]+: ' "$log")"

report "Undefined references or citations" "$(grep -E \
  '^LaTeX Warning: (Reference|Citation|Hyper reference) .* undefined|^LaTeX Warning: There were undefined|^Package biblatex Warning: Please \(re\)run Biber' \
  "$log")"

report "Overfull boxes (more than 1pt)" "$(grep -E '^Overfull \\[hv]box \([0-9.]+pt too (wide|high)\)' "$log" \
  | awk '{ v = $3; gsub(/[(pt]/, "", v); if (v + 0 > 1) print }')"

report "Leftovers in the final version" "$(grep -E '^Package tumthesis Warning' "$log")"

if [ "$problems" -eq 0 ]; then
  echo "No problems found in $log."
fi
exit "$problems"
