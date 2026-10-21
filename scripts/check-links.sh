#!/usr/bin/env bash
# Usage: scripts/check-links.sh [DIR]
# Checks every Markdown link under DIR (default: the repo root, i.e. this
# script's parent's parent, regardless of the current directory).
# Skips dot-directories (.git, .github, .superpowers, ...) and docs/superpowers.
# Output: one line per link, "STATUS<TAB>FILE<TAB>URL", STATUS in
#   OK | DEAD | SOFT404 | MISSING. Exit 0 iff every line is OK, else 1.
# Notes: links are extracted with a regex, so links inside code fences are
# checked too, and URLs containing ")" are truncated. Link titles
# ([x](url "title")) are dropped; #fragments are stripped.
set -u
DIR="${1:-$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)}"
TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT

check_http() {  # $1=file $2=url
  local body="$TMP/body.$$.$RANDOM" code title st=OK
  code=$(curl -sL -o "$body" -w '%{http_code}' --max-time 20 -A 'Mozilla/5.0' "$2" 2>/dev/null) || code=000
  if [ "$code" != 200 ]; then st=DEAD
  else
    title=$(tr '\n\r' '  ' < "$body" | grep -ioE '<title[^>]*>[^<]*' | head -1)
    printf '%s' "$title" | grep -qiE '(sign in|log in|not found|404)' && st=SOFT404
  fi
  rm -f "$body"
  printf '%s\t%s\t%s\n' "$st" "$1" "$2"   # single write keeps lines intact
}
export -f check_http; export TMP

: > "$TMP/http"; : > "$TMP/out"
while IFS= read -r -d '' f; do
  grep -oE '\]\([^)]+\)' "$f" | sed -E 's/^\]\(//; s/\)$//' | while IFS= read -r raw; do
    url="${raw%% *}"; url="${url%%#*}"            # drop title and #fragment
    case "$url" in ''|mailto:*) continue ;; esac
    case "$url" in
      http://*|https://*) printf '%s\t%s\n' "$f" "$url" >> "$TMP/http" ;;
      *://*) continue ;;
      *) if [ -e "$(dirname "$f")/$url" ]; then st=OK; else st=MISSING; fi
         printf '%s\t%s\t%s\n' "$st" "$f" "$url" >> "$TMP/out" ;;
    esac
  done
done < <(find "$DIR" \( -name '.*' -o -path '*/docs/superpowers' \) -not -path "$DIR" -prune -o -name '*.md' -type f -print0)

tr '\n' '\0' < "$TMP/http" | xargs -0 -P 8 -I{} bash -c 'IFS=$'"'"'\t'"'"' read -r f u <<< "$1"; check_http "$f" "$u"' _ {} >> "$TMP/out"

cat "$TMP/out"
! grep -qv '^OK	' "$TMP/out"
