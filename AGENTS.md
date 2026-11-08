# AI Agent Instructions — AI Rulebook V3

This repository defines universal rules for AI-assisted software development. These instructions apply to every project type.

## Required rule loading
1. Read `core/PRINCIPLES.md`, `core/AI_BEHAVIOR.md`, `core/CODING_STANDARDS.md`, `core/SECURITY_RULES.md`, `core/TESTING_RULES.md`, `core/DATABASE_RULES.md`, `core/RELEASE_POLICY.md`, `core/RISK_POLICY.md`, `core/MANDATORY_APP_CAPABILITIES.md`, and `core/BUGFIX_WORKFLOW.md`.
2. Inspect the target repository and detect all relevant platforms from manifests, lockfiles, project files, source layout, and CI.
3. Load matching rules from `platforms/`. Do not assume Android or any single stack.
4. Follow applicable procedures in `workflows/`. Use `templates/project-profile.yml` when a durable project profile is useful.
5. Check `.aiignore` and equivalent exclusions before inspecting files.
6. For application builds, account for all five mandatory capability groups and record evidence or a justified NOT APPLICABLE status.

## Risk-based approval
- LOW: proceed; report and validate.
- MEDIUM: proceed with safeguards when scope and impact are understood; ask approval if material uncertainty or impact remains.
- HIGH: explicit approval required before action.
- CRITICAL: stop and escalate; require specific authorization and mitigation. Refuse illegal, unsafe, or privacy-violating actions.
- Classify by impact, scope, sensitivity, external exposure, and reversibility. Use the highest applicable level.
- Tool access, repository access, or a broad request to "fix it" is not approval for a high-risk action.

## Mandatory feature-by-feature bug fixing
- Follow `core/BUGFIX_WORKFLOW.md` whenever fixing bugs, repairing broken behavior, or auditing/fixing multiple features.
- Work on one active feature at a time. Identify its scope and acceptance criteria, inspect it, record its known issues, fix the root causes, and run relevant regression tests.
- Audit the complete feature and diff before marking it DONE. Only then move to the next feature.
- Record issues discovered in other features in a queue; do not silently switch focus. Emergency containment for an active safety, security, or data-loss incident is the only exception and remains subject to Risk Policy.
- If blocked by missing information, external access, or required approval, mark the feature BLOCKED and explain what is needed. Never claim it is DONE.

## Non-negotiable rules
- Protect secrets, user data, privacy, and system integrity.
- Never commit, print, or expose credentials, private keys, signing material, or sensitive data.
- Never delete or irreversibly alter user/production data without explicit approval.
- Never disable security controls or weaken tests to hide failures.
- Never invent commands, APIs, test results, build results, commits, or deployment status.
- Preserve existing architecture and compatibility unless the requested change justifies otherwise.
- Inspect original files and the complete diff; make the smallest complete change.
- Research authoritative documentation for unfamiliar or fast-changing technology.
- Keep assumptions, limitations, and residual risks visible.

## Validation and reporting
Run relevant formatters, linters, static analysis, tests, and builds when available. Report each as PASS, FAIL, NOT RUN, or NOT APPLICABLE with evidence. A successful build alone is not a security audit or proof of correctness. Use `docs/AI_REPORT_TEMPLATE.md` for substantial work.

## Scope separation
The Android signing identity `andikune`, namespace `dev.andikune`, version format, `ANDIKUNE_*` secrets, and Android Gradle/Actions templates are legacy project-specific conventions. Never impose them on other projects. See `platforms/android/RULES.md`.
