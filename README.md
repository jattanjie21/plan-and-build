# plan-and-build

A Claude Code skill that turns a vague feature idea or bug report into working, tested code — one small feature at a time.

## What it does

When you invoke `/plan-and-build`, Claude will:

1. **Explore your codebase** — reads existing files, patterns, and conventions before asking anything
2. **Ask clarifying questions** — one at a time, to understand what you're building and how it should work
3. **Propose an approach** — 2–3 options with trade-offs, waits for your approval
4. **Set up a task folder** — creates `tasks/all-features.md`, `tasks/todo.md`, and `tasks/done.md`
5. **Build feature by feature** — picks one feature at a time, writes a failing test first (TDD), implements, marks done, repeats
6. **Create a testing guide** — when all features are complete, writes `guide/<feature-name>.md` with step-by-step manual testing instructions

## Why use it

Without structure, features get built all at once, tests get skipped, and you end up with no record of what was built or how to test it. This skill enforces:

- **Small features** — each one is scoped, testable, and completable in a single session
- **Test-first (TDD)** — no production code without a failing test first
- **Progress tracking** — `tasks/` folder is the source of truth; work can always be resumed
- **Documentation** — every feature ships with a manual testing guide

## Usage

```
/plan-and-build
```

or with a description:

```
/plan-and-build add a cash payment flow for walk-up ticket sales
```

Claude will take it from there.

## What gets created

```
tasks/
  all-features.md   ← full feature list with checkboxes
  todo.md           ← current feature being worked on
  done.md           ← completed features with test counts

guide/
  <feature-name>.md ← manual testing guide written at the end
```

## Resuming work

If you close a session mid-way, just run `/plan-and-build` again in the same project. Claude reads the `tasks/` folder and picks up exactly where you left off.

## Example session

```
You:    /plan-and-build build a POS system for walk-up ticket sales

Claude: What should a Sunmi operator be able to do from the POS?
        A — Scan only
        B — Scan + print pre-purchased tickets
        C — Full cashier: sell, collect cash, print

You:    C but cash only

Claude: Who operates the device?
        A — Promoter only
        B — Hired staff with their own login
        C — Either — promoter hands device to staff

You:    C
...

[After questions → proposes approach → you approve]

Claude: Creating tasks/all-features.md with 11 features...
        Starting F01 — posService.createCashSale()
        Writing failing test...
        ✓ RED confirmed
        Implementing...
        ✓ GREEN — 5/5 tests passing
        Moving F01 to done. Starting F02...
```

## Requirements

- Claude Code CLI
- A project with a `src/` directory and a test runner (Vitest, Jest, etc.)
- For TDD to work, the project must have tests set up

## Installation

The skill lives in `~/.claude/skills/plan-and-build/SKILL.md` and is automatically available in all Claude Code sessions.

To install on a new machine:

```bash
mkdir -p ~/.claude/skills/plan-and-build
curl -o ~/.claude/skills/plan-and-build/SKILL.md \
  https://raw.githubusercontent.com/jattanjie21/plan-and-build-skill/main/SKILL.md
```

## License

MIT
