# AI Rulebook — DEV.ANDIKUNE

Repository ini adalah pusat aturan dan template untuk AI yang membangun aplikasi Android menggunakan Kotlin, Gradle Kotlin DSL, dan GitHub Actions.

## Repository ini
- Aturan AI: `CLAUDE.md` dan `AGENTS.md`
- File yang tidak boleh dibaca AI: `.aiignore`
- Template workflow CI/CD: `templates/workflow-build.yml`
- Integrasi versi Gradle: `templates/app-build.gradle.kts.snippet`
- Script versi otomatis: `scripts/generate-version.sh`
- Panduan build: `docs/BUILD_GUIDE.md`
- Checklist AI: `docs/AI_CHECKLIST.md`
- Keamanan: `SECURITY.md`

## Cara menggunakan
Kirim prompt berikut kepada AI:

> Buat aplikasi Android bernama [Nama Aplikasi] menggunakan Kotlin. Sebelum menulis atau mengubah kode, baca seluruh instruksi di https://github.com/andikune-ux/ai-rulebook, terutama AGENTS.md atau CLAUDE.md. Ikuti aturan namespace dev.andikune, signing key andikune, Gradle Kotlin DSL, versioning, validasi, keamanan, dan GitHub Actions. Jangan mengarang konfigurasi atau mengubah file kritis tanpa izin eksplisit. Siapkan build CI agar saya menerima APK Release melalui GitHub Releases.

## Setup pada repository aplikasi
1. Salin instruksi `AGENTS.md` dan/atau `CLAUDE.md` ke repository aplikasi.
2. Salin `templates/workflow-build.yml` ke `.github/workflows/build-release.yml`.
3. Integrasikan `templates/app-build.gradle.kts.snippet` ke `app/build.gradle.kts`.
4. Salin `scripts/generate-version.sh` ke folder `scripts/` dan pastikan executable (`chmod +x`).
5. Atur GitHub Secrets sesuai `docs/BUILD_GUIDE.md`.
6. Pastikan repository aplikasi memiliki Gradle Wrapper (`gradlew`, `gradlew.bat`, dan `gradle/wrapper/`).

**Penting:** Repository AI Rulebook ini adalah repository instruksi/template, bukan project Android. Workflow di folder `templates/` tidak berjalan otomatis di repository ini. Workflow harus dipasang pada repository aplikasi.

## Versioning
Format tag dan versionName adalah `v.{MAJOR}.{DAY}.{RUN}`. `MAJOR` naik berdasarkan bulan, `DAY` mengikuti tanggal Asia/Jakarta, dan `RUN` memakai nomor run GitHub Actions. `versionCode` memakai RUN dari workflow release yang sama sehingga meningkat setiap run workflow tersebut.

## Prinsip
Keamanan signing key lebih penting daripada memaksakan release. Jika secret hilang, fingerprint berubah, atau build gagal, hentikan publikasi dan jelaskan masalahnya. Jangan pernah membuat signing key pengganti secara otomatis.
