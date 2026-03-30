# Management Praxis Skill

204个经典管理工具实战顾问 — Claude Code Skill

## 功能

- 诊断管理问题，从204个工具中精准匹配3-5个工具组合
- 逐步引导应用，提供操作模板和填写提示
- 生成 Markdown + HTML 可视化分析报告
- 内置4个行业模板（SaaS、制造业、零售、专业服务）

## 安装

```bash
git clone https://github.com/yekki/management-praxis-skill.git
cp -r management-praxis-skill ~/.claude/skills/management-praxis
```

或使用部署脚本：

```bash
bin/deploy.sh
```

## 项目结构

```
management-praxis-skill/
├── SKILL.md                    # Skill 主入口，定义顾问人格、工作流程和交互规则
├── bin/
│   ├── mtools                  # API 客户端脚本，封装远程工具库调用
│   └── deploy.sh               # 部署脚本，同步项目到 ~/.claude/skills/management-praxis/
├── templates/                  # 行业模板，匹配阶段优先参考
│   ├── saas.md                 # SaaS/软件行业工具链
│   ├── manufacturing.md        # 制造业工具链
│   ├── retail.md               # 零售/消费行业工具链
│   └── professional-services.md # 专业服务行业工具链
├── methodology/                # 方法论文档，支撑诊断和工具组合逻辑
│   ├── problem-diagnosis.md    # 问题分类、定位和诊断框架
│   └── tool-combination.md     # 工具组合策略和经典工具链
├── references/                 # 参考资源
│   ├── report-template.html    # HTML 可视化报告模板（基于 ECharts）
│   └── quality-rules.md        # 质量规则：信心等级、优先级标准
└── docs/
    └── quickstart.md           # 快速上手指南
```

### 各目录职责

| 目录/文件 | 职责 |
|-----------|------|
| `SKILL.md` | Skill 核心，定义5阶段工作流（诊断→匹配→应用→洞察→报告）、工具路由表、交互规则 |
| `bin/mtools` | 远程 API 客户端，通过 Bearer Token 调用 `mtools.yekki.top` 获取工具数据 |
| `bin/deploy.sh` | 用 rsync 将项目同步到 `~/.claude/skills/management-praxis/` |
| `templates/` | 4个行业预设工具链，在工具匹配阶段优先参考匹配行业 |
| `methodology/` | 问题诊断框架和工具组合策略，供 SKILL.md 引用 |
| `references/report-template.html` | 含 ECharts 图表的 HTML 报告模板，生成交互式可视化报告 |
| `references/quality-rules.md` | 信心等级（A/B/C）和优先级（P0/P1/P2）定义 |

## 使用方式

激活 Skill 后，直接描述管理问题即可启动5阶段分析流程。

**标准模式**：描述问题 → 顾问诊断 → 确认工具链 → 逐步应用 → 生成报告

**快速模式**：说"快速分析" → 跳过追问，直接给出工具和关键分析

**指定工具**：说"用SWOT分析" → 直接进入指定工具的引导应用

## 工具库（204个 × 9大领域）

| 领域 | 工具数 | API domain | 典型场景 |
|------|--------|------------|----------|
| 战略管理 | 18 | `strategic` | 企业定位、竞争分析、战略选择 |
| 领导与组织 | 17 | `leadership` | 组织设计、领导风格、决策模型 |
| 创新 | 19 | `innovation` | 产品创新、问题发散、方案收敛 |
| 管理体系 | 24 | `systems` | 质量管理、精益生产、ERP/BPR |
| 生产及质量 | 15 | `production` | 项目管理、质量控制、流程优化 |
| 人力资源 | 30 | `hr` | 招聘、绩效、培训、薪酬 |
| 财务管理 | 23 | `finance` | 报表分析、预算、投融资、估值 |
| 营销 | 27 | `marketing` | 市场分析、定价、渠道、促销 |
| 客户服务 | 23 | `service` | 服务质量、客户关系、满意度 |

## 依赖

- **API 服务**：本 Skill 通过 `bin/mtools` 调用远程 API 获取工具数据，无需本地工具库文件
- **API 地址**：`https://mtools.yekki.top:8088`
- **认证**：Bearer Token 已内嵌在 `bin/mtools` 脚本中，无需手动配置
- **API 由 management-praxis 项目提供**

## 开发

修改后运行 `bin/deploy.sh` 同步到 `~/.claude/skills/management-praxis/`：

```bash
bin/deploy.sh
```

注意：`AGENTS.md`、`README.md` 和 `.git/` 目录不会被部署到 skills 目录。
