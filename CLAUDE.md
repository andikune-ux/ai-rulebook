# ATURAN MUTLAK AI — DEV.ANDIKUNE
## 📛 Identitas & Keamanan
1. **Namespace Wajib:** Semua package dan ID aplikasi wajib `dev.andikune` (dilarang `com/example`).
2. **Signing Key Konsisten:** Keystore, alias, dan secret wajib bernama `andikune`. Dilarang meregenerate atau mengganti nama.
3. **Tujuan Key:** Memastikan aplikasi bisa di-update tanpa bentrok (`INSTALL_FAILED_UPDATE_INCOMPATIBLE`). Keystore = aset permanen.
## 🧠 Perilaku & Etika AI
4. **Baca Dulu:** Sebelum mengedit, AI wajib membaca file aslinya. Dilarang menebak atau menimpa kode sembarangan.
5. **Sempurnakan:** Setiap menyentuh kode, AI wajib ikut menyempurnakan UI/UX dan logikanya (bukan sekadar "asal jalan").
6. **Bug & Opsi B:** Jika menemukan bug, AI tidak boleh memblokir permintaan user. Kerjakan permintaan user, lalu tawarkan Opsi B (solusi yang lebih stabil) beserta alasannya.
7. **Klarifikasi:** Jika permintaan kurang lengkap, AI wajib memberi saran, menyebut asumsi, dan menawarkan opsi. Jangan diam-diam menebak.
8. **Riset Dulu:** Sebelum membuat fitur rumit, AI wajib riset (cek dokumentasi, GitHub issues, komunitas) untuk mencari tahu bug umum dan best practice-nya.
9. **Audit Kesesuaian:** Setelah membuat/memperbaiki kode, AI WAJIB mengaudit ulang hasilnya. Pastikan 100% sesuai permintaan user, tidak ada yang terlewat, dan tidak menambah fitur yang tidak diminta (hindari over-engineering).
## 📦 Dependency & Library
10. **Boleh Tambah, Tapi Lapor & Tanya:** AI boleh menambah library untuk membuat aplikasi berjalan lebih baik, TAPI wajib lapor nama & alasannya. Jika ada beberapa opsi, tanya dulu ke user.
## ⚙️ Build & Validasi
11. **Selalu Build di GitHub:** Semua perubahan wajib di-push dan di-build via GitHub Actions. Build lokal hanya untuk cek cepat.
12. **Validasi Ketat:** AI dilarang bilang "Selesai" jika Lint, Typecheck, Unit Test, dan Build belum lulus (hijau).
13. **Paralel:** Workflow GitHub Actions wajib menjalankan Unit Test dan Build APK secara paralel (bersamaan), bukan berurutan.
## 📱 Release & Versioning
14. **Build Release & Anti-Menumpuk:** Build menghasilkan APK Release. Jika versi/tag sudah ada, AI dilarang meng-upload release baru (hemat storage).
15. **Auto-Cleanup Artifact:** Workflow wajib menghapus artifact lama dan hanya menyisakan 3 artifact terbaru.
16. **Format Versi:** `v.{MAJOR}.{DAY}.{RUN}` (Contoh: `v.1.8.243`). Angka `RUN` harus terus naik, dan format titik setelah `v` dipertahankan.
17. **Zero-Touch Build:** User tidak boleh disuruh setup JDK/Gradle/Keystore secara lokal. Semua otomatis di CI. User hanya menerima APK jadi di GitHub Releases.
18. **Kotlin & Gradle KTS:** Proyek menggunakan Kotlin dan Gradle Kotlin DSL (`.kts`). Dilarang menggunakan Groovy (`build.gradle`).
## 🔒 Setup Awal & Kunci File (Aturan Kritis)
19. **Fase Setup Awal:** Di awal proyek, AI WAJIB membuat semua file setup build secara lengkap (Workflow CI/CD, konfigurasi signing `andikune`, dll) agar user bisa langsung menerima APK jadi tanpa setup manual.
20. **Fase Perbaikan (DILARANG SENTUH):** Setelah setup selesai, AI DILARANG KERAS menyentuh, mengedit, atau mengubah file-file berikut tanpa instruksi eksplisit: `.github/workflows/*.yml` (Workflow Build & Release), Konfigurasi `signingConfigs` di `app/build.gradle.kts`, File `scripts/generate-version.sh`, File `gradle.properties`. (Alasan: File-file tersebut adalah "jantung" dari keamanan aplikasi. Jika AI mengubahnya di tengah jalan, aplikasi akan gagal update/bentrok).
## 🚫 LARANGAN UMUM
- ❌ Jangan pernah menghapus kode tanpa instruksi eksplisit.
- ❌ Jangan gunakan `any` atau `@ts-ignore` (atau sejenisnya) untuk "menghilangkan" error.
- ❌ Jangan memformat ulang file yang tidak diubah (menghindari diff raksasa).
- ❌ Jangan sentuh file/folder yang ada di `.aiignore`.
