# Android Platform Rules

Aturan ini hanya berlaku untuk proyek Android. Ikuti aturan universal di `core/` juga, terutama `core/MANDATORY_APP_CAPABILITIES.md`.

## Identitas dan signing DEV.ANDIKUNE
Aturan berikut adalah kebijakan khusus proyek yang secara eksplisit menggunakan identitas DEV.ANDIKUNE; bukan kewajiban semua proyek Android:
- Namespace/package dapat menggunakan prefix `dev.andikune` bila proyek pemilik memang menetapkannya.
- Signing key bernama/alias `andikune` hanya untuk aplikasi yang memang terikat pada signing identity tersebut.
- Jangan membuat atau mengganti signing key tanpa approval HIGH dan verifikasi fingerprint.
- Simpan signing material di GitHub Secrets atau secret manager; jangan commit keystore.

## Lima kapabilitas wajib aplikasi Android

### 1. Permission
- Deklarasikan permission yang benar-benar dibutuhkan pada manifest dan minta runtime permission pada waktu penggunaan untuk permission berbahaya.
- Tangani granted, denied, permanently denied, revoked, dan fitur alternatif. Jangan meminta permission penyimpanan luas untuk file di direktori internal aplikasi.
- Ikuti Android version-specific permission, foreground service type, notification, media, location, dan background execution restrictions.

### 2. Service.kt / Helper.kt
- Evaluasi kebutuhan komponen service/helper berdasarkan fungsi aplikasi.
- Buat `Service.kt` hanya bila benar-benar membutuhkan Android Service (background/foreground work) dan penuhi lifecycle, notification, foreground-service type, serta batasan OS.
- Buat `Helper.kt` atau helper bernama spesifik untuk fungsi reusable seperti file I/O, update checker, crash log, atau validasi bila bermanfaat.
- Jangan membuat service kosong hanya demi nama file. Gunakan WorkManager untuk pekerjaan tertunda/deferrable bila lebih tepat daripada service.

### 3. Crash log saat aplikasi dibuka kembali
- Tangkap uncaught Java/Kotlin exception dengan mekanisme yang tidak menghalangi default crash handler; simpan laporan lokal secara aman sebelum proses berakhir bila memungkinkan.
- Pada launch berikutnya, deteksi crash sebelumnya dan tampilkan layar/dialog crash report yang memuat waktu, versi aplikasi, jenis exception, pesan, dan stack trace.
- Sediakan tombol **Salin Log** dan **Kembali**. Tombol Kembali menutup tampilan laporan dan mengembalikan pengguna ke alur aplikasi yang aman.
- Jangan menampilkan atau menyimpan token, password, data pribadi sensitif. Batasi ukuran/retensi log dan cegah crash loop.
- Force-stop oleh pengguna, OS kill, mati daya, dan beberapa native crash tidak selalu dapat dideteksi sebagai crash; jelaskan batasannya. Jangan menyebut semua force-close sebagai crash.

### 4. Popup update dari GitHub Releases
- Periksa update stable saat startup secara asynchronous dengan timeout; jangan menahan tampilan utama jika jaringan lambat atau offline.
- Ambil versi dan release notes dari GitHub Releases API repository resmi yang dikonfigurasi. Abaikan draft/prerelease kecuali channel aplikasi memang mengaktifkannya.
- Bandingkan `versionCode`/versi numerik secara benar, bukan perbandingan string. Jangan downgrade.
- Popup memuat versi baru dan ringkasan perubahan dari release notes/changelog, dengan tombol:
  - **Skip**: simpan versi yang dilewati; popup tidak muncul lagi untuk versi itu atau versi lebih rendah, tetapi muncul saat ada versi lebih tinggi.
  - **Nanti**: tutup popup saat ini saja; cek ulang dan tampilkan lagi saat aplikasi dibuka berikutnya jika update masih tersedia.
  - **Update**: unduh artifact APK yang sesuai ABI/SDK dari release resmi, tampilkan progress dan error, verifikasi checksum/signature bila disediakan, lalu minta persetujuan instalasi Android.
- Untuk instalasi APK eksternal, periksa kemampuan `REQUEST_INSTALL_PACKAGES` dan arahkan pengguna ke pengaturan izin sumber instalasi hanya jika diperlukan. Jangan melewati konfirmasi sistem Android.
- Jangan menyematkan GitHub token privat dalam APK. Tangani rate limit, release tanpa APK, download terputus, ruang penyimpanan kurang, versi tidak kompatibel, dan kegagalan verifikasi.
- Simpan APK sementara di folder update internal aplikasi; hapus file sementara sesuai kebijakan setelah instalasi/retensi.

### 5. Struktur penyimpanan internal
Gunakan direktori internal privat aplikasi, bukan root shared storage. Struktur minimum:
```text
<internal files dir>/
└── <Nama Folder Aplikasi>/
    ├── Pembaruan Aplikasi/
    │   ├── <versi>.apk
    │   └── metadata.json
    └── Log Crash/
        ├── crash-<timestamp>.txt
        └── crash-index.json
```
- Di Android, base path biasanya `context.filesDir`; folder di atas dibuat di bawahnya.
- Jangan meminta `MANAGE_EXTERNAL_STORAGE` atau storage permission luas hanya untuk struktur ini.
- Gunakan file I/O aman, nama file tervalidasi, write atomik, batas ukuran, dan cleanup yang tidak menghapus data pengguna tanpa izin.
- Jika pengguna perlu mengekspor log, gunakan Android Sharesheet/FileProvider dengan URI content, bukan file:// URI.

## Build
- Gunakan Gradle Wrapper proyek dan versi JDK/Android Gradle Plugin yang kompatibel.
- Ikuti Kotlin DSL bila proyek memang menggunakannya; jangan migrasi build system tanpa alasan.
- Jalankan lint, unit test, dan build variant yang relevan.
- Verifikasi APK/AAB dan signature sebelum publikasi.
- Simpan checksum artifact bila release pipeline mendukungnya.

## Android quality
- Pertimbangkan lifecycle, process death, configuration changes, offline state, dan background restrictions.
- Uji kompatibilitas SDK/device yang didukung.
- Perhatikan accessibility, responsive layouts, memory leaks, dan battery impact.
- Gunakan migration database yang aman dan uji upgrade dari versi sebelumnya.

## Application versioning and release

- NSiO alone adopts `core/VERSIONING_RULES.md` with format `v.{MAJOR}.{DAY}.{COMMIT_NUMBER}`.
- In NSiO, MAJOR increments independently for every Asia/Jakarta calendar-month boundary and every intentional substantial application overhaul/major feature expansion. If both triggers occur, increment MAJOR twice.
- DAY is the real-time day-of-month (1–31) in Asia/Jakarta. COMMIT_NUMBER is NSiO's monotonic mainline commit ordinal, never a GitHub Actions run number.
- This rule does **not** authorize changes to Home IO. Preserve Home IO's current version format, Gradle configuration, workflows, tags, releases, and updater behavior unchanged unless separately requested.
- Ensure NSiO release publication is synchronized to the latest successful eligible commit; a failed build must never replace the last known-good release.

## Legacy DEV.ANDIKUNE signing
Secrets `ANDIKUNE_*`, signing identity, namespace, and related Gradle conventions are project-specific. Never impose them on other projects.
