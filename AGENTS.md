# AGENTS.md — Management Praxis

## 项目概述

Management Praxis 是一个 Claude Code Skill，将204个经典管理工具编码为 AI 驱动的管理分析引擎。

## 核心架构

```
SKILL.md（编排层）
  ├── frameworks/（知识层：204个工具）
  ├── templates/（行业层：预设工具链）
  ├── methodology/（方法论层：诊断+组合）
  └── references/（输出层：报告模板+质量规则）
```

## 文件职责

| 文件/目录 | 职责 | 修改频率 |
|-----------|------|---------|
| `SKILL.md` | 工作流编排、路由逻辑、交互规则 | 中（功能迭代时） |
| `frameworks/*.md` | 204个工具的内容 | 低（知识稳定） |
| `templates/*.md` | 行业预设工具链 | 中（新增行业时） |
| `methodology/*.md` | 问题诊断和工具组合策略 | 低 |
| `references/report-template.html` | HTML报告模板 | 中（样式调整时） |
| `references/quality-rules.md` | 质量标准 | 低 |
| `reports/` | 生成的报告 | 高（每次分析产出） |

## 工作流程

5 个阶段严格按序执行：

1. **DIAGNOSIS**（问题诊断）→ 读取 `methodology/problem-diagnosis.md`
2. **MATCHING**（工具匹配）→ 读取对应 `frameworks/*.md` + `templates/*.md`
3. **APPLICATION**（引导应用）→ 逐工具展开，参考 `methodology/tool-combination.md`
4. **INSIGHT**（洞察提炼）→ 参考 `references/quality-rules.md`
5. **REPORT**（报告生成）→ 使用 `references/report-template.html`

## 编码规范

### 工具内容格式（frameworks/）

每个工具遵循统一结构：
```markdown
## X.X 工具名称（英文名/别称）

**核心概念**：[定义、起源、提出者]

**使用步骤/方法**：[操作流程]

**适用场景**：[什么情况下用]
```

### 行业模板格式（templates/）

```markdown
### 场景 N：[场景名称]
**问题**：[一句话描述]
\`\`\`
工具1(编号) → 工具2(编号) → 工具3(编号)
\`\`\`
**重点关注**：[行业特有的注意事项]
```

### HTML 报告

- 使用 ECharts 5.x 做可视化
- 暗色主题（`--bg: #0a0a0f`）
- 响应式布局（768px 断点）
- 图表类型：雷达图（五力）、条形图（EFE）、堆叠柱状图（PEST）、散点图（SWOT）

## 扩展指南

### 新增工具

1. 在对应 `frameworks/*.md` 中按编号顺序添加
2. 遵循现有格式（核心概念 + 使用步骤 + 适用场景）
3. 更新 `SKILL.md` 中的场景-工具路由表（如果新工具属于常见场景）

### 新增行业模板

1. 在 `templates/` 下创建 `{industry}.md`
2. 包含 5-6 个常见场景，每个场景配工具链
3. 底部添加行业特有注意事项
4. 更新 `SKILL.md` 行业模板表格

### 新增图表类型

1. 在 `references/report-template.html` 中添加图表占位
2. 使用 ECharts 配置，保持暗色主题一致
3. 添加 resize 监听

## 质量标准

- 每次分析推荐 3-5 个工具（不堆砌）
- 每个发现标注信心等级（A/B/C）
- 行动建议必须有优先级（P0/P1/P2）
- 工具之间必须有明确的输入-输出衔接
- 报告必须通过 So What 检验（见 `references/quality-rules.md`）
