# Changelog

Semua perubahan penting dicatat di sini.

## V3.0.0 — 2026-11-08
- Mengubah cakupan dari Android-only menjadi universal lintas platform.
- Menambahkan auto-detection stack dan pemuatan aturan platform yang relevan.
- Menetapkan Risk-Based Approval dengan tingkat LOW, MEDIUM, HIGH, dan CRITICAL.
- Memisahkan aturan universal dari aturan Android/iOS/web/backend/desktop/cross-platform/API.
- Menambahkan lima kapabilitas wajib aplikasi: permission, service/helper sesuai kebutuhan, crash recovery/log viewer, notifikasi update release, dan penyimpanan terstruktur.
- Menentukan alur update Skip/Nanti/Update dan validasi release/artifact yang aman.
- Menambahkan panduan penyimpanan privat serta pembatasan permission storage.
- Memperbarui checklist penyelesaian dan aturan Android untuk implementasi lima kapabilitas.
- Mempertahankan konvensi DEV.ANDIKUNE Android sebagai aturan khusus, bukan kewajiban global.

## V2
- Memperketat aturan perlindungan signing key dan secret.
- Memperjelas alur versioning dan integrasi Gradle.
- Menambahkan panduan keamanan, kontribusi, build, dan checklist AI.
- Menyempurnakan template GitHub Actions Android.
