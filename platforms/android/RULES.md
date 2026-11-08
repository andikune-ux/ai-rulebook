# Android Platform Rules

Aturan ini hanya berlaku untuk proyek Android. Ikuti aturan universal di `core/` juga.

## Identitas dan signing DEV.ANDIKUNE
Aturan berikut adalah kebijakan khusus proyek yang secara eksplisit menggunakan identitas DEV.ANDIKUNE; bukan kewajiban semua proyek Android:
- Namespace/package dapat menggunakan prefix `dev.andikune` bila proyek pemilik memang menetapkannya.
- Signing key bernama/alias `andikune` hanya untuk aplikasi yang memang terikat pada signing identity tersebut.
- Jangan membuat atau mengganti signing key tanpa approval HIGH dan verifikasi fingerprint.
- Simpan signing material di GitHub Secrets atau secret manager; jangan commit keystore.

## Build
- Gunakan Gradle Wrapper proyek dan versi JDK/Android Gradle Plugin yang kompatibel.
- Ikuti Kotlin DSL bila proyek memang menggunakannya; jangan migrasi build system tanpa alasan.
- Jalankan lint, unit test, dan build variant yang relevan.
- Verifikasi APK/AAB dan signature sebelum publikasi.
- Simpan checksum artifact bila release pipeline mendukungnya.

## Android quality
- Minta permission hanya saat diperlukan dan jelaskan penggunaan data.
- Pertimbangkan lifecycle, process death, configuration changes, offline state, dan background restrictions.
- Uji kompatibilitas SDK/device yang didukung.
- Perhatikan accessibility, responsive layouts, memory leaks, dan battery impact.
- Gunakan migration database yang aman dan uji upgrade dari versi sebelumnya.

## Legacy DEV.ANDIKUNE release
Format versioning `v.{MAJOR}.{DAY}.{RUN}`, secrets `ANDIKUNE_*`, dan workflow `templates/workflow-build.yml` adalah konvensi legacy khusus aplikasi Android DEV.ANDIKUNE. Jangan terapkan ke platform atau aplikasi lain tanpa instruksi pemilik.
