# Layer 4: Evaluation

**Time budget:** ~4 weeks at ~10 hrs/week

> If you invest in one skill this year, make it evaluation engineering: eval pipelines, LLM-as-a-judge, and golden datasets.

## Why this layer exists

The market analysis this roadmap is built on ranks evaluation as the skill with the widest gap between demand and supply, and reports that senior AI engineer postings ask for eval pipelines, golden datasets, and LLM-as-a-judge before fine-tuning.

The reason is simple. LLM output changes every time you touch a prompt, swap a model, or re-chunk your documents. Without evals you cannot tell whether a change made your product better or just different. An eval is a fixed set of inputs, a way to score the outputs, and a record of those scores over time, so every change is measured instead of guessed.

This layer covers building golden datasets, using an LLM as a judge and checking it against human labels, evaluating RAG, watching a live app with observability tools, and running evals on every commit.

## After this layer you can

- Turn a vague goal ("answers should be good") into success criteria you can measure.
- Build a golden dataset from real logs and hand-picked edge cases.
- Write an LLM judge and measure how often it agrees with human labels.
- Score a RAG pipeline on retrieval and answer quality separately.
- Run evals in CI so a change that makes things worse fails the build.

## Topics

**Eval basics**

- [ ] Success criteria: specific, measurable targets (accuracy, tone, refusal rate, latency) written down before you start changing prompts
- [ ] Eval pipelines: run a fixed set of inputs through your app, score every output, and store the scores with the prompt and model version
- [ ] Three ways to grade: code checks (exact match, regex, JSON valid), human review, and model grading; use the cheapest one that works
- [ ] Offline vs online evals: scoring a fixed dataset before release vs scoring live traffic after it

**Golden datasets**

- [ ] Golden datasets: a hand-checked set of inputs with expected outputs or grading notes, kept under version control
- [ ] Building a golden set from logs: sampling real user questions from traces, labeling them, and adding the failures you find
- [ ] Edge cases and synthetic inputs: ambiguous, off-topic, and adversarial questions, plus LLM-generated inputs for cases your logs do not cover yet

**LLM-as-a-judge**

- [ ] LLM-as-a-judge: a model grades another model's output against a written rubric, often with a short critique before the score
- [ ] Pairwise vs pointwise judging: picking the better of two answers vs scoring one answer on its own; pairwise is often more stable, pointwise is easier to track over time
- [ ] Judge biases: preferring the first answer shown (position bias), longer answers (verbosity bias), or its own model's answers (self-preference)
- [ ] Judge calibration: comparing the judge with your own labels on the same items, reading the disagreements, and fixing the rubric until they match
- [ ] Judge agreement with humans (Cohen's kappa): an agreement score that corrects for agreeing by chance; raw percent agreement can look high when most answers pass

**RAG evals**

- [ ] RAGAS: an open-source library with RAG metrics such as faithfulness, response relevancy, context precision, and context recall
- [ ] Retrieval vs generation failures: checking whether the right passages were found before blaming the model for a bad answer

**Observability and CI**

- [ ] Observability (Langfuse, Phoenix, Helicone): logging every request as a trace with inputs, outputs, retrieved context, cost, and latency, and attaching scores to it
- [ ] Regression evals in CI: running the golden set on every commit and failing the build when a score drops below a set threshold

## Resources

- **[Your AI Product Needs Evals (Hamel Husain)](https://hamel.dev/blog/posts/evals/)** — docs · ~45m · A case study of a real estate assistant that explains why evals drive improvement and lays out three levels: unit-test-style assertions run on every code change, human and LLM review of logged traces, and A/B tests; it also covers synthetic test inputs and tracking how well an LLM grader agrees with humans.
- **[Define success criteria and build evaluations (Anthropic)](https://platform.claude.com/docs/en/test-and-evaluate/develop-tests)** — docs · ~1h · How to write specific, measurable success criteria, then design test cases that mirror real usage and include edge cases, with worked examples graded by exact match, cosine similarity, ROUGE-L, and an LLM using Likert, binary, or ordinal scales.
- **[Evaluating the Effectiveness of LLM-Evaluators (Eugene Yan)](https://eugeneyan.com/writing/llm-evaluators/)** — docs · ~2h · A long survey of LLM-as-a-judge research: direct scoring vs pairwise comparison, metrics for checking a judge against human labels (including Cohen's kappa), prompting and aligning judges, and the main criticisms; for the paper that popularized the method and measured position and verbosity bias, read [Zheng et al. 2023](https://arxiv.org/abs/2306.05685).
- **[List of available metrics (Ragas)](https://docs.ragas.io/en/stable/concepts/metrics/available_metrics/)** — docs · ~1h · The index of Ragas metrics, from the core RAG ones (context precision, context recall, faithfulness, response relevancy, noise sensitivity) to agent and general-purpose metrics, each linking to a page on what it measures and how it is scored; most metrics call an LLM, so running them uses your API key.
- **[Evaluation of LLM Applications (Langfuse)](https://langfuse.com/docs/evaluation/overview)** — docs · ~2h · An overview of evals in Langfuse, an open-source observability platform with a free cloud tier: datasets, experiments, LLM-as-a-judge scoring of live traces, checking a judge against human labels, and running experiments in CI. For an open-source alternative you can run locally, see [Arize Phoenix](https://arize.com/docs/phoenix).

## Mini-project

**Eval the Layer 2 project.** Take the docs Q&A server from the [Layer 2 mini-project](../02-llm-engineering/README.md) and build an eval suite for it. Write a 50-item golden set: real questions taken from your own logs (or questions you write yourself if you have no logs), plus edge cases such as exact-name lookups and questions the docs do not answer, each with an expected answer and the docs page that supports it. Write an LLM judge that grades each answer for correctness and citation, label 20 answers yourself, and adjust the judge's rubric until it agrees with your labels. Send traces and scores to Langfuse or Phoenix, and add a CI job that runs the whole suite on every commit.

**Done when:**

- [ ] The repo contains a golden set file with 50 items, each with a question, an expected answer, and a source page, and at least 5 of them are questions the docs do not answer.
- [ ] A calibration report shows your 20 hand labels next to the judge's labels, with percent agreement and Cohen's kappa.
- [ ] The Langfuse or Phoenix dashboard shows one trace per golden item with the judge's score attached, for at least two runs you can compare.
- [ ] A commit that breaks the pipeline (for example, turning off reranking) makes the CI eval job fail and print which items got worse.

## Next

Continue to [Layer 5: Production (LLMOps)](../05-production/README.md).
