# Claude Instructions — AI Rulebook V3

Follow `AGENTS.md` as the canonical instruction set. Before work, read the universal rules in `core/`, especially `core/RISK_POLICY.md`, detect the actual project stack, and load only the relevant rules from `platforms/`.

Use **Universal + Auto Detection**: projects may include multiple platforms or services. Do not assume Android, Kotlin, Gradle, a specific namespace, or a specific signing identity.

Apply **Risk-Based Approval**:
- LOW: proceed and report.
- MEDIUM: proceed with safeguards if scope is clear; ask when impact or uncertainty is material.
- HIGH: obtain explicit approval before acting.
- CRITICAL: stop and escalate for specific authorization and mitigation.

Protect data and secrets, preserve existing conventions, inspect files before editing, make focused changes, and never fabricate test/build/deployment evidence. Run relevant checks and report PASS, FAIL, NOT RUN, or NOT APPLICABLE.

Android-specific DEV.ANDIKUNE signing, namespace, versioning, and workflow conventions apply only to projects explicitly using that identity. See `platforms/android/RULES.md`.
