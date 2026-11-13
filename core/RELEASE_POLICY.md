# Release and Deployment Policy

- Pisahkan development, staging, dan production bila sesuai.
- Gunakan pipeline reproducible dan dependency/action version pinning sesuai kebijakan proyek.
- Jalankan test dan security checks sebelum release.
- HIGH-risk publish/deploy/rollback membutuhkan approval eksplisit.
- Pastikan migration, backup, observability, dan rollback/forward-fix plan siap.
- Catat version, commit, artifact, environment, dan hasil pipeline.
- Jangan menghapus release/tag atau melakukan force-push tanpa otorisasi.


## Version identity and release freshness
- Follow `core/VERSIONING_RULES.md` as the authoritative versioning policy for projects that adopt it.
- A release must be built from the exact tested commit and must never point to a failed, unbuilt, or older-than-latest-successful eligible commit.
- Verify tag, APK metadata, release notes, update-checker response, and source SHA agree before claiming publication is complete.
