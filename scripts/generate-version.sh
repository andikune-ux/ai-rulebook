#!/usr/bin/env bash
set -euo pipefail
BASE_YEAR=2026
BASE_MONTH=11
BASE_VERSION=1
MANUAL_MAJOR="${MANUAL_MAJOR:-}"
TZ_NAME="${TZ_NAME:-Asia/Jakarta}"
YEAR=$(TZ="$TZ_NAME" date +%Y)
MONTH=$((10#$(TZ="$TZ_NAME" date +%m)))
DAY=$((10#$(TZ="$TZ_NAME" date +%d)))
if [ -n "$MANUAL_MAJOR" ]; then
  MAJOR="$MANUAL_MAJOR"
else
  MONTHS_SINCE=$(( (YEAR - BASE_YEAR) * 12 + (MONTH - BASE_MONTH) ))
  MAJOR=$(( BASE_VERSION + MONTHS_SINCE ))
fi
RUN="${GITHUB_RUN_NUMBER:-$(git rev-list --count HEAD 2>/dev/null || echo 1)}"
TAG="v.${MAJOR}.${DAY}.${RUN}"
VERSION_NAME="${MAJOR}.${DAY}.${RUN}"
VERSION_CODE="${RUN}"
{
  echo "tag=${TAG}"
  echo "version_name=${VERSION_NAME}"
  echo "version_code=${VERSION_CODE}"
} >> "${GITHUB_OUTPUT:-/dev/stdout}"
echo "📦 Versi: ${TAG}"
