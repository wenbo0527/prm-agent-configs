# code-review SOP · 代码评审（v1.1）

> **阶段**：06 开发执行
> **目标**：保证代码质量 + 知识共享

---

## 🎯 触发条件

- ✅ dev 完成代码 + 单元测试
- ✅ PR 创建
- ✅ 即将合并到 main

## 🛠️ 操作步骤（5 步）

### 第 1 步：review 前准备

```
reviewer 必看：
- [ ] PR 描述（改了什么 / 为什么）
- [ ] 关联的 TASK-ID
- [ ] 验收 Checklist
- [ ] 测试覆盖率
```

### 第 2 步：review 5 维度

| 维度 | 问题 |
|:--|:--|
| **正确性** | 代码逻辑是否对？边界 case？|
| **可读性** | 命名 / 注释 / 结构？|
| **可测试** | 单元测试覆盖 ≥ 80%？|
| **性能** | 有无明显性能问题？|
| **安全** | 有无注入 / 越权 / 泄漏？|

### 第 3 步：review 反馈分类

| 类别 | 标记 | 处理 |
|:--|:--|:--|
| **Blocker** | 必须改 | 不改不 merge |
| **Important** | 应该改 | dev 解释可豁免 |
| **Nitpick** | 可改可不改 | 记录 issue，下次清理 |
| **Praise** | 亮点 | 鼓励 |

### 第 4 步：review 礼仪

```
✅ 对事不对人
✅ 给具体建议（不是"改一下"，而是"改成 XX"）
✅ 解释 why（让 dev 学到东西）
✅ 及时 review（24h 内）
```

### 第 5 步：合并 + 闭环

```
合并流程：
1. dev 处理完所有 Blocker + Important
2. reviewer re-review
3. 通过 → squash merge
4. 任务 board update → done
5. 写闭环文档（如有学习点）
```

## ✅ 验收 Checklist

- [ ] 5 维度齐全？
- [ ] 反馈分 4 类（Blocker/Important/Nitpick/Praise）？
- [ ] 24h 内 review？
- [ ] 合并前 re-review？

## 🩸 反范式

- **LGTM 不看内容** → 漏掉 bug
- **只挑刺不鼓励** → dev 士气低
- **review 太慢**（> 24h）→ 阻塞 dev
- **不 re-review 就合并** → 漏改

## 🔗 相关链接

- 阶段：[06 开发执行](../../README.md#06-开发执行)
- 相关：[写+审分离硬规则](../../../templates/AGENTS.md.template)

---

*锁版守：5 维度 + 4 类反馈 + 24h review + re-review*