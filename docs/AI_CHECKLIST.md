# AI Completion Checklist V3

## Sebelum mengubah kode
- [ ] Baca AGENTS.md atau CLAUDE.md dan periksa .aiignore.
- [ ] Inspeksi struktur, manifest, konfigurasi, dependency, dan dokumentasi.
- [ ] Deteksi semua platform/stack yang relevan; jangan menebak.
- [ ] Baca aturan core dan platform terkait.
- [ ] Tentukan scope, acceptance criteria, dan risk level.
- [ ] Minta approval sebelum tindakan HIGH/CRITICAL.

## Setelah mengubah kode
- [ ] Audit diff dan pastikan tidak ada perubahan tidak diminta.
- [ ] Pastikan tidak ada secret, credential, atau data pribadi di diff/log.
- [ ] Jalankan test, lint, type-check, security check, dan build yang relevan.
- [ ] Pastikan data migration, compatibility, dan rollback dipertimbangkan.
- [ ] Perbarui dokumentasi bila perilaku atau konfigurasi berubah.
- [ ] Catat hasil setiap pemeriksaan sebagai PASS, FAIL, NOT RUN, atau NOT APPLICABLE.
- [ ] Laporkan file berubah, risiko, approval, hasil, bukti, dan masalah tersisa.
- [ ] Jangan menyatakan SUCCESS jika pemeriksaan wajib gagal atau belum dijalankan.

Aturan Android DEV.ANDIKUNE hanya berlaku jika proyek yang dikerjakan memang Android dan pemilik menetapkan identitas tersebut. Lihat platforms/android/RULES.md.
