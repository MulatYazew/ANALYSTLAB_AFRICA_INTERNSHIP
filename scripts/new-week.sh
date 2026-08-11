#!/usr/bin/env bash
# Create and check out a new week branch off an up-to-date main.
# Usage: ./scripts/new-week.sh <week-number> <topic-slug>
#   ./scripts/new-week.sh 05 feature-engineering
set -euo pipefail

if [[ $# -ne 2 ]]; then
  echo "Usage: $0 <week-number> <topic-slug>" >&2
  echo "Example: $0 05 feature-engineering" >&2
  exit 1
fi

week_num=$(printf "%02d" "$1")
topic_slug="$2"
branch="week${week_num}-${topic_slug}"

git checkout main
git pull origin main
git checkout -b "$branch"

echo "Created and checked out '$branch' from up-to-date main."
