# Ubuntu 24.04 Smoke Test Checklist (Notepadqq fork)

Use this checklist **after build succeeds**. Record pass/fail and crash traces for each item.

## 1) Basic startup
- Launch notepadqq from build output directory.
- Verify it does not crash immediately.
- Open a blank document and type text.

## 2) Data correctness
- Create file, type text, press `Ctrl+S`, close/reopen, verify exact content.
- Validate UTF-8 Traditional Chinese text round-trip.
- Validate LF file open/edit/save.
- Validate CRLF file open/edit/save.
- Validate tab vs spaces are preserved.
- Validate NBSP / special Unicode whitespace is not silently normalized.
- Open/save ~5MB text file and validate file hash/content consistency.
- Open/save ~20MB text file and validate file hash/content consistency.

## 3) Search and replace
- `Ctrl+F` normal search.
- `Ctrl+H` replace one.
- `Replace All` and verify expected affected regions.
- If regex is supported in current mode, validate regex search/replace correctness.

## 4) Multi-tab behavior
- Open multiple files.
- Cycle tabs using `Ctrl+Tab` / `Ctrl+Shift+Tab`.
- Close unsaved file and verify save/discard/cancel prompt correctness.
- If session restore is available, verify reopening behavior.

## 5) External modification safety
- Open file in Notepadqq.
- Modify same file externally via shell/editor.
- Return focus to Notepadqq and check change detection behavior.
- Ensure save flow does not silently overwrite externally modified content.

## 6) Crash-risk interaction checks
- Open/close search window repeatedly.
- Paste large clipboard payload.
- Rapidly switch tabs.
- Open and close many files.
- If environment allows, compare behavior on Wayland and X11 sessions.

## Recording template
For each run, record:
- Date/time
- Commit hash
- Qt version (`qmake -v`, `pkg-config --modversion Qt5Core`)
- Display session type (`echo $XDG_SESSION_TYPE`)
- Pass/fail per checklist item
- Crash logs/backtraces (if any)
