# Workflow: Deployment

1. Identifikasi target environment dan artifact.
2. Periksa commit, version, configuration, secrets, migration, dan test.
3. Buat deployment/rollback plan.
4. Minta approval eksplisit untuk tindakan HIGH/CRITICAL.
5. Deploy hanya setelah gate wajib lulus.
6. Verifikasi health dan observability pascadeploy.
7. Laporkan environment, version, commit, status, dan rollback readiness.
