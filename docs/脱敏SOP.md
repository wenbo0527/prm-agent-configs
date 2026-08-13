# docs/脱敏SOP.md · 推前必读

> **作用**：本仓为公开 GitHub 仓，提交前必须脱敏
> **锁版守**：违反脱敏红线 = 反思≠实证，必修复后才能推

---

## 🚨 脱敏红线（必避）

### ❌ 绝对不能出现

| 类型 | 例子 | 替换为 |
|:--|:--|:--|
| **真实姓名** | 张三、李四 | `<user>` 或 `你的称呼` |
| **真实邮箱** | xxx@example.com | `<email>` 或 `your-email@example.com` |
| **服务器 IP** | 192.168.1.100 / 8.8.8.8 | `<server-ip>` 或 `<your-server-ip>` |
| **服务器账号** | root / admin | `<username>` |
| **数据库连接串** | postgres://user:pass@host | `<db-connection-string>` |
| **API token** | sk-xxx / gho-xxx | `<api-token>` |
| **飞书 open_id** | ou_xxx | `<feishu-open-id>` |
| **公司名 / 项目代号** | 我的公司、XX 项目 | `你的公司`、`你的项目` |

### ❌ 内部代号（必脱敏）

| 类型 | 例子 | 替换为 |
|:--|:--|:--|
| **任务 ID** | TASK-20260813-001 | `[TASK-XXX]` |
| **候选号** | 候选 #123 | `[候选 #XXX]` |
| **内部 bug 号** | BUG-456 | `[BUG-XXX]` |
| **团队内部代号** | 派蒙、钟离、Nick | `[监控角色]`、`[架构角色]`、`[情报角色]` |
| **内部系统名** | 问小数 / 数字社区 | `问答系统` / `社区平台` |
| **教训文档名** | MEMORY-lessons.md | `lessons-catalog.md` |
| **agent workspace 路径** | ~/.openclaw/workspace-agents/zhongli | `<agent-workspace>` |

## 🛠️ 脱敏工具

### 自动检查

```bash
# 提交前自动检查
git diff --cached | grep -E "(ou_|sk-|gho-|192\.168|10\.|password|TASK-2026)" && echo "❌ 发现敏感信息，请脱敏" || echo "✅ 干净"

# 完整敏感关键词扫描
grep -rE "(ou_|sk-|gho-|192\.168|10\.0|TASK-202[0-9]|候选 #[0-9]{3})" --include="*.md" --include="*.template" .
```

### 手动 Review Checklist

- [ ] 没有任何真实姓名 / 邮箱 / IP？
- [ ] 没有任何 API token / 数据库连接串？
- [ ] 没有任何任务 ID / 候选号？
- [ ] 没有任何内部项目代号？
- [ ] 没有任何 agent workspace 路径？
- [ ] USER.md.template 里的示例都用 `<user>` 占位？

## 📋 脱敏 SOP（提交前必走）

### 步骤 1：写文件时用占位符

```markdown
# ✅ 正确：用占位符
服务器 IP：`<your-server-ip>`
用户名：`<your-username>`

# ❌ 错误：用真实信息
服务器 IP：192.168.1.100
用户名：root
```

### 步骤 2：提交前自动检查

```bash
# 1. 查看 diff
git diff --cached

# 2. 跑脱敏检查脚本
bash scripts/desensitization-check.sh  # 待补

# 3. grep 敏感关键词
grep -rE "(ou_|sk-|gho_)" --include="*.md" .
```

### 步骤 3：手动 review

- 重点检查：USER.md / 任何含 IP 的文档 / 任何含真实姓名的文档
- 重点检查：教训文件中的具体人物 / 项目代号

### 步骤 4：commit

```bash
git add .
git commit -m "feat: 新增 XX 模板

✅ 已脱敏：
- 真实姓名 → <user>
- IP → <server-ip>
- 任务 ID → [TASK-XXX]"
```

## 🩸 脱敏违例活教材

### 案例 1：IP 泄漏

```
原文：服务器 IP：192.168.1.100
违例：内部 IP 暴露给公网
修复：服务器 IP：<your-server-ip>
```

### 案例 2：姓名泄漏

```
原文：张三说这个方案不行
违例：内部人员姓名暴露
修复：<user> 说这个方案不行
```

### 案例 3：任务 ID 泄漏

```
原文：TASK-20260813-001 已完成
违例：暴露内部任务追踪系统结构
修复：[TASK-XXX] 已完成
```

### 案例 4：项目代号泄漏

```
原文：问小数的生产部署已闭环
违例：暴露内部产品名
修复：问答系统的生产部署已闭环
```

## 📊 脱敏自检（每次提交前）

- [ ] 没有任何真实姓名 / 邮箱？
- [ ] 没有任何 IP / 账号 / token？
- [ ] 没有任何任务 ID / 候选号？
- [ ] 没有任何内部项目代号？
- [ ] 没有任何 agent workspace 路径？
- [ ] 跑过 grep 敏感关键词检查？

---

*脱敏闭环：v1.0 · 9 类红线 + 4 步骤 SOP + 4 类违例活教材 + 自动检查工具*