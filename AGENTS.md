# AGENTS.md — Management Praxis Skill

开发指南：本文件描述 management-praxis-skill 的架构、文件职责和扩展方法。

## 核心架构

```
SKILL.md（入口与编排）
    ├── bin/mtools（工具数据来源 — 远程 API）
    ├── templates/（行业模板 — 匹配阶段参考）
    ├── methodology/（方法论 — 诊断和组合逻辑）
    └── references/（报告模板和质量规则）
```

**重要**：工具数据全部来自远程 API（`bin/mtools`），不存在本地工具库文件。不要在本地创建或维护 `frameworks/` 目录。

## 5阶段工作流

| 阶段 | 名称 | 核心输出 |
|------|------|---------|
| 1 | DIAGNOSIS — 问题诊断 | 结构化问题定义（类型/层次/紧迫度/约束） |
| 2 | MATCHING — 工具匹配 | 工具链推荐（主工具1-2个 + 辅助1-2个 + 验证0-1个） |
| 3 | APPLICATION — 引导应用 | 每个工具的填写模板和示范，逐工具推进 |
| 4 | INSIGHT — 洞察提炼 | 交叉验证发现，信心等级A/B/C，优先级P0/P1/P2 |
| 5 | REPORT — 报告生成 | Markdown 结构化报告 + HTML 可视化报告 |

## 文件职责和修改频率

### SKILL.md — 高频修改
Skill 主入口。定义顾问人格、工作流程、工具路由表、交互规则、报告结构。
修改场景：调整工作流逻辑、新增工具路由场景、修改报告格式、调整交互规则。

### bin/mtools — 低频修改
远程 API 客户端。封装 Bearer Token 认证，提供三个命令：
- `mtools domains` — 列出9大领域
- `mtools get <domain>` — 获取某领域全部工具
- `mtools search <keyword>` — 按关键词搜索工具

修改场景：API 地址变更、Token 更换、新增 API 命令。
注意：Token 硬编码在脚本中，修改时注意安全性。

### bin/deploy.sh — 极低频修改
用 rsync 将项目同步到 `~/.claude/skills/management-praxis/`。
自动排除：`.git/`、`.omc/`、`.claude/`、`AGENTS.md`、`README.md`。
自动保留目标侧：`frameworks/`（运行时缓存）、`reports/`（历史报告）。

### templates/*.md — 中频修改
4个行业模板，在工具匹配阶段（阶段2）优先参考匹配行业。
每个模板定义：行业特有场景、推荐工具链、注意事项。
修改场景：新增行业模板、更新行业最佳实践。

### methodology/problem-diagnosis.md — 低频修改
问题分类矩阵（战略层/运营层/人员层 × 方向/效率/增长/危机）。
诊断三步路径：定性判断 → 定位层次 → 匹配工具域。

### methodology/tool-combination.md — 低频修改
工具组合原则（输入-输出衔接、宏观到微观、分析到决策）。
经典工具链定义（战略规划全链条、质量改进链条等）。

### references/quality-rules.md — 极低频修改
质量标准定义：
- 信心等级：A级（多工具交叉验证）、B级（2个工具支持）、C级（单工具结论）
- 优先级：P0（立即行动）、P1（近期规划）、P2（中期准备）
- 工具数量规则：推荐3-5个，不超过6个

### references/report-template.html — 中频修改
HTML 可视化报告模板，基于 ECharts。内置图表类型：
- PEST 利好/利空分布柱状图
- 波特五力雷达图
- EFE 矩阵加权得分条形图
- SWOT 战略象限散点图
- 决策门控时间线卡片

### docs/quickstart.md — 低频修改
面向用户的快速上手指南。

## 扩展指南

### 新增行业模板

1. 在 `templates/` 创建 `<industry>.md`
2. 文件结构参考现有模板：
   ```markdown
   ---
   name: <行业名>行业模板
   ---
   # <行业名>行业 — 管理工具指南
   ## 行业特点
   ## 高频场景与工具链
   ## 行业注意事项
   ```
3. 在 `SKILL.md` 的"行业模板"表格中添加新行
4. 运行 `bin/deploy.sh` 部署

### 新增方法论文档

1. 在 `methodology/` 创建 `<topic>.md`
2. 在 `SKILL.md` 中引用新文档（在相关阶段说明处添加参考）
3. 运行 `bin/deploy.sh` 部署

### 新增 HTML 报告图表类型

1. 编辑 `references/report-template.html`
2. 在 ECharts 图表区添加新图表容器和初始化代码
3. 在 `SKILL.md` 阶段5（REPORT）说明新图表的触发条件和数据格式
4. 在现有图表代码旁添加注释，说明图表用途和数据占位符格式
5. 运行 `bin/deploy.sh` 部署

### 更新 API Token

1. 编辑 `bin/mtools`
2. 修改 `API_TOKEN` 变量值
3. 运行 `bin/deploy.sh` 部署（Token 会随脚本同步）

## 质量标准

### 工具推荐
- 数量：3-5个工具，不超过6个
- 结构：主工具（1-2）+ 辅助工具（1-2）+ 验证工具（0-1）
- 必须说明每个工具的选择理由和应用顺序

### 分析结论
- A级信心：至少2个工具交叉验证
- B级信心：2个工具支持
- C级信心：单一工具，建议补充验证

### 行动建议
- P0：必须立即行动，影响大且紧迫
- P1：近期（1-3个月）规划
- P2：中期（3-12个月）准备

## 部署流程

```bash
# 修改文件后
bin/deploy.sh

# 验证部署
ls ~/.claude/skills/management-praxis/
```

部署脚本使用 `rsync --delete`，目标目录会严格与源目录保持一致（排除文件除外）。

## 注意事项

- 不要在本地创建 `frameworks/` 目录，工具数据通过 `mtools` 实时从 API 获取
- 不要在 SKILL.md 中硬编码工具数据，始终通过 `mtools` 命令获取最新数据
- `reports/` 目录在目标侧保留，不要手动删除已生成的报告
- 本项目不包含 API 服务端代码，服务端由 management-praxis 项目维护
