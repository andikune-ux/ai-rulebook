# Bug Fixing and Feature Completion Workflow

## Tujuan
Memastikan AI menyelesaikan masalah pada satu fitur secara tuntas, memvalidasi hasilnya, dan mengaudit perubahan sebelum berpindah ke fitur lain.

## Aturan wajib: satu fitur pada satu waktu
1. **Identifikasi fitur aktif.** Tentukan fitur, perilaku yang diharapkan, ruang lingkup, dependensi, dan kriteria selesai sebelum mengubah kode.
2. **Periksa fitur secara menyeluruh.** Telusuri implementasi, alur terkait, konfigurasi, dependensi, log/error yang tersedia, dan pengujian. Catat semua bug atau masalah yang ditemukan dalam fitur aktif.
3. **Prioritaskan masalah dalam fitur aktif.** Urutkan berdasarkan tingkat risiko, dampak pengguna, keamanan, dan kemungkinan kehilangan data. Jangan mulai memperbaiki fitur lain hanya karena ditemukan masalah lain di luar fitur aktif.
4. **Perbaiki sampai tuntas dalam ruang lingkup.** Tangani akar penyebab, bukan sekadar menyembunyikan gejala. Perbaiki seluruh masalah yang diketahui dan relevan pada fitur aktif, termasuk regresi yang muncul akibat perbaikan.
5. **Uji setiap perubahan dan fitur secara keseluruhan.** Jalankan pengujian yang sesuai: unit, integrasi, kontrak/API, UI, end-to-end, lint, type-check, build, atau security test sesuai platform dan risiko. Tambahkan atau perbarui tes regresi bila layak.
6. **Audit sebelum berpindah.** Tinjau diff lengkap, alur fitur, penanganan error, keamanan, permission, kompatibilitas, dampak data, dan potensi regresi. Pastikan tidak ada perubahan di luar scope yang tidak diperlukan.
7. **Tentukan status fitur.** Tandai fitur sebagai DONE hanya jika kriteria selesai terpenuhi, tes relevan lulus, dan audit tidak menemukan masalah terbuka yang menghalangi. Setelah itu baru pilih fitur berikutnya dan ulangi proses dari langkah pertama.
8. **Jangan berpindah diam-diam.** Jika fitur belum selesai, jangan menyatakan selesai atau melanjutkan ke fitur lain seolah-olah fitur aktif sudah beres. Laporkan masalah tersisa, alasan, dampak, dan langkah yang diperlukan.

## Jika terhalang
- Jika perbaikan memerlukan keputusan pengguna, akses, data uji, dependensi eksternal, atau persetujuan HIGH/CRITICAL, hentikan hanya tindakan yang terhalang. Lakukan pekerjaan aman yang tidak bergantung pada hal tersebut.
- Jangan melewati persetujuan risiko. Ikuti `core/RISK_POLICY.md`.
- Jika bug tidak dapat direproduksi, dokumentasikan bukti, kondisi, langkah reproduksi yang dicoba, dan ketidakpastian. Jangan mengarang penyebab atau hasil.
- Jika perbaikan menyentuh beberapa fitur yang saling bergantung, nyatakan dependensi dan urutan pengerjaan; tetap validasi setiap fitur sebelum menutup pekerjaannya.
- Jika ada kerentanan keamanan kritis atau risiko kehilangan data aktif, hentikan tindakan yang dapat memperbesar dampak, amankan kondisi, dan eskalasi sesuai Risk Policy.

## Definisi selesai (Definition of Done)
Fitur hanya boleh ditandai DONE jika:
- [ ] Perilaku yang diminta dan kriteria penerimaan terpenuhi.
- [ ] Semua bug dalam scope yang diketahui sudah diperbaiki, atau sisa yang tidak dapat diselesaikan dijelaskan secara eksplisit dan fitur tidak diklaim DONE.
- [ ] Tes relevan lulus; tes yang tidak dapat dijalankan diberi status NOT RUN beserta alasan dan dampaknya.
- [ ] Tidak ada tes yang dihapus/dilemahkan untuk menyembunyikan kegagalan.
- [ ] Audit diff, keamanan, kompatibilitas, error handling, dan regresi telah dilakukan.
- [ ] Tidak ada secret, data pribadi, file, atau perubahan di luar scope yang ikut terekspos/terubah tanpa alasan dan izin.
- [ ] Hasil, keterbatasan, dan risiko tersisa dilaporkan secara jujur.

## Pelaporan progres
Untuk setiap fitur, laporkan: nama fitur, masalah yang ditemukan, akar penyebab (jika terverifikasi), perubahan yang dilakukan, tes dan hasilnya, hasil audit, risiko tersisa, serta status DONE atau BLOCKED. Jangan gabungkan status beberapa fitur sehingga fitur yang belum selesai terlihat selesai.
