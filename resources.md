# Resources

Every link below is checked live with `scripts/check-links.sh`; to add one, read `CONTRIBUTING.md`.

## Layer 1: Foundations

- **[The Python Tutorial](https://docs.python.org/3/tutorial/)** — docs · ~10h · The official tour of the language, including virtual environments and packages.
- **[SQLBolt](https://sqlbolt.com/)** — course · ~3h · Short interactive lessons in the browser that take you from `SELECT` to joins and aggregates.
- **[Pro Git](https://git-scm.com/book/en/v2)** — docs · ~6h · The free official Git book; chapters 1-3 and 6 cover daily use, branching, and GitHub pull requests.
- **[FastAPI Tutorial - User Guide](https://fastapi.tiangolo.com/tutorial/)** — docs · ~8h · Step-by-step official guide to routes, Pydantic models, and background tasks; its "Concurrency and async / await" page is a clear intro to async.
- **[Transformers, the tech behind LLMs (3Blue1Brown)](https://www.youtube.com/watch?v=wjZofJX0v4M)** — video · ~30m · A visual walk through tokens, embeddings, and attention (with a brief look at temperature); for top-p, follow up with Hugging Face's [How to generate text](https://huggingface.co/blog/how-to-generate).

## Layer 2: LLM Engineering

- **[Prompting best practices (Anthropic)](https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/claude-prompting-best-practices)** — docs · ~2h · The living reference for clear instructions, examples, XML structure, output formatting, and tool use; for JSON Schema outputs, read OpenAI's [Structured model outputs](https://developers.openai.com/api/docs/guides/structured-outputs) guide, which also explains when to use function calling instead.
- **[Prompt caching (Anthropic)](https://platform.claude.com/docs/en/build-with-claude/prompt-caching)** — docs · ~1h · How cached prompt prefixes work: cache breakpoints, cache lifetimes, pricing, and what invalidates a cache, with worked examples.
- **[Effective context engineering for AI agents (Anthropic)](https://www.anthropic.com/research/effective-context-engineering-for-ai-agents)** — docs · ~30m · Why context is a limited budget and how to spend it: lean prompts and tools, just-in-time retrieval, and compaction, notes, and sub-agents for long tasks.
- **[Hybrid Search with Reranking (Qdrant)](https://qdrant.tech/documentation/tutorials-basics/reranking-hybrid-search/)** — docs · ~2h · A hands-on tutorial that combines dense vectors with BM25 sparse vectors, merges them with RRF, then reranks with a ColBERT model; it runs on Qdrant Cloud, which has a free tier.
- **[Build an MCP server](https://modelcontextprotocol.io/docs/develop/build-server)** — docs · ~2h · The official tutorial: a short tour of tools, resources, and prompts, then a small weather server (in Python or one of several other languages) connected to a desktop chat app.

## Layer 3: Agents

- **[Building effective agents (Anthropic)](https://www.anthropic.com/research/building-effective-agents)** — docs · ~45m · Defines workflows vs agents, walks through the main patterns (prompt chaining, routing, parallelization, orchestrator-workers, evaluator-optimizer), and advises starting simple, with stopping conditions and sandbox testing; an appendix covers tool design.
- **[Introduction to LangGraph (LangChain Academy)](https://academy.langchain.com/courses/intro-to-langgraph)** — course · ~6h · A free video course: state and memory, human-in-the-loop, parallel steps and sub-graphs, building a research assistant, long-term memory, and deployment.
- **[Running your first Sandbox (E2B)](https://docs.e2b.dev/quickstart)** — docs · ~1h · Gets an API key, creates a cloud sandbox from Python or JavaScript, runs code in it, and lists its files; new accounts get free credits. For a second option with timeouts, snapshots, and lifecycle controls, read Modal's [Sandboxes guide](https://modal.com/docs/guide/sandbox).
- **[Voice agents (OpenAI)](https://developers.openai.com/api/docs/guides/voice-agents)** — docs · ~1h · Compares three designs (full-duplex GPT-Live, speech-to-speech with the Realtime API, and a chained speech-to-text, agent, text-to-speech pipeline), with build steps for each and how to measure latency; API use is paid, so for free local transcription try the open-source [Whisper](https://github.com/openai/whisper) models.
- **[browser-use](https://github.com/browser-use/browser-use)** — repo · ~2h · An MIT-licensed Python library for browser agents; the README covers install, a first agent script, adding custom tools, and running with a local model. To give any MCP client a browser instead, see [Playwright MCP](https://github.com/microsoft/playwright-mcp).

## Layer 4: Evaluation

- **[Your AI Product Needs Evals (Hamel Husain)](https://hamel.dev/blog/posts/evals/)** — docs · ~45m · A case study of a real estate assistant that explains why evals drive improvement and lays out three levels: unit-test-style assertions run on every code change, human and LLM review of logged traces, and A/B tests; it also covers synthetic test inputs and tracking how well an LLM grader agrees with humans.
- **[Define success criteria and build evaluations (Anthropic)](https://platform.claude.com/docs/en/test-and-evaluate/develop-tests)** — docs · ~1h · How to write specific, measurable success criteria, then design test cases that mirror real usage and include edge cases, with worked examples graded by exact match, cosine similarity, ROUGE-L, and an LLM using Likert, binary, or ordinal scales.
- **[Evaluating the Effectiveness of LLM-Evaluators (Eugene Yan)](https://eugeneyan.com/writing/llm-evaluators/)** — docs · ~2h · A long survey of LLM-as-a-judge research: direct scoring vs pairwise comparison, metrics for checking a judge against human labels (including Cohen's kappa), prompting and aligning judges, and the main criticisms; for the paper that popularized the method and measured position and verbosity bias, read [Zheng et al. 2023](https://arxiv.org/abs/2306.05685).
- **[List of available metrics (Ragas)](https://docs.ragas.io/en/stable/concepts/metrics/available_metrics/)** — docs · ~1h · The index of Ragas metrics, from the core RAG ones (context precision, context recall, faithfulness, response relevancy, noise sensitivity) to agent and general-purpose metrics, each linking to a page on what it measures and how it is scored; most metrics call an LLM, so running them uses your API key.
- **[Evaluation of LLM Applications (Langfuse)](https://langfuse.com/docs/evaluation/overview)** — docs · ~2h · An overview of evals in Langfuse, an open-source observability platform with a free cloud tier: datasets, experiments, LLM-as-a-judge scoring of live traces, checking a judge against human labels, and running experiments in CI. For an open-source alternative you can run locally, see [Arize Phoenix](https://arize.com/docs/phoenix).

## Layer 5: Production (LLMOps)

- **[PEFT Integration (Hugging Face TRL)](https://huggingface.co/docs/trl/peft_integration)** — docs · ~2h · How to train LoRA adapters with TRL's SFT, DPO, and GRPO (reinforcement learning) trainers, then QLoRA with a 4-bit base model, with suggested learning rates and how to save, load, and merge adapters; for what each trainer does, start at the [TRL overview](https://huggingface.co/docs/trl/index).
- **[vLLM documentation](https://docs.vllm.ai/en/latest/)** — docs · ~3h · The docs for an open-source inference engine; the home page lists its main speed features (PagedAttention, continuous batching, prefix caching, speculative decoding) and supported quantization formats, and the guides cover installation and its OpenAI-compatible server.
- **[Latency optimization (OpenAI)](https://developers.openai.com/api/docs/guides/latency-optimization)** — docs · ~45m · Seven principles, most of which apply to any provider: process tokens faster, generate fewer tokens, use fewer input tokens, make fewer requests, parallelize, make users wait less, and don't default to an LLM, with a worked example; the companion [Cost optimization](https://developers.openai.com/api/docs/guides/cost-optimization) guide adds the Batch API and flex processing for cheaper, slower jobs.
- **[OWASP Top 10 for LLM Applications 2025](https://genai.owasp.org/llm-top-10/)** — docs · ~3h · A free, community-written list of ten LLM app risks, from prompt injection and system prompt leakage to excessive agency and unbounded consumption; each entry explains the risk, ways to prevent it, and example attacks. To automate attacks against your own app, read promptfoo's [LLM red teaming guide](https://www.promptfoo.dev/docs/red-team/).
- **[Run OpenAI-compatible LLM inference with vLLM (Modal)](https://modal.com/docs/examples/vllm_inference)** — docs · ~2h · A complete example that serves an open model with vLLM on a cloud GPU, deploys it with one command, tests it with a client script, and links a Locust load test; Modal's Starter plan includes $30 of free compute per month. To monitor it, see vLLM's [production metrics](https://docs.vllm.ai/en/latest/usage/metrics/) page: time to first token, end-to-end latency, KV cache usage, and queued requests.

## Market and careers

- [How to Become an AI Engineer: 2026 Roadmap](https://scrimba.com/articles/how-to-become-an-ai-engineer-a-developers-roadmap-for-2026) — Scrimba
- [AI Engineer Roadmap 2026: RAG, Agents & Evals](https://dataskew.io/roadmaps/ai-engineering/) — DataSkew
- [The AI Engineer Roadmap Skills Map](https://aiarch.dev/ai-engineer-roadmap) — aiarch.dev
- [The 12 Most In-Demand AI Job Roles in 2026](https://opendatascience.com/12-in-demand-ai-job-roles-2026-how-to-get-hired/) — ODSC
- [Fastest Growing AI Roles in 2026](https://www.herohunt.ai/blog/fastest-growing-ai-roles-in-2026-data-and-rankings/) — HeroHunt
- [Emerging AI Job Roles for 2026](https://opendatascience.com/from-context-engineers-to-chief-ai-officers-emerging-ai-job-roles-for-2026/) — ODSC
- [AI Jobs in 2026: New Roles](https://dev.to/bcncodeschool/ai-jobs-in-2026-new-roles-skills-and-salary-examples-lkn) — DEV
- [AI vacancies in the Gulf nearly triple](https://fastcompanyme.com/news/ai-related-job-vacancies-in-the-gulf-nearly-triple-in-four-years/) — Fast Company ME

Sources that could not be verified automatically are listed in [`careers/README.md`](careers/README.md).
