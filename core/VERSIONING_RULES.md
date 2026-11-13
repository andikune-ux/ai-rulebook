# Application Versioning and Release Synchronization

This policy is adopted for **NSiO only** in this workstream. It does not authorize or require any change to Home IO. Home IO's existing versioning and release behavior must remain untouched unless its owner separately requests a change.

## Required NSiO version format

Use exactly:

`v.{MAJOR}.{DAY}.{COMMIT_NUMBER}`

Example: `v.1.13.250`.

- `MAJOR`: persistent application generation. It increases by **one for each independent trigger**:
  1. Each calendar-month boundary in Asia/Jakarta.
  2. Each intentional substantial application-wide redesign, architectural overhaul, or major feature expansion.
  If both triggers occur, count both: increase MAJOR by **two**. Do not collapse simultaneous triggers into one increment. If multiple month boundaries elapsed, count each elapsed boundary. A major-change increment requires an intentional, documented decision by the owner; do not infer it from file count or commit-message keywords.
- `DAY`: the current day of the month in Asia/Jakarta, from 1 through 31. It is a real-time calendar date component, not a month number, month-cycle counter, build number, or commit count. It changes automatically when the local date changes.
- `COMMIT_NUMBER`: the monotonically increasing ordinal of the source commit in NSiO's intended mainline history. Each new commit advances it by one. It is not a GitHub Actions run number, workflow attempt, timestamp, or arbitrary tag suffix. Resolve it from full, non-shallow Git history or an explicitly maintained monotonic commit counter. Never silently fall back to a shallow clone count.

All three components must be numeric and match the exact same source commit used to build the APK.

## Persistence and determinism

- Persist the current MAJOR baseline, last-accounted calendar month, and any pending/recorded intentional major-change increment in a tracked, reviewable NSiO version-state file or another durable repository-owned source.
- Use the Asia/Jakarta calendar boundary for month transitions. Every new calendar month increments MAJOR by one, even if no build ran during that month. If multiple month boundaries elapsed, increment once per elapsed boundary.
- Count an intentional substantial redesign/architecture/major-feature trigger independently from month transitions. If both are due for the same release, apply both increments (+2).
- The DAY component is computed from the current Asia/Jakarta date at build/version evaluation time.
- Re-running a workflow for the same commit and same effective date/state MUST produce the same version. A rerun must not consume another commit number or re-apply a previously recorded major-change trigger.
- Serialize state updates or use deterministic state transitions to prevent concurrent workflows from double-counting month or major-change increments.
- Never derive MAJOR from DAY. Never reset MAJOR at a year boundary.

## Android version fields and tags

- `versionName` MUST equal the tag without the leading `v.`, e.g. tag `v.2.13.251` maps to `versionName = "2.13.251"`.
- Android `versionCode` MUST be a monotonically increasing integer derived from the same commit ordinal, with a documented collision-safe encoding if platform integer constraints require it. Never use a lower or reused versionCode for a newer published build.
- The Git tag MUST be exactly `v.{MAJOR}.{DAY}.{COMMIT_NUMBER}` and point to the exact commit used for the APK.
- The APK manifest/build metadata, Git tag, GitHub Release title, release notes, update-check API response, and in-app displayed version MUST agree.

## Build and release publication gate

- A release is eligible only after the exact source commit has completed all required tests, lint/static checks, and release build successfully.
- Publish or update the GitHub Release only for the latest eligible successful main-branch commit. Do not let an older workflow that finishes late overwrite a newer successful release.
- Before publication, compare the candidate commit with the latest successful eligible main-branch build. If a newer successful commit exists, the older job MUST stop without publishing.
- The release tag must point to the tested commit, and the attached APK must be built from that same commit and version.
- If the newest commit's build fails, do not publish it. Keep the last successful release available; do not label a failed or unbuilt commit as latest.
- Serialize release publication (concurrency lock) and make the operation idempotent. Never create duplicate assets or move an existing immutable version tag to different content. If the same commit is rebuilt, reuse the same version identity and replace/re-upload assets only under an explicit, safe release-repair policy.
- Keep the update checker pointed at the official repository and compare numeric version components/versionCode, not lexicographic strings. Do not offer downgrades.
- Retain previous releases according to the app's retention policy; never delete the latest known-good release as part of artifact cleanup.

## Examples

| Event | Version |
|---|---|
| November 13, 2026, MAJOR 1, commit #250 | `v.1.13.250` |
| New commit on November 13, #251 | `v.1.13.251` |
| November 14, #252 | `v.1.14.252` |
| December 1 month boundary, #253 | `v.2.1.253` |
| Substantial redesign on December 1, #254 | `v.3.1.254` |
| A month boundary and a substantial redesign are both applied together | MAJOR increases by two, e.g. `v.4.1.255` if the prior MAJOR was 2 |

## Mandatory verification report

For every NSiO versioning/release change, report:
1. prior MAJOR, elapsed month boundaries, intentional major-change triggers, and resulting MAJOR;
2. Asia/Jakarta date and computed DAY;
3. commit-number input and computed tag, versionName, and versionCode;
4. source commit SHA;
5. test/lint/build conclusions;
6. release tag target SHA and attached APK provenance;
7. whether a newer successful commit exists;
8. update-checker consistency.

Never claim a release is current unless these facts have been verified.
