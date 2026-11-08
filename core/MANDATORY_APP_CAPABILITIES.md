# Mandatory Application Capabilities — V3

These five capability groups are mandatory requirements for every new application and every substantial application build covered by this Rulebook. Implement them in a way that matches the detected platform, language, architecture, and distribution model. If a capability is genuinely unsupported, document the platform limitation and provide the safest equivalent; never silently omit it.

## 1. Permission and capability management
- Identify the permissions/capabilities required by each requested feature before implementation.
- Request only the minimum permissions necessary, at the point they are needed where the platform supports runtime requests.
- Explain the purpose to users, handle denial and permanent denial, and keep the app usable when optional permission is declined.
- Never request unrelated permissions or treat permission declaration as proof of user consent.
- Add tests for granted, denied, revoked, and unavailable permission states where applicable.
- Platform-specific permission rules and store policies take precedence.

## 2. Service/helper separation when needed
- Evaluate whether reusable service, manager, repository, utility, or helper modules are needed for reliable operation.
- Create and use appropriately named modules when separation improves lifecycle handling, networking, storage, background work, logging, or maintainability.
- For Kotlin Android projects, use `Service.kt` for genuine Android Service components and `Helper.kt` (or a clearer domain-specific name) for helper logic when appropriate.
- Do not create empty, redundant, or misleading files merely to satisfy a filename requirement. A Kotlin Android Service must follow Android component lifecycle and foreground-service restrictions.
- Keep business logic testable and avoid placing all behavior in UI/activity classes.

## 3. Crash recovery and crash-log viewer
- Provide a crash recovery path so that after an unexpected app crash/force-close, the next launch can detect and present the previous crash report.
- The report screen must show useful diagnostic details and provide a one-tap **Copy log** action and a **Back** action.
- Persist logs safely before process termination when possible. Include timestamp, app version/build, platform/runtime details, exception type/message, and stack trace; redact secrets and sensitive personal data.
- Do not claim to capture every force-stop, power loss, OS kill, or native crash. Explain platform limitations and use platform-supported crash reporting where appropriate.
- Prevent recursive crash loops: guard report parsing/rendering, cap log size, and allow dismissal/recovery without repeatedly crashing.
- Ask for user consent before transmitting crash data to external services. Local crash logging must work without network access.

## 4. Release update notification
- At application startup, check the configured trusted release source for a newer stable version, subject to network availability and a sensible timeout/cache policy.
- For GitHub-distributed applications, use the configured repository's Releases API or an equivalent trusted release endpoint. Verify repository identity, release channel, version ordering, and artifact integrity (checksum/signature where available). Never install an untrusted arbitrary URL.
- Show an update dialog when a newer applicable release is available. Include version, release date when available, and a human-readable list of changes from release notes/changelog.
- Provide three actions with exact semantics:
  - **Skip**: suppress this specific version; show the prompt again only when a higher version is available.
  - **Later**: dismiss this prompt for now; check and show it again on the next application launch if the same update remains available.
  - **Update**: begin downloading the selected release and show download/progress/error state. Complete installation only through the platform's approved user-consent and package-install flow.
- Do not force an update unless the product owner explicitly defines a supported critical-update policy. Do not block app startup solely because the update endpoint is unavailable.
- Handle no network, rate limiting, no release, prerelease/beta filtering, incompatible device/OS, missing artifact, checksum failure, interrupted download, and insufficient storage.
- Store the skipped version and update state using durable local preferences. Do not mark a version skipped when the user chooses Later.
- Update checks and downloads must not expose tokens or embed private GitHub credentials in a client application. Public releases should use public read access.

## 5. Structured application file storage
- Create an app-owned root folder named after the application, then use clear category folders. At minimum, provide categories for **Application Updates** and **Crash Logs**.
- Use platform-appropriate private app storage by default. On Android, prefer the app-specific internal files directory, for example:
  `files/<ApplicationFolder>/Application Updates/`
  `files/<ApplicationFolder>/Crash Logs/`
- Save relevant artifacts in suitable formats, such as APK, TXT, JSON, or other formats required by the feature. Use safe filenames, atomic writes, bounded retention, and adequate free-space checks.
- Never store credentials, private signing keys, or unredacted sensitive data in these folders.
- Do not write directly to shared storage or request broad storage permissions when app-specific storage is sufficient. If users need to export or browse files, use platform-approved file picker/share mechanisms and explain that export is separate from private app storage.
- Define cleanup rules for obsolete downloads and old logs; never delete user-created data without authorization.

## Acceptance evidence
For each application, document implementation paths, platform limitations, and validation evidence for all five groups. Mark each item PASS, FAIL, NOT RUN, or NOT APPLICABLE with a reason. NOT APPLICABLE requires a specific platform/product justification and a documented equivalent where possible.
