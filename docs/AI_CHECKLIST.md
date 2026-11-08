# AI Completion Checklist

Sebelum mengubah kode:
- [ ] Baca instruksi AI dan file asli yang akan diubah.
- [ ] Periksa `.aiignore`; jangan membaca atau mengubah file yang dikecualikan.
- [ ] Pastikan asumsi dan ruang lingkup jelas.
- [ ] Periksa apakah perubahan menyentuh file kritis atau signing identity.

Setelah mengubah kode:
- [ ] Audit diff dan pastikan tidak ada perubahan tidak diminta.
- [ ] Pastikan namespace/application ID sesuai `dev.andikune`.
- [ ] Pastikan tidak ada secret, keystore, atau private key di diff.
- [ ] Jalankan lint, unit test, dan pemeriksaan statis yang tersedia.
- [ ] Jalankan build release melalui GitHub Actions.
- [ ] Pastikan versionName dan versionCode diteruskan ke Gradle.
- [ ] Pastikan tag belum pernah dipakai sebelum publikasi.
- [ ] Pastikan GitHub Release berisi APK Release.
- [ ] Verifikasi artifact cleanup tidak menghapus GitHub Releases.
- [ ] Laporkan commit, run Actions, hasil pemeriksaan, versi, dan tautan APK.
- [ ] Jangan menyatakan selesai jika ada pemeriksaan yang gagal atau belum dijalankan.
