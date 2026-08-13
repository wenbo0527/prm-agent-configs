<!-- 🏆 精选项目（2026-08-13 标记） -->
> 🏆 **本仓已被选为 [wenbo0527](https://github.com/wenbo0527) 个人主页 6 大核心项目之一**

# prm-agent-configs · 产品需求管理全流程 agent 配置

[![License: MIT](https://img.shields.io/github/license/wenbo0527/prm-agent-configs?color=blue)](LICENSE)
[![Language](https://img.shields.io/badge/language-中文-red.svg)]()
[![Stars](https://img.shields.io/github/stars/wenbo0527/prm-agent-configs?style=social)]()
[![Last Commit](https://img.shields.io/github/last-commit/wenbo0527/prm-agent-configs)]()
[![Commit Since v1.0](https://img.shields.io/github/commits-since/wenbo0527/prm-agent-configs/v1.0.0)]()
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)
[![GH Actions](https://img.shields.io/badge/GH%20Actions-脱敏扫描-success)](.github/workflows/desensitization.yml)

> **聚焦**：从需求采集 → PRD → 派工 → 验收 → 上线 的完整多 agent 协作配置
> **形态**：可 fork 可改的模板与 SOP 库
> **协议**：MIT

---

## 🎯 这是什么

一套**产品需求管理（Product Requirement Management）全流程**的 AI agent 团队配置：

- 📋 **模板**：`templates/` 提供从 0 到 1 搭建 agent 角色所需的 6 件套（含 PM 专属）
- 🛠️ **技能 SOP**：`skills/` 覆盖需求链 9 个阶段的核心技能（按需取用）
- 👥 **角色阵型**：`roles/` 提供 5 人 / 3 人 / 1 人三种典型 PM 团队阵型
- 🩸 **教训范式**：`lessons/` 沉淀 PM 协作常见踩坑（派单 / 反思 / 边界 / 反糊弄）
- 📚 **文档**：`docs/` 包含架构图 / 协作模型 / 快速开始 / 脱敏 SOP

## 🚀 5 分钟开始

```bash
# 1. Fork 或直接 git clone
git clone https://github.com/wenbo0527/prm-agent-configs.git
cd prm-agent-configs

# 2. 选你的团队阵型（5 人 / 3 人 / 1 人）
cat roles/README.md

# 3. 复制模板到你的 agent workspace
cp templates/AGENTS.md.template <你的 agent workspace>/AGENTS.md
cp templates/SOUL.md.template <你的 agent workspace>/SOUL.md
# ... 6 件套按需

# 4. PM 角色专属模板（重要）
ls templates/PM专属/

# 5. 读快速开始
cat docs/快速开始.md
```

## 📂 目录结构

```
prm-agent-configs/
├── README.md 你在这里
├── LICENSE MIT
├── CONTRIBUTING.md 如何贡献
├── templates/  ① 角色模板（6 件套通用 + PM 专属 3 件）
├── skills/     ② 需求链 skill SOP（按 9 阶段分类）
├── roles/      ③ 团队阵型（5/3/1 人）
├── lessons/    ④ PM 协作教训（7 大范式）
└── docs/       ⑤ 文档（架构/协作/脱敏/快速开始）
```

## 🎯 适合谁

- 🧑‍💼 **产品经理**：想用 AI agent 提效需求管理流程
- 👨‍💻 **独立开发者**：一个人就是一支队伍，需要结构化产出
- 🏢 **小团队 leader**：3-5 人想用 agent 协作，但不想从零造模板
- 🛡️ **架构师**：关心 agent 团队的边界 / 派工 / 验收规范

## 💡 核心设计理念

1. **PM 是核心**：本仓聚焦 PM 角色，PM 自治派工 + 边界守
2. **写+审分离**：写代码的 agent ≠ 审代码的 agent（hard rule）
3. **派单不越级**：PM 只派给子角色，不直接派执行者
4. **反思≠实证**：任何"已完成"必带 grep / cat / stat 实证
5. **反冗长**：3 段式汇报 = 我在做什么 + 关键进展 + 决策点

## 📜 License

MIT — 自由使用、修改、商用。
详见 [LICENSE](LICENSE)。

## 🙏 致谢

本仓配置范式来自 [OpenClaw](https://github.com/openclaw/openclaw) 多 agent 协作系统，沉淀自真实生产环境的 PM 协作经验。

---

*契约之神建议：先 fork，再按 roles/ 选阵型，再按 templates/ 装骨架，最后按 lessons/ 学教训。一步一步来。*