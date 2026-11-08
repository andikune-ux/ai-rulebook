# Build Guide

## Prasyarat repository aplikasi
Repository aplikasi harus memiliki:
- Gradle Wrapper (`gradlew` dan `gradle/wrapper/`).
- Modul Android `app`.
- `app/build.gradle.kts` yang membaca `-PversionName` dan `-PversionCode`.
- Signing config yang membaca environment variables, bukan nilai rahasia hardcoded.

## Pasang template
1. Salin `templates/workflow-build.yml` ke `.github/workflows/build-release.yml` pada repository aplikasi.
2. Salin `scripts/generate-version.sh` ke `scripts/generate-version.sh` pada repository aplikasi.
3. Beri izin executable pada script: `chmod +x scripts/generate-version.sh`.
4. Terapkan snippet `templates/app-build.gradle.kts.snippet` ke dalam `defaultConfig { }` di `app/build.gradle.kts`. Gabungkan dengan konfigurasi yang sudah ada; jangan membuat blok `defaultConfig` kedua.
5. Pastikan signing config memakai:
   - `ANDIKUNE_KEYSTORE_PATH`
   - `ANDIKUNE_KEYSTORE_PASSWORD`
   - `ANDIKUNE_KEY_ALIAS`
   - `ANDIKUNE_KEY_PASSWORD`

## GitHub Secrets
Buka repository aplikasi → Settings → Secrets and variables → Actions → New repository secret. Buat empat secret berikut:
- `ANDIKUNE_KEYSTORE_BASE64`: isi keystore dalam format Base64.
- `ANDIKUNE_KEYSTORE_PASSWORD`: password keystore.
- `ANDIKUNE_KEY_ALIAS`: alias yang sudah ada pada keystore.
- `ANDIKUNE_KEY_PASSWORD`: password key.

Jangan masukkan nilai rahasia ke repository atau chat. Pastikan fingerprint sertifikat sama dengan release sebelumnya.

## Cara kerja versi
- `BASE_YEAR`, `BASE_MONTH`, dan `BASE_VERSION` menentukan MAJOR awal.
- MAJOR naik satu setiap pergantian bulan.
- DAY menggunakan tanggal Asia/Jakarta.
- RUN menggunakan `github.run_number` dari workflow yang sama.
- Tag dan versionName: `v.{MAJOR}.{DAY}.{RUN}` dan `{MAJOR}.{DAY}.{RUN}`.
- Android versionCode menggunakan RUN. Karena run_number meningkat untuk setiap run workflow yang sama, versionCode ikut meningkat. Jangan memulai ulang atau mengganti workflow release tanpa strategi migrasi versionCode.

## Catatan penting
Template ini adalah baseline dan harus disesuaikan dengan modul serta task proyek aplikasi. Repository AI Rulebook sendiri tidak memiliki Gradle Wrapper atau project Android, jadi workflow template tidak otomatis berjalan di repository ini. Setelah dipasang ke repository aplikasi, jalankan workflow dan periksa semua job sebelum menyatakan release berhasil.
