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

## Lima kapabilitas wajib aplikasi
Baca `core/MANDATORY_APP_CAPABILITIES.md`; semua kelompok berikut harus diimplementasikan atau memiliki justifikasi NOT APPLICABLE yang spesifik:
- [ ] Permission/capability minimum, penjelasan tujuan, dan alur penolakan.
- [ ] Service/helper/repository/module pendukung dibuat bila dibutuhkan; tidak ada file kosong atau komponen palsu.
- [ ] Crash recovery: laporan crash sebelumnya muncul pada launch berikutnya, tombol Salin Log dan Kembali tersedia, data sensitif disensor.
- [ ] Update checker startup: sumber release tepercaya, versi dan changelog, tombol Skip/Nanti/Update dengan semantik tepat, download dan instalasi aman.
- [ ] Penyimpanan privat terstruktur: folder nama aplikasi, kategori Pembaruan Aplikasi dan Log Crash, format file sesuai kebutuhan, retensi dan perlindungan data.

## Bukti penerimaan
- [ ] Catat lokasi kode, konfigurasi, dan test untuk setiap kapabilitas.
- [ ] Uji permission granted/denied.
- [ ] Uji simulasi crash dan tampilan laporan saat launch berikutnya.
- [ ] Uji update tersedia/tidak tersedia/offline, Skip, Nanti, Update, download gagal, dan verifikasi artifact.
- [ ] Uji struktur folder, baca/tulis, file rusak, ruang penyimpanan, dan cleanup.
- [ ] Laporkan setiap pemeriksaan sebagai PASS, FAIL, NOT RUN, atau NOT APPLICABLE beserta bukti/alasan.

Aturan Android DEV.ANDIKUNE hanya berlaku jika proyek yang dikerjakan memang Android dan pemilik menetapkan identitas tersebut. Lihat platforms/android/RULES.md.
