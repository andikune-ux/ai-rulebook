# Release and Deployment Policy

- Pisahkan development, staging, dan production bila sesuai.
- Gunakan pipeline reproducible dan dependency/action version pinning sesuai kebijakan proyek.
- Jalankan test dan security checks sebelum release.
- HIGH-risk publish/deploy/rollback membutuhkan approval eksplisit.
- Pastikan migration, backup, observability, dan rollback/forward-fix plan siap.
- Catat version, commit, artifact, environment, dan hasil pipeline.
- Jangan menghapus release/tag atau melakukan force-push tanpa otorisasi.
