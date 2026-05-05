# Changelog

All notable changes to the **plan-and-build** skill will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.0.0] — 2026-05-05

First versioned release. Major expansion of the workflow with framework detection,
pattern extraction, optional Git integration, and structured error recovery.

### Added
- **Phase 0 — Test framework auto-detection.** Inspects `package.json`, common
  config files, and existing test files to identify the runner (Vitest, Jest,
  Mocha, pytest, cargo, go test, etc.) before any feature work begins. Records
  the runner command and single-file pattern in the `tasks/all-features.md`
  header so future sessions don't re-detect.
- **Phase 1 enhancement — Codebase pattern extraction.** Identifies 2–3
  existing features that resemble the request and extracts naming, directory
  layout, error handling, logging, API shape, and validation patterns. Surfaces
  conflicts in legacy/inconsistent codebases and asks the user to choose.
- **Phase 3.5 — Optional Git workflow.** Opt-in feature-branch-per-task flow
  with one commit per feature (`F01: <description>`) and a final docs commit
  for the testing guide. Skipped entirely when the user manages git manually
  or `CLAUDE.md` declares so.
- **Phase 4.5 — Error recovery with 15-minute cap.** Structured debugging
  checklist (re-read assertion, run in isolation, log values, check patterns,
  bisect implementation). After ~15 minutes of no progress, the feature is
  marked blocked with last error + hypothesis, and the next feature begins.
  Blocked features are revisited at the end with fresh context.
- **Enhanced metadata in `done.md`.** Each completed feature now logs test
  count, files changed, line delta, complexity rubric (Low / Medium / High),
  and notes on non-obvious decisions.
- **Updated process flow diagram.** Reflects the new phases (framework
  detection, pattern extraction, optional git, recovery loop, blocked-feature
  revisit).
- **Five new entries in Common Mistakes:** not detecting test framework up
  front, ignoring existing codebase patterns, not documenting blocked features,
  committing all features in one commit, and grinding past the 15-minute cap.
- **Update infrastructure.** `update.sh` for one-command updates, `CHANGELOG.md`
  for release tracking, and an optional GitHub Actions release workflow.

### Changed
- **Resuming Work** now reads the recorded test runner and patterns from the
  `tasks/all-features.md` header instead of re-detecting on every session.
- **Phase 5 (Implementation Guide)** now commits as a final docs commit when
  Phase 3.5 is enabled.

## [1.0.0] — 2026-05-05

Original release. Basic TDD workflow: explore → ask → propose → tasks folder →
test-first implementation → manual testing guide.

### Added
- Single-phase exploration and clarifying questions (one at a time)
- Approach proposal with 2–3 options before implementation
- `tasks/` folder structure: `all-features.md`, `todo.md`, `done.md`
- Per-feature TDD loop (red → green → full suite → mark done)
- Auto mode: proceed through all features without per-feature permission
- `guide/<feature-name>.md` manual testing document at the end
- Resuming Work flow that picks up from `tasks/` on re-invocation

[2.0.0]: https://github.com/jattanjie21/plan-and-build-skill/releases/tag/v2.0.0
[1.0.0]: https://github.com/jattanjie21/plan-and-build-skill/releases/tag/v1.0.0
