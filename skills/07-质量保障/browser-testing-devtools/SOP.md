# browser-testing-devtools SOP · 浏览器测试（v1.1）

> **阶段**：07 质量保障
> **目标**：用浏览器 + DevTools 做端到端测试

---

## 🎯 触发条件

- ✅ Web 应用上线前
- ✅ 关键流程回归
- ✅ 跨浏览器兼容验证
- ✅ 性能问题排查

## 🛠️ 操作步骤（5 步）

### 第 1 步：测试用例设计

```
每个用例：
- 场景：[用户做什么]
- 预期：[看到什么 / 得到什么]
- 验证：[用 curl / 截图 / DevTools]

反范式：测试 = 随便点 → 漏关键路径
```

### 第 2 步：浏览器多端验证

```
必测浏览器：
- [ ] Chrome（最新版）
- [ ] Safari（如目标用户有 Mac）
- [ ] Firefox（部分企业）
- [ ] 移动端浏览器（iOS Safari / Android Chrome）

工具：BrowserStack / 真实设备 / Chrome DevTools Device Mode
```

### 第 3 步：DevTools 关键检查

| Tab | 检查项 |
|:--|:--|
| **Elements** | DOM 结构 / 样式 |
| **Console** | JS 错误 / warning |
| **Network** | 请求耗时 / 失败 |
| **Performance** | 首屏 / 交互性能 |
| **Application** | localStorage / cookie / 缓存 |
| **Lighthouse** | 性能 / 可访问性 / SEO / 最佳实践 |

### 第 4 步：自动化测试（如适合）

| 工具 | 适用 |
|:--|:--|
| **Playwright** | 现代 / 跨浏览器 |
| **Puppeteer** | Chrome 专项 |
| **Cypress** | E2E + 调试友好 |
| **Selenium** | 老牌 / 多语言 |

**反范式**：所有测试都手动 → 不可持续

### 第 5 步：测试报告

```markdown
# 测试报告 · YYYY-MM-DD

## 测试范围
- [场景 1]
- [场景 2]

## 测试结果
| 场景 | Chrome | Safari | 备注 |
|:--|:--|:--|:--|
| 场景 1 | ✓ | ✓ | 正常 |
| 场景 2 | ⚠ | ✓ | Safari 字体问题 |

## 性能
- 首屏：2.3s
- LCP：1.8s
- Lighthouse：92

## Bug 清单
- B1：[描述]
- B2：[描述]
```

## ✅ 验收 Checklist

- [ ] 测试用例 ≥ 5 个？
- [ ] 多浏览器覆盖？
- [ ] DevTools 6 tab 都查？
- [ ] 测试报告归档？

## 🩸 反范式

- **只测 Chrome** → Safari 用户崩
- **只看 happy path** → 漏边界
- **不测性能** → 上线崩

## 🔗 相关链接

- 阶段：[07 质量保障](../../README.md#07-质量保障)

---

*锁版守：5 步法 + 多浏览器 + DevTools 6 tab + 自动化可选*