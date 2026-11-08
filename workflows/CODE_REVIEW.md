# Code Review Workflow — V3

Review the complete proposed diff, not only the summary.

## Review dimensions
- Correctness and requirement coverage.
- Security, privacy, authorization, and secret handling.
- Data integrity, migrations, backup, and recovery.
- API and backward compatibility.
- Error handling, reliability, concurrency, and performance.
- Accessibility and platform-specific behavior where relevant.
- Dependency health, license, provenance, and maintenance.
- Test quality and CI/release controls.
- Documentation and operational impact.

## Findings
For each finding, state severity (critical/high/medium/low), affected file or behavior, concrete impact, and actionable remediation. Distinguish confirmed defects from concerns requiring verification.

Do not approve changes with unresolved critical/high findings. Do not treat a green build as proof that security, correctness, or production readiness has been established.
