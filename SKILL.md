---
name: agent-skills
description: "Curated meta-collection of 15 agent skills. Use when setting up a new environment, onboarding a new agent, or when you need the full power of brainstorming, systematic-debugging, writing-plans, TDD, code-review, subagent-driven-development, executing-plans, skill-creator, find-skills, and web-design-guidelines. Install all at once or pick individual skills."
---

# Agent Skills Collection

This repository contains 15 curated agent skills consolidated from the open ecosystem. Install all at once or pick what you need.

## Install All

```bash
npx skills add https://github.com/adtstack/agent-skills --all -g -y
```

## Skills Index

### Agent Workflows

- **brainstorming** - Structured design dialogue before implementation. Invokes writing-plans when done.
- **systematic-debugging** - Hypothesis-driven debugging: observe, hypothesize, test, verify. Root cause first.
- **writing-plans** - Decompose specs into bite-sized TDD steps with exact file paths and commands.
- **requesting-code-review** - Dispatch code review subagents with focused git diff context.
- **test-driven-development** - Red-green-refactor: failing test first, minimal code, refactor.
- **subagent-driven-development** - Fresh subagent per task with two-stage review (spec then quality).
- **executing-plans** - Execute written plans with checkpoints; stop on blockers.
- **dispatching-parallel-agents** - Delegate independent tasks to concurrent agents.
- **finishing-a-development-branch** - Verify tests, present merge/PR/keep/discard options.
- **using-git-worktrees** - Isolated worktrees with directory detection and safety verification.
- **writing-skills** - TDD for process documentation: baseline, write skill, close loopholes.

### Web Development

- **vercel-react-best-practices** - 70 rules across 8 categories for React/Next.js performance.
- **web-design-guidelines** - Audit UI against Vercel Web Interface Guidelines.

### Tooling

- **find-skills** - Discover and install skills from the skills.sh ecosystem.
- **skill-creator** - Create, test, benchmark, and optimize agent skills with eval viewer.

## Workflow

The skills form a coherent pipeline:

```
brainstorming -> writing-plans -> subagent-driven-development (or executing-plans)
                                    |
                              test-driven-development (per task)
                              requesting-code-review (per task)
                              finishing-a-development-branch (end)
```

Debug at any point with **systematic-debugging**. Create new skills with **writing-skills** and **skill-creator**.

## Sources

- [obra/superpowers](https://github.com/obra/superpowers)
- [vercel-labs/skills](https://github.com/vercel-labs/skills)
- [vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills)
- [anthropics/skills](https://github.com/anthropics/skills)
