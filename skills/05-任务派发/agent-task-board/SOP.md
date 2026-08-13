# agent-task-board SOP · 多 agent 任务板（v1.1）

> **阶段**：05 任务派发
> **目标**：把子任务派给对应 agent，闭环跟踪

---

## 🎯 触发条件

- ✅ WBS 已锁定
- ✅ 即将进入执行
- ✅ 跨 agent 协作

## 🛠️ 操作步骤（5 步）

### 第 1 步：任务板初始化

```
task_board 创建（用 task_tool.py 或飞书多维表格）
字段：
- TASK-ID
- 标题
- 描述
- 派单人（PM）
- 责任 agent
- 优先级（P0/P1/P2/P3）
- 状态（pending / in_progress / done / blocked）
- 创建时间 / 截止时间
- 验收 Checklist
```

### 第 2 步：派工 5 件套

```markdown
## 任务派发（必带 5 件）

1. **TASK-ID**：`TASK-YYYYMMDD-XXXX`
2. **子角色**：`dev` / `qa` / `产品` / `doc`
3. **任务标题**：`[明确动作]`
4. **验收标准**：`[具体 Checklist]`
5. **截止时间**：`YYYY-MM-DD HH:MM`
```

**反范式**：派单越级（PM → dev1 而非 dev lead）→ 见 [派单SOP](../../../lessons/派单SOP-不越级.md)

### 第 3 步：5min ack + 二次实证

```
派单后必跑：
1. task_tool.py update --id TASK-X --assignee <role> --status in_progress
2. task_tool.py get --id TASK-X  # 必跑二次实证
3. echo "确认 assignee 实际值 = <role>"

5min 内必 ack："收到，已派给 dev lead，预计 X 完成"
```

**反范式**：声明≠落地 → 见 [行动≠落地](../../../lessons/行动≠落地.md)

### 第 4 步：跟踪 4 节奏

| 节奏 | 动作 |
|:--|:--|
| **每日** | 看 in_progress 任务 ≥ 1 次 |
| **24h 未推进** | 戳破（提醒 agent） |
| **48h 阻塞** | 升级 PM → CTO |
| **任务完成** | 验收 + 闭环 |

### 第 5 步：验收 + 闭环

```
任务完成时：
1. 派单人验收（cross-check ≥ 2 维度）
2. task_tool.py update --status done
3. task_tool.py get 二次实证
4. 写闭环文档（含关键结果）
5. 更新 task board 状态
```

## ✅ 验收 Checklist

- [ ] 任务板字段齐全？
- [ ] 派工 5 件套？
- [ ] update 后必 get 实证？
- [ ] 24h 戳破机制？
- [ ] 闭环文档必写？

## 🩸 反范式

- **派单越级** → PM 替 lead 派工
- **声明≠落地** → 派了但没真的派
- **24h 不戳破** → 任务漂移
- **不写闭环** → 团队没记忆

## 🔗 相关链接

- 前一步：[planning-task-breakdown SOP](../../03-需求拆解/planning-task-breakdown/SOP.md)
- 相关：[派单SOP-不越级](../../../lessons/派单SOP-不越级.md)
- 相关：[行动≠落地](../../../lessons/行动≠落地.md)
- 阶段：[05 任务派发](../../README.md#05-任务派发)

---

*锁版守：5 步法 + 派工 5 件套 + 二次实证 + 24h 戳破 + 闭环必写*