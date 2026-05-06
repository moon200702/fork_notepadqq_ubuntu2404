# Notepadqq Ubuntu 24.04 Compatibility Fork

> Unofficial personal fork of [notepadqq/notepadqq](https://github.com/notepadqq/notepadqq).

This repository is a personal compatibility fork of Notepadqq.

The purpose of this fork is to experiment with rebuilding, testing, and adapting Notepadqq for:

- Ubuntu 24.04
- Qt 5.15.x
- Notepad++ / Notepadqq-like basic editing experience
- safer validation for infrastructure-oriented text editing workflows

This fork is **not** an official Notepadqq release.

This fork is **not affiliated with, endorsed by, or maintained by the original Notepadqq maintainers**.

The original Notepadqq project is no longer actively maintained, and newer OS / Qt versions may have compatibility or runtime stability issues. This fork keeps that context visible and treats compatibility, runtime stability, and data correctness as active testing areas.

---

## Fork status

This fork is currently **experimental**.

| Area | Status |
|---|---|
| Ubuntu 24.04 build | Testing |
| Qt 5.15.x compatibility | Testing |
| Runtime smoke test | In progress |
| Data-correctness test | In progress |
| Production readiness | Not ready |
| Release package | Not provided |

Recommended use:

- Testing
- Local experimentation
- Compatibility investigation
- Notepadqq migration research
- Learning and reviewing AI-assisted code changes

Not recommended yet:

- Editing critical infrastructure files as the only editor
- Editing important files without backup
- Large-scale search and replace on important files
- Production use
- Claiming this fork is stable

---

## Why this fork exists

Notepadqq provides a familiar Notepad++-like editing experience on Linux, but the upstream project is no longer actively maintained.

This fork exists to explore whether Notepadqq can be made usable again on a modern Ubuntu desktop environment, especially Ubuntu 24.04 with Qt 5.15.x.

The goal is not to redesign Notepadqq into a new IDE.

The goal is to preserve the original lightweight editor experience while making the build, runtime behavior, and basic file-editing correctness easier to verify.

---

## AI-assisted development notice

This fork is maintained as a personal learning and compatibility experiment.

Some changes in this fork may be created or assisted with AI coding tools, including OpenAI Codex.

AI-assisted changes should still follow normal open-source expectations:

- Changes should be reviewed before merging.
- Build and runtime behavior should be tested.
- Data-correctness risks should be documented.
- Generated code should not remove existing license notices.
- Generated code should not introduce unclear ownership or licensing problems.
- Changes should remain small, auditable, and explainable.

AI assistance does not replace human review.

---

## Project priorities

This fork prioritizes:

1. **Data correctness**
2. **Runtime stability**
3. **Reproducible builds**
4. **Minimal behavior changes**
5. **Preserving Notepadqq / Notepad++-like user experience**

For infrastructure-oriented text editing, the most important risks are not visual design issues. The important risks are:

- Save failure
- Silent overwrite
- External file changes being ignored
- Line ending changes
- Encoding changes
- Unicode whitespace changes
- Broken search and replace
- Crash during editing
- UI showing a save as successful when it actually failed

This fork should not be considered reliable for important files until these areas are tested.

---

## Goals

Current goals:

- Build Notepadqq on Ubuntu 24.04
- Verify the actual Qt 5 version used by the build environment
- Preserve existing Notepadqq behavior where possible
- Keep Notepad++-like default shortcuts and editing workflow
- Improve Ubuntu 24.04 build documentation
- Add reproducible build notes
- Add smoke-test procedures
- Investigate runtime crash risks
- Investigate data-correctness risks

---

## Non-goals

This fork does not currently aim to:

- Become the official Notepadqq project
- Replace the upstream Notepadqq maintainers
- Redesign the editor UI
- Migrate to Qt 6 in the first phase
- Become a full IDE
- Add a plugin ecosystem
- Claim production stability before testing evidence exists

---

## Relationship to upstream

Upstream project:

- <https://github.com/notepadqq/notepadqq>

This fork preserves the original project history, license, and attribution.

The upstream project remains the original source of Notepadqq. This repository is only a personal compatibility fork focused on Ubuntu 24.04 / Qt 5.15.x testing.

---

## License

This project is a fork of Notepadqq and remains licensed under the GNU General Public License v3.0.

Original project:

- <https://github.com/notepadqq/notepadqq>

Original license:

- GPL-3.0

Copyright notices from the original project are preserved.

Modifications in this fork are documented through Git history.

---

## Build from source

This fork currently does **not** provide release packages.

Please build from source for testing.

### Get the source

```bash
git clone --recursive https://github.com/moon200702/fork_notepadqq_ubuntu2404.git
cd fork_notepadqq_ubuntu2404
chmod +x compile_script.sh
./compile_script.sh
