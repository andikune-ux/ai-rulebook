# Development Workflow — V3

1. Complete project discovery and load applicable rules.
2. Translate the request into observable acceptance criteria.
3. Inspect relevant implementation, tests, callers, and configuration.
4. Classify the highest risk using `core/RISK_POLICY.md`.
5. Obtain explicit approval before HIGH or CRITICAL actions. MEDIUM changes may proceed only with clear scope, safeguards, validation, and reasonable rollback.
6. Implement the smallest complete change; preserve unrelated user changes.
7. Add or update tests and documentation for changed behavior.
8. Run relevant formatters, linters, static analysis, tests, and builds.
9. Review the full diff for regressions, secrets, data impact, and scope creep.
10. Report evidence and remaining issues using `docs/AI_REPORT_TEMPLATE.md`.
