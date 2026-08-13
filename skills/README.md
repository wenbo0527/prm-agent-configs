# skills/ · 需求链精选 skill SOP（v1.1）

> **覆盖**：产品需求管理全流程 9 阶段
> **数量**：15 个精选 skill SOP（按阶段分布）
> **原则**：每个 SOP 必含触发条件 + 操作步骤 + 验收 Checklist + 反范式

---

## 📂 按 9 阶段分类

| 阶段 | 数量 | SOP |
|:--|:--|:--|
| **01 需求采集** | 3 | [brainstorming](01-需求采集/brainstorming/SOP.md) · [clarification-checklist](01-需求采集/clarification-checklist/SOP.md) · [requirement-understanding](01-需求采集/requirement-understanding/SOP.md) |
| **02 需求定义** | 2 | [prd-generation](02-需求定义/prd-generation/SOP.md) · [reqdef-skill](02-需求定义/reqdef-skill/SOP.md) |
| **03 需求拆解** | 2 | [requirement-breakdown](03-需求拆解/requirement-breakdown/SOP.md) · [planning-task-breakdown](03-需求拆解/planning-task-breakdown/SOP.md) |
| **04 交互设计** | 2 | [interaction-designer](04-交互设计/interaction-designer/SOP.md) · [design](04-交互设计/design/SOP.md) |
| **05 任务派发** | 2 | [agent-task-board](05-任务派发/agent-task-board/SOP.md) · [task-canvas-analysis](05-任务派发/task-canvas-analysis/SOP.md) |
| **06 开发执行** | 2 | [code-review](06-开发执行/code-review/SOP.md) · [claude-code-orchestrator](06-开发执行/claude-code-orchestrator/SOP.md) |
| **07 质量保障** | 2 | [diagnostician](07-质量保障/diagnostician/SOP.md) · [browser-testing-devtools](07-质量保障/browser-testing-devtools/SOP.md) |
| **08 demo 与上线** | 1 | [demo-generation](08-demo与上线/demo-generation/SOP.md) |
| **09 文档沉淀** | 1 | [documentation-and-adrs](09-文档沉淀/documentation-and-adrs/SOP.md) |

## 🎯 使用方式

```bash
# 1. 选你当前阶段的 SOP
ls skills/01-需求采集/  # 比如正在需求采集

# 2. 读 SOP 文件
cat skills/01-需求采集/brainstorming/SOP.md

# 3. 按 SOP 操作（触发条件 → 步骤 → 验收 → 反范式）
```

## 📋 SOP 文件结构（统一模板）

每个 SOP 必含 5 部分：

1. **触发条件** — 何时用这个 skill
2. **操作步骤** — 3-7 步标准化流程
3. **验收 Checklist** — 怎么算"做对了"
4. **反范式** — 常见错误 + 修复
5. **相关链接** — 与其他 SOP 的关系

## 🔗 与其他仓的关系

- **OpenClaw 原 skill**：`~/.openclaw/skills/<skill-name>/SKILL.md` 是源头
- **本仓 SOP**：是基于 OpenClaw skill 的"操作范式"提炼
- **使用建议**：以 SOP 为主，OpenClaw skill 为辅

---

*锁版守：SOP 必含 5 部分 + 按 9 阶段分类 + 不重复 OpenClaw skill 内容*