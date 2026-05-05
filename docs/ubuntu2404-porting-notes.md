# Ubuntu 24.04 + Qt 5.15 Porting Notes

## Baseline attempt 2026-05-04

### Error 1: configure cannot find qmake
- **Command**: `./configure --prefix /usr`
- **Error**: `checking for QT5 qmake... not found!`
- **Likely cause**: Qt development packages are missing in the build environment.
- **Impact**: Build cannot start; no Makefile generated.
- **Fix strategy**:
  1. Install documented Ubuntu 24.04 dependencies (`qtbase5-dev`, `qttools5-dev`, `qttools5-dev-tools`, etc.).
  2. Re-run Qt version probes (`qmake -v`, `pkg-config --modversion Qt5Core`).
  3. Re-run configure and make before touching source code.

### Error 2: make has no targets
- **Command**: `make -j$(nproc)`
- **Error**: `No targets specified and no makefile found.  Stop.`
- **Likely cause**: direct consequence of configure failure above.
- **Impact**: No compile diagnostics yet.
- **Fix strategy**: resolve Error 1 first; only then classify C++/Qt API/module issues.

## Notes on change policy
- Do not remove features to pass build.
- Keep fixes minimal and categorized (one error class per commit).
- Defer warning-only cleanup unless warnings become blockers.
