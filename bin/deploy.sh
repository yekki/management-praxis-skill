#!/usr/bin/env bash
# Deploy management-praxis skill to Claude Code skills directory
# Usage: bin/deploy.sh

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"
TARGET_DIR="$HOME/.claude/skills/management-praxis"

echo "源目录: $PROJECT_DIR"
echo "目标目录: $TARGET_DIR"

# 确保目标目录存在
mkdir -p "$TARGET_DIR"

# 同步文件（排除 git/开发文件，保留目标侧的运行时产物）
rsync -av --delete \
  --exclude='.git/' \
  --exclude='.omc/' \
  --exclude='.claude/' \
  --exclude='AGENTS.md' \
  --exclude='README.md' \
  --filter='P frameworks/' \
  --filter='P reports/' \
  "$PROJECT_DIR/" "$TARGET_DIR/"

echo ""
echo "部署完成 ✓"
echo "已同步到: $TARGET_DIR"
