#!/usr/bin/env bash
set -euo pipefail

REPO_URL="https://raw.githubusercontent.com/jattanjie21/plan-and-build-skill/main"
SKILL_DIR="${HOME}/.claude/skills/plan-and-build"
SKILL_FILE="${SKILL_DIR}/SKILL.md"

echo "Updating plan-and-build skill..."

mkdir -p "${SKILL_DIR}"

if curl -fsSL "${REPO_URL}/SKILL.md" -o "${SKILL_FILE}.tmp"; then
    mv "${SKILL_FILE}.tmp" "${SKILL_FILE}"
    VERSION=$(grep -E '^version:' "${SKILL_FILE}" | head -1 | awk '{print $2}' || echo "unknown")
    echo "Success: SKILL.md updated to version ${VERSION}"
    echo "Installed at: ${SKILL_FILE}"
    echo ""
    echo "Restart Claude Code for changes to take effect."
else
    rm -f "${SKILL_FILE}.tmp"
    echo "Failure: could not download SKILL.md from ${REPO_URL}/SKILL.md" >&2
    echo "Check your network connection and try again." >&2
    exit 1
fi
