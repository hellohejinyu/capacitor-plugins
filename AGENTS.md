# Permissions fork notes

This fork is consumed by `/Users/Jinyu/MyCodes/html-kit-me` for native runtime
permissions. The upstream `@capawesome/capacitor-permissions` iOS target imports
all supported sensitive frameworks. App Store Connect then detects those symbols
and requires purpose strings for Location, Bluetooth, Calendar, Contacts and
Motion even when the app requests only the microphone.

## Current scope

Only microphone permission is active:

- iOS links only `AVFoundation` and requires `NSMicrophoneUsageDescription`.
- Android declares only `RECORD_AUDIO` through the Capacitor plugin annotation.
- Unsupported enum values return `unavailable`; the public TypeScript API stays
  compatible with upstream.

## Why disabled code is commented instead of deleted

The upstream multi-permission code is retained under `#if false` on iOS and
block comments around Android permission annotations. Do not delete it merely
to reduce size. This makes upstream merges and diffs clear, documents exactly
which framework references are intentionally excluded, and lets a future change
restore a permission by moving only its relevant code back into the active
implementation.

When enabling a permission, add only its native implementation/import and the
matching `Info.plist` purpose string or Android manifest permission. Build an
iOS archive and check the App Store validation result before release.
