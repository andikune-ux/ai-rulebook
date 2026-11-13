# Application Versioning and Release Synchronization

This policy is the source of truth for application version numbers and release publication. It applies to the owner's application repositories when explicitly adopted (including NSiO and Home IO). Do not silently impose it on unrelated projects.

## Required version format

Use exactly:

`v.{MAJOR}.{MONTH_CYCLE}.{COMMIT_NUMBER}`

Example: `v.1.1.236`.

- `MAJOR`: persistent application generation. Increase by one only for a substantial application-wide redesign, architectural overhaul, or major feature expansion. It may also be increased deliberately by the owner. A month change alone MUST NOT increase MAJOR.
- `MONTH_CYCLE`: a persistent sequential month-cycle counter. It is NOT the calendar month number and MUST NOT reset in January. The owner-defined starting baseline is November 2026 = cycle 1; December 2026 = cycle 2; January 2027 = cycle 3; February 2027 = cycle 4, and so on. Advance exactly once for each new calendar month in Asia/Jakarta, even if no build ran during the month. If multiple months elapsed since the stored baseline, advance by the number of elapsed month boundaries. A major-version increase does not reset this counter.
- `COMMIT_NUMBER`: the monotonically increasing ordinal of the source commit in the target repository's intended mainline history (for example, commit #236 gives 236). It is not a GitHub Actions run number, workflow attempt, timestamp, or arbitrary tag suffix. Resolve it from full, non-shallow Git history or an explicitly maintained monotonic commit counter. Never silently fall back to run_number or a shallow clone count.

All three components must be numeric and match the exact same source commit used to build the APK.

## Persistence and determinism

- Persist the major baseline and month-cycle baseline/state in a tracked, reviewable version-state file or another durable repository-owned source. Do not derive MAJOR from the current month.
- Use the Asia/Jakarta calendar boundary for month-cycle transitions.
- Re-running a workflow for the same commit and same version-state MUST produce the same version. A rerun must not consume another commit number or month cycle.
- If a build happens after one or more month boundaries, calculate the cycle from the persisted last-accounted month and advance for each elapsed boundary exactly once. Update the persisted state deterministically; avoid concurrent jobs racing to update it.
- A major increment requires an intentional change to the persisted major value with a commit/release note explaining the substantial change. Do not infer a major bump from arbitrary file count or commit message keywords.

## Android version fields and tags

- `versionName` MUST equal the tag without the leading `v.`, e.g. tag `v.1.3.238` maps to `versionName = "1.3.238"`.
- Android `versionCode` MUST be a monotonically increasing integer derived from the same commit ordinal, with a documented collision-safe encoding if the platform's integer constraints require one. Never use a lower or reused versionCode for a newer published build.
- The Git tag MUST be exactly `v.{MAJOR}.{MONTH_CYCLE}.{COMMIT_NUMBER}` and point to the exact commit used for the APK.
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
| November 2026, commit #236 | `v.1.1.236` |
| Another commit in November, #237 | `v.1.1.237` |
| December 2026, #238 | `v.1.2.238` |
| January 2027, #239 | `v.1.3.239` |
| Major overhaul in January, #240 | `v.2.3.240` |
| February 2027, #241 | `v.2.4.241` |

## Mandatory verification report

For every versioning/release change, report:
1. major, month-cycle, and commit-number inputs;
2. computed tag, versionName, and versionCode;
3. source commit SHA;
4. test/lint/build conclusions;
5. release tag target SHA and attached APK provenance;
6. whether a newer successful commit exists;
7. update-checker consistency.

Never claim a release is current unless these facts have been verified.
