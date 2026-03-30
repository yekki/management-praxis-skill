# Management Praxis

204个经典管理工具实战顾问 — Claude Code Skill

将204个经典管理工具编码为 AI 驱动的分析引擎，从问题诊断到工具匹配、引导应用，最终生成带可视化图表的分析报告。

## 特性

- **204个工具**：覆盖战略、领导、创新、体系、生产、HR、财务、营销、客户服务 9 大领域
- **智能匹配**：根据问题场景自动推荐最合适的 3-5 个工具组合
- **引导式应用**：逐工具提供操作模板，预填已知信息，引导用户补充
- **可视化报告**：生成 HTML 报告，含 ECharts 交互图表（PEST、五力雷达、EFE、SWOT）
- **行业模板**：SaaS、制造业、零售、专业服务 4 个行业预设工具链
- **质量管控**：信心等级（A/B/C）、So What 检验、反模式检测

## 工具库

| 领域 | 数量 | 典型工具 |
|------|------|----------|
| 战略管理 | 18 | SWOT、波特五力、BCG矩阵、PEST、QSPM |
| 领导与组织 | 17 | 7S模型、情境领导、管理方格图、弗罗姆决策 |
| 创新 | 19 | 头脑风暴、KJ法、德尔菲法、形态分析、5W2H |
| 管理体系 | 24 | 6σ、精益生产、ERP、BPR、TQM |
| 生产及质量 | 15 | PDCA、因果图、甘特图、控制图、关键路线法 |
| 人力资源 | 30 | 平衡计分卡、360度反馈、KPI、胜任特征、评价中心 |
| 财务管理 | 23 | 杜邦分析、净现值、三大报表、沃尔评分、零基预算 |
| 营销 | 27 | 市场细分、产品生命周期、定价策略、渠道评估 |
| 客户服务 | 23 | SERVQUAL、服务利润链、CCPR、质量差距模型 |

## 工作流程

```
问题诊断 → 工具匹配 → 引导应用 → 洞察提炼 → 报告生成
         ↑ 行业模板加速匹配        ↓
         └─────── 快速模式 ────────┘
```

| 阶段 | 做什么 | 产出 |
|------|--------|------|
| 1. 问题诊断 | 澄清问题本质、层次、约束 | 结构化问题定义 |
| 2. 工具匹配 | 从204个工具中选主工具+辅助+验证 | 工具链推荐 |
| 3. 引导应用 | 逐个工具提供模板、示范填写 | 各工具分析结果 |
| 4. 洞察提炼 | 交叉验证、So What追问、优先排序 | 关键发现（含信心等级） |
| 5. 报告生成 | Markdown + HTML 双格式 | 完整分析报告 |

## 安装

```bash
git clone https://github.com/yekki/management-praxis-skill.git
cp -r management-praxis-skill ~/.claude/skills/management-praxis
```

安装后在 Claude Code 中输入 `/management-praxis` 或直接描述管理问题即可激活。

> 详细使用说明见 [快速上手指南](docs/quickstart.md)

## 使用

在 Claude Code 中直接描述管理问题：

```
"我们要进入东南亚市场，帮我分析"
"团队绩效考核体系要重建"
"产品质量不稳定，帮我找原因"
"快速分析：定价策略怎么选？"
```

## 项目结构

```
management-praxis/
├── SKILL.md                        # 主编排文件 v1.1.0
├── README.md
├── AGENTS.md                       # AI Agent 协作指南
├── docs/
│   ├── quickstart.md               # 快速上手指南
│   └── poster.html                 # 宣传海报
├── templates/                      # 行业模板
│   ├── saas.md                     #   SaaS/软件
│   ├── manufacturing.md            #   制造业
│   ├── retail.md                   #   零售/消费
│   └── professional-services.md    #   专业服务
├── methodology/                    # 方法论
│   ├── problem-diagnosis.md        #   问题诊断框架
│   └── tool-combination.md         #   工具组合策略
└── references/                     # 输出标准
    ├── report-template.html        #   HTML报告模板
    └── quality-rules.md            #   质量规则与反模式
```

## License

MIT
