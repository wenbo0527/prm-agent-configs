#!/bin/bash
# scripts/desensitization-check.sh
# 脱敏红线扫描脚本 - 本地预检版
# 对应 GitHub Actions: .github/workflows/desensitization.yml
# 用法: bash scripts/desensitization-check.sh

set -u

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# 排除文件清单（这些文件含必要的反例样本）
EXCLUDE_FILES=(
  "docs/脱敏SOP.md"
  "templates/TOOLS.md.template"
  "lessons/反冗长-3段式汇报.md"
  "lessons/行动≠落地.md"
)

# 排除目录
EXCLUDE_DIRS=(
  ".git"
  ".github"
  "scripts"
)

# 命中计数器
HIT=0

# 输出函数
hit_msg() {
  echo -e "${RED}❌ $1${NC}"
  HIT=$((HIT+1))
}

# 通用 grep 函数（带排除）
sensitive_grep() {
  local pattern="$1"
  local label="$2"
  local extra_exclude="${3:-}"

  local cmd="grep -rE \"$pattern\" --include='*.md' --include='*.template'"

  for dir in "${EXCLUDE_DIRS[@]}"; do
    cmd="$cmd --exclude-dir=$dir"
  done

  cmd="$cmd ."

  local result
  result=$(eval "$cmd" 2>/dev/null | grep -v "docs/脱敏SOP.md" | grep -v "templates/TOOLS.md.template" | grep -v "lessons/反冗长-3段式汇报.md" | grep -v "lessons/行动≠落地.md")

  if [ -n "$result" ]; then
    hit_msg "$label"
    echo "$result" | sed 's/^/    /'
  fi
}

echo "::group::🔍 脱敏红线扫描开始"
echo "扫描目录: $(pwd)"
echo ""

# 1. 飞书 open_id
echo "▸ 检查飞书 open_id..."
sensitive_grep "ou_[a-f0-9]{16,}" "发现飞书 open_id"

# 2. GitHub / API token
echo "▸ 检查 API token..."
sensitive_grep "(sk-[a-zA-Z0-9]{20,}|gho_[a-zA-Z0-9]{20,}|ghp_[a-zA-Z0-9]{20,})" "发现 API token"

# 3. 真实 IP
echo "▸ 检查真实 IP..."
sensitive_grep "(192\.168\.[0-9]|10\.0\.[0-9]|118\.196\.79)" "发现真实 IP"

# 4. 真实姓名（中文）
echo "▸ 检查真实姓名（中文）..."
sensitive_grep "(文博|张三|李四)" "发现真实姓名"

# 5. 真任务 ID（长哈希格式）
echo "▸ 检查真任务 ID（长哈希格式）..."
sensitive_grep "TASK-202[0-9]{4}-[A-Z0-9]{6,}" "发现真任务 ID"

# 6. 候选号
echo "▸ 检查候选号..."
sensitive_grep "候选 #[0-9]{3}" "发现内部候选号"

echo ""
echo "::endgroup::"

if [ $HIT -gt 0 ]; then
  echo -e "${RED}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
  echo -e "${RED}❌ 脱敏扫描失败：发现 $HIT 处敏感信息${NC}"
  echo -e "${RED}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
  echo ""
  echo -e "${YELLOW}修复指南：${NC}"
  echo "  1. 查看 docs/脱敏SOP.md"
  echo "  2. 替换为占位符："
  echo "     - 真实姓名 → <user>"
  echo "     - IP → <server-ip>"
  echo "     - token → <api-token>"
  echo "     - 任务 ID → [TASK-XXX]"
  echo "     - 候选号 → [候选 #XXX]"
  echo "  3. 重新运行: bash scripts/desensitization-check.sh"
  exit 1
fi

echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}✅ 脱敏扫描通过：无真实姓名/IP/token/任务 ID/项目代号${NC}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
exit 0