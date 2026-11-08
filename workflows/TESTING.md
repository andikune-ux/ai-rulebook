# Testing Workflow — V3

1. Identify changed behavior and the highest-risk failure modes.
2. Select applicable unit, integration, contract, UI, end-to-end, migration, performance, or security tests.
3. Run focused tests first, then broader relevant suites.
4. Run configured formatter, linter, type checker, and static analysis.
5. Run the relevant build/package command.
6. Record exact commands, environment constraints, and results.
7. Mark unavailable or skipped checks as NOT RUN with a reason; do not convert them to PASS.
8. Add regression coverage for defects where practical.
