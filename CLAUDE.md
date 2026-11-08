# ATURAN MUTLAK AI — DEV.ANDIKUNE

## 📛 Identitas & Keamanan
1. **Namespace Wajib:** Semua package dan ID aplikasi wajib `dev.andikune` (dilarang `com/example`).
2. **Signing Key Konsisten:** Keystore, alias, dan secret wajib bernama `andikune`. Dilarang meregenerate atau mengganti nama.
3. **Tujuan Key:** Memastikan aplikasi bisa di-update tanpa bentrok (`INSTALL_FAILED_UPDATE_INCOMPATIBLE`). Keystore adalah aset permanen.
4. **Rahasia:** Jangan pernah menampilkan, mencetak, meng-commit, mengunggah, atau memasukkan password/token/private key ke log, source code, artifact publik, maupun prompt. Gunakan GitHub Secrets.
5. **Keystore:** Jangan pernah membuat keystore baru atau mengganti signing identity jika keystore lama belum ditemukan. Hentikan proses release dan minta konfirmasi jika secret/keystore tidak tersedia atau fingerprint berubah.
6. **Fingerprint:** Pada setup awal, catat SHA-256 certificate fingerprint ke dokumentasi privat/aman. Pada release berikutnya, bandingkan fingerprint sebelum publikasi.

## 🧠 Perilaku & Etika AI
7. **Baca Dulu:** Sebelum mengedit, AI wajib membaca file asli dan instruksi terkait. Dilarang menebak atau menimpa kode sembarangan.
8. **Sempurnakan:** Setiap menyentuh kode, AI wajib memperbaiki UI/UX dan logika yang relevan tanpa mengubah ruang lingkup permintaan.
9. **Bug & Opsi B:** Jika menemukan bug, AI tidak boleh diam-diam mengabaikan permintaan. Jelaskan dampaknya, kerjakan bagian yang aman, lalu tawarkan Opsi B yang lebih stabil beserta alasannya.
10. **Klarifikasi:** Jika permintaan kurang lengkap atau berisiko, AI wajib menyebut asumsi dan bertanya sebelum mengambil keputusan yang tidak bisa dibatalkan.
11. **Riset Dulu:** Sebelum membuat fitur rumit atau memakai API/library yang berubah, AI wajib memeriksa dokumentasi resmi, release notes, GitHub issues, dan praktik keamanan terkini.
12. **Audit Kesesuaian:** Setelah mengubah kode, AI wajib mengaudit ulang hasilnya terhadap permintaan dan checklist. Jangan menambah fitur yang tidak diminta.
13. **Dependency:** Sebelum menambah library, laporkan nama, versi, ukuran/risiko, alasan, dan alternatif. Minta persetujuan jika ada lebih dari satu pilihan yang berdampak besar.
14. **Perubahan Terukur:** Buat diff sekecil mungkin. Jangan memformat ulang file yang tidak terkait.

## ⚙️ Build & Validasi
15. **Build di GitHub:** Build resmi wajib berjalan melalui GitHub Actions. Build lokal hanya untuk pemeriksaan cepat.
16. **Validasi Ketat:** Jangan menyatakan selesai atau siap rilis sebelum lint, unit test, pemeriksaan statis yang dikonfigurasi, dan build release berhasil.
17. **Paralel:** Unit Test/Lint dan Build APK harus berjalan paralel. Job publikasi wajib menunggu semua job wajib berhasil.
18. **Jangan Menutupi Error:** Dilarang memakai `any`, `@ts-ignore`, menonaktifkan lint, mengabaikan test, atau memakai `continue-on-error` untuk menyamarkan kegagalan.
19. **Reproducible Build:** Gunakan Gradle Wrapper yang tersimpan di repository aplikasi. Jangan mengandalkan versi Gradle yang kebetulan terpasang di runner.
20. **Bukti:** Laporkan tautan run Actions, status job, tag, dan tautan APK/Release. Jika belum diuji, nyatakan dengan jujur.

## 📱 Release & Versioning
21. **Format Versi:** Pertahankan format `v.{MAJOR}.{DAY}.{RUN}`, misalnya `v.1.8.243`.
22. **Perhitungan MAJOR:** MAJOR dihitung dari selisih bulan terhadap BASE_YEAR/BASE_MONTH dan BASE_VERSION, kecuali MANUAL_MAJOR diisi.
23. **DAY:** DAY mengikuti tanggal lokal Asia/Jakarta saat workflow berjalan.
24. **RUN:** RUN memakai `github.run_number` dari satu workflow release yang sama. Nomor ini meningkat pada setiap run workflow dan dipakai sebagai Android `versionCode`; jangan menggantinya dengan tanggal atau nomor yang bisa berulang.
25. **Integrasi Gradle:** Workflow wajib menjalankan `scripts/generate-version.sh` dan meneruskan `version_name` serta `version_code` ke Gradle. Konfigurasi `app/build.gradle.kts` wajib membaca project properties tersebut.
26. **Anti-Duplikat:** Periksa tag sebelum publikasi. Jika tag sudah ada, hentikan publikasi tanpa menimpa atau membuat release duplikat.
27. **Release APK:** Hanya publikasikan APK Release setelah seluruh pemeriksaan wajib lulus. Upload APK sebagai asset GitHub Release, bukan hanya sebagai Actions artifact.
28. **Artifact Cleanup:** Pertahankan tiga Actions artifact terbaru. Jangan menghapus GitHub Releases atau tag lama sebagai bagian dari cleanup artifact.
29. **Zero-Touch:** User tidak boleh disuruh memasang JDK/Gradle/keystore secara lokal untuk build CI. Semua secret dan signing dilakukan di GitHub Actions.

## 🔒 Setup Awal & File Kritis
30. **Setup Awal:** Pada proyek aplikasi baru, AI wajib menyiapkan workflow, Gradle Kotlin DSL, signing config, version integration, dan dokumentasi setup secara lengkap.
31. **File Kritis:** Setelah setup selesai, AI dilarang mengubah `.github/workflows/*.yml`, konfigurasi `signingConfigs` di `app/build.gradle.kts`, `scripts/generate-version.sh`, dan `gradle.properties` tanpa instruksi eksplisit user.
32. **Pengecualian Perbaikan:** Jika user secara eksplisit meminta perbaikan pada file kritis, AI boleh mengubahnya, tetapi wajib menjelaskan risiko, menjaga signing identity, dan memverifikasi hasilnya.
33. **Template vs Workflow Aktif:** File di `templates/` adalah contoh/template dan tidak berjalan otomatis. Workflow aktif harus disalin ke `.github/workflows/` pada repository aplikasi yang memiliki `gradlew` dan konfigurasi Android.

## 🚫 LARANGAN UMUM
- ❌ Jangan pernah menghapus kode tanpa instruksi eksplisit.
- ❌ Jangan pernah commit keystore, password, token, private key, atau file lokal rahasia.
- ❌ Jangan memformat ulang file yang tidak diubah.
- ❌ Jangan sentuh file/folder yang ada di `.aiignore`.
- ❌ Jangan menyatakan build/release berhasil tanpa bukti dari GitHub Actions.
