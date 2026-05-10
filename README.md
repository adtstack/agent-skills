# Agent Skills Collection

Curated collection of 15 high-quality agent skills from the open ecosystem, consolidated into a single installable repository.

## Install All

```bash
npx skills add https://github.com/adtstack/agent-skills --all -g
```

## Install Individual Skills

```bash
# From obra/superpowers - agent workflow skills
npx skills add https://github.com/adtstack/agent-skills --skill brainstorming -g
npx skills add https://github.com/adtstack/agent-skills --skill systematic-debugging -g
npx skills add https://github.com/adtstack/agent-skills --skill writing-plans -g
npx skills add https://github.com/adtstack/agent-skills --skill requesting-code-review -g
npx skills add https://github.com/adtstack/agent-skills --skill test-driven-development -g
npx skills add https://github.com/adtstack/agent-skills --skill finishing-a-development-branch -g
npx skills add https://github.com/adtstack/agent-skills --skill using-git-worktrees -g
npx skills add https://github.com/adtstack/agent-skills --skill dispatching-parallel-agents -g
npx skills add https://github.com/adtstack/agent-skills --skill writing-skills -g
npx skills add https://github.com/adtstack/agent-skills --skill subagent-driven-development -g
npx skills add https://github.com/adtstack/agent-skills --skill executing-plans -g

# From vercel-labs/skills - skill discovery
npx skills add https://github.com/adtstack/agent-skills --skill find-skills -g

# From vercel-labs/agent-skills - web design & React
npx skills add https://github.com/adtstack/agent-skills --skill web-design-guidelines -g
npx skills add https://github.com/adtstack/agent-skills --skill vercel-react-best-practices -g

# From anthropics/skills - skill authoring
npx skills add https://github.com/adtstack/agent-skills --skill skill-creator -g
```

## Skills Overview

### Agent Workflows (obra/superpowers)

| Skill | Description |
|-------|-------------|
| brainstorming | Structured design dialogue that validates ideas before implementation |
| systematic-debugging | Hypothesis-driven debugging: observe, hypothesize, test, verify |
| writing-plans | Decompose specs into bite-sized, testable implementation steps |
| requesting-code-review | Dispatch code review subagents with focused context |
| test-driven-development | Red-green-refactor cycle: write failing test, implement, refactor |
| finishing-a-development-branch | Structured workflow for completing dev branches |
| using-git-worktrees | Isolated git worktrees with smart directory selection |
| dispatching-parallel-agents | Delegate independent tasks to specialized agents concurrently |
| writing-skills | TDD-driven documentation for creating reusable agent skills |
| subagent-driven-development | Fresh subagent per task with two-stage review |
| executing-plans | Execute implementation plans with checkpoints and verification |

### Skill Discovery (vercel-labs/skills)

| Skill | Description |
|-------|-------------|
| find-skills | Discover and install skills from the open ecosystem |

### Web Development (vercel-labs/agent-skills)

| Skill | Description |
|-------|-------------|
| web-design-guidelines | Audit UI code against Web Interface Guidelines |
| vercel-react-best-practices | React/Next.js performance optimization (70 rules, 8 categories) |

### Skill Authoring (anthropics/skills)

| Skill | Description |
|-------|-------------|
| skill-creator | Create, test, benchmark, and publish agent skills |

## Sources

- [obra/superpowers](https://github.com/obra/superpowers) - Agent workflow skills
- [vercel-labs/skills](https://github.com/vercel-labs/skills) - Find-skills utility
- [vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills) - Web and React skills
- [anthropics/skills](https://github.com/anthropics/skills) - Skill authoring tools

## License

Each skill retains its original license. See individual skill directories for details.
