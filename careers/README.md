# Careers: where each layer leads

The AI job market has moved. Per the market analysis this roadmap is built on, most new AI work is no longer about training models from scratch; it is about building reliable agentic systems on top of models that already exist. The same analysis finds three skills repeated in every job description: RAG, Agents, and Evals. This page shows which job titles each layer of this roadmap leads to.

## Stable titles

These titles have the highest demand today. Per LinkedIn Jobs on the Rise 2026, AI Engineer is the fastest-growing job in the US, with 143% annual growth, and 4 of the 5 fastest-growing jobs are AI roles. Ranks below are from that list where it gives one.

- **AI Engineer** (#1 on LinkedIn)
- **AI Consultant / Strategist** (#2)
- **Data Annotator** (#4)
- **AI/ML Researcher** (#5)
- **ML Engineer**
- **MLOps Engineer**
- **Data Scientist**
- **AI Product Manager**
- **AI Solutions Architect**

Per LinkedIn, the most common skills on AI engineer profiles are LangChain, RAG, and PyTorch. Building agents is now a core requirement in AI engineer job posts, not a nice-to-have.

## New titles (2024–2026)

These titles were born between 2024 and 2026. The descriptions and figures come from the market analysis this roadmap is built on, which draws on the reports in [Sources](#sources). It names Forward Deployed Engineer as the most important new title.

| Title | What they do | Note |
|---|---|---|
| Forward Deployed Engineer (FDE) | An embedded builder inside the customer's environment, taking work from prototype to production | The most important new title: from ~200 postings in 2024 to 1,200 in 2025 to 5,200+ in the first 7 months of 2026. OpenAI, Google Cloud, Anthropic, and Palantir hire for it. |
| Context Engineer | Optimizes the context, memory, and knowledge of AI systems | Has absorbed a large part of the Prompt Engineer role |
| AI Evaluation / Safety Engineer | Builds eval pipelines, runs red teaming, and owns reliability | Demand is rising as production systems mature |
| AI Reliability Engineer (AI SRE) | Operates AI systems and keeps them reliable in production | An extension of the classic SRE idea |
| Agentic Workflow Architect | Designs multi-agent workflows | Driven by the agentic AI wave |
| AI Governance / Risk Director and AI Compliance Analyst | Builds governance and compliance frameworks | Driven by the EU AI Act and similar regulation |
| AI FinOps Specialist | Manages token cost across the whole organization | A reaction to what is being called "The Token Tax" |
| Synthetic Data Curator and AI Data Governance Manager | Produces high-quality synthetic training data and governs data | The AI data management market is expected to exceed $46 billion in 2026 |
| AI Enablement / Adoption / Transformation Lead | Business-side roles that roll AI out inside organizations | Visible in real LinkedIn vacancies |
| Chief AI Officer (CAIO) | Sets AI strategy at the executive level | Among the highest salaries in the field |

Prompt Engineer as a standalone title is declining, per the same analysis: it has merged into AI Engineer and Context Engineer.

## The Gulf market

- **Share of jobs.** AI skills were mentioned in 3.4% of professional vacancies in Saudi Arabia, the UAE, and Qatar in the first half of 2026 (1 in 30 jobs), per a GulfTalent analysis of 118,000 vacancies (sources include Fast Company Middle East and MIT Sloan Management Review Middle East).
- **Growth.** Per the same GulfTalent analysis, that share was 1.2% in 2022.
- **What the roles do.** Per the market analysis this roadmap is built on, AI-related roles in the Gulf split into 35% implementing AI, 31% using AI in daily work, 25% selling AI products and services, and 9% building the technology itself.
- **Seniority.** Per the same market analysis, demand for AI skills rises with seniority.

The takeaway, from the market analysis this roadmap is built on: the biggest local opportunity is in implementation and deployment roles, and the FDE model is the closest fit to the Gulf market.

## Layer → title map

● = required, ○ = helpful, blank = not central to the role.

| Title | [L1 Foundations](../01-foundations/README.md) | [L2 LLM Eng](../02-llm-engineering/README.md) | [L3 Agents](../03-agents/README.md) | [L4 Evals](../04-evaluation/README.md) | [L5 Production](../05-production/README.md) |
|---|:-:|:-:|:-:|:-:|:-:|
| Forward Deployed Engineer (FDE) | ○ | ● | ● | ○ | ● |
| Context Engineer | ○ | ● | ● | ○ |  |
| AI Evaluation / Safety Engineer | ○ | ○ | ○ | ● | ● |
| AI Reliability Engineer (AI SRE) | ○ | ○ | ○ | ○ | ● |
| Agentic Workflow Architect | ○ | ● | ● | ○ | ○ |
| AI Governance / Risk Director, AI Compliance Analyst |  | ○ | ○ | ○ | ○ |
| AI FinOps Specialist |  | ○ | ○ |  | ● |
| Synthetic Data Curator, AI Data Governance Manager | ○ | ○ |  | ○ |  |
| AI Enablement / Adoption / Transformation Lead | ○ | ○ | ○ |  |  |
| Chief AI Officer (CAIO) | ○ | ○ | ○ | ○ | ○ |
| AI Engineer | ● | ● | ● | ● | ● |
| ML Engineer | ● | ○ |  | ○ | ● |
| MLOps Engineer | ● |  |  | ○ | ● |
| AI Solutions Architect | ○ | ● | ● | ○ | ● |

If you invest one year of learning in one thing, the market analysis behind this roadmap says to make it evaluation engineering: eval pipelines, LLM-as-a-judge, and golden datasets. See [Layer 4](../04-evaluation/README.md).

## Sources

The market analysis referred to across this repo is an Arabic-language write-up by the repo author, dated 21 October 2026, that synthesizes the reports listed below. It is not published separately; the figures it carries are credited to their original outlets where those could be verified.

- The Agentic AI Engineer Roadmap for 2026 — Medium / Data Science Collective (not linked: URL not verified; the page returns 403 to automated checks and is a Medium article that may be paywalled)
- [How to Become an AI Engineer: 2026 Roadmap](https://scrimba.com/articles/how-to-become-an-ai-engineer-a-developers-roadmap-for-2026) — Scrimba
- [AI Engineer Roadmap 2026: RAG, Agents & Evals](https://dataskew.io/roadmaps/ai-engineering/) — DataSkew
- [The AI Engineer Roadmap Skills Map](https://aiarch.dev/ai-engineer-roadmap) — aiarch.dev
- [The 12 Most In-Demand AI Job Roles in 2026](https://opendatascience.com/12-in-demand-ai-job-roles-2026-how-to-get-hired/) — ODSC
- [Fastest Growing AI Roles in 2026](https://www.herohunt.ai/blog/fastest-growing-ai-roles-in-2026-data-and-rankings/) — HeroHunt
- LinkedIn Jobs on the Rise 2026 coverage — Forbes (not linked: URL not verified; the page returns 403 to automated checks)
- The AI job market in 2026 — ilinmaks (not linked: URL not verified)
- [Emerging AI Job Roles for 2026](https://opendatascience.com/from-context-engineers-to-chief-ai-officers-emerging-ai-job-roles-for-2026/) — ODSC
- [AI Jobs in 2026: New Roles](https://dev.to/bcncodeschool/ai-jobs-in-2026-new-roles-skills-and-salary-examples-lkn) — DEV
- [AI vacancies in the Gulf nearly triple](https://fastcompanyme.com/news/ai-related-job-vacancies-in-the-gulf-nearly-triple-in-four-years/) — Fast Company ME
- AI skills in 1 of 30 Gulf vacancies — MIT Sloan ME (not linked: URL not verified; the page returns HTTP 500)
