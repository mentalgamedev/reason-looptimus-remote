# Changelog

## 1.0.0 - 2026-09-16

First public release.

- Adds a custom Reason Remote codec for Loop Community Looptimus
- Exposes Looptimus MIDI notes as Remote `value` controls
- Converts Note On to `127`
- Converts Note Off to `0`
- Supports all 128 MIDI notes
- Provides readable bank/button/note names
- Includes Windows installer and uninstaller
- Tested successfully with Reason 14 and Warp Looper Remote Overrides

### Background

Earlier experimental versions exposed the Looptimus switches as Reason Remote
`button` controls. That still required two physical presses for the affected
Warp controls.

Changing the Remote items to `value` controls was the working fix.
