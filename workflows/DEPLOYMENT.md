# Deployment Workflow — V3

1. Identify target environment, source revision, release version, and deployment scope.
2. Classify deployment risk. Production changes are HIGH unless a documented pre-authorization policy explicitly covers the exact action.
3. Obtain required approval before publishing or deploying.
4. Verify required tests, security checks, build, configuration, and artifact integrity.
5. Confirm secrets are supplied through approved secret storage and are not exposed to untrusted jobs.
6. Confirm migration ordering, backup/recovery, observability, and rollback/forward-fix plan.
7. Deploy using the project's established process; do not invent a deployment mechanism.
8. Verify health and critical user journeys after deployment.
9. Report commit, environment, artifact/version, verification evidence, and unresolved risks.
