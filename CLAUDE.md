# Dream Mode — Distribution & Packaging

## Overview
Packaging scripts and portable distribution files for Hermes Agent Dream Mode (Nightly Reflection).

## Commands
- Build zip: `bash scripts/build_zip.sh`
- Verify package: `unzip -l output/dream-mode.zip`

## Conventions
- English-only in code, docs, and comments.
- Placeholders for all personal/credential data (`<PLACEHOLDER>`).
- Pure POSIX-compatible shell scripts for installation portability.

## Boundaries
- **NEVER** include real user identifiers, Telegram IDs, chat links, or private tokens.
- **ALWAYS** sanitize file paths and host-specific directory names.

## Dependencies
- `zip` / `unzip`
- Standard POSIX shell (`bash`/`sh`)
- Hermes Agent >= 0.20

## Config
- `HERMES_HOME`: Target Hermes configuration directory (defaults to `~/.hermes`).
- `DELIVERY_TARGET`: Target chat/channel for nightly dream log delivery.

## Error Handling
- Verification checks ensure all required files exist before zipping.
- Installer script checks for Hermes environment before applying changes.

## Troubleshooting
- Missing `zip`: install via `apt install zip` or platform package manager.
- Permission issues: ensure execution permissions (`chmod +x setup.sh`).
