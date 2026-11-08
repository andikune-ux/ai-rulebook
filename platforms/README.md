# Platform Rule Loading — V3

Always load the universal rules in `core/`. Detect the actual project stack from manifests, lockfiles, project files, source layout, build configuration, and CI. Load every matching platform rule; monorepos may require several.

| Platform | Common indicators | Rule file |
|---|---|---|
| Android | Android Gradle Plugin, AndroidManifest.xml | `android/RULES.md` |
| iOS | .xcodeproj, .xcworkspace, Package.swift | `ios/RULES.md` |
| Web | package.json, frontend framework/bundler config | `web/RULES.md` |
| Backend | service entrypoints, server framework manifests | `backend/RULES.md` |
| Desktop | desktop packaging/runtime configuration | `desktop/RULES.md` |
| Cross-platform | Flutter, React Native, .NET MAUI | `cross-platform/RULES.md` |
| API/integration | OpenAPI, GraphQL schema, API service | `api/RULES.md` |

Do not infer a platform solely from a folder name. Confirm with project evidence. If technology is unfamiliar, apply core rules and consult authoritative documentation before platform-specific changes.

Rules are additive: core security, privacy, data integrity, and approval requirements always apply. Platform guidance cannot weaken them.
