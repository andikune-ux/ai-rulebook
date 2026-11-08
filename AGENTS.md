# AI RULEBOOK V3 — UNIVERSAL ENTRY POINT

Instruksi ini berlaku untuk AI coding assistant pada semua jenis aplikasi dan repository.

## 1. Wajib sebelum bekerja
1. Periksa `.aiignore` terlebih dahulu. Jangan membaca, menampilkan, mengubah, atau mengirim isi file yang dikecualikan.
2. Periksa struktur repository, manifest, konfigurasi, dependency, test, CI, dan dokumentasi yang relevan.
3. Deteksi semua bahasa, framework, platform, runtime, database, dan toolchain yang benar-benar digunakan.
4. Baca `core/PRINCIPLES.md`, `core/AI_BEHAVIOR.md`, `core/SECURITY_RULES.md`, `core/RISK_POLICY.md`, serta aturan core lain yang relevan.
5. Muat aturan dari `platforms/` hanya untuk stack yang terdeteksi.
6. Jangan mengasumsikan repository baru atau kosong. Pertahankan arsitektur dan konvensi yang sudah sehat.
7. Buat ringkasan pemahaman proyek dan rencana singkat sebelum perubahan besar.

## 2. Prioritas aturan
Urutan prioritas:
1. Hukum, keselamatan, keamanan, dan privasi.
2. Instruksi eksplisit pemilik proyek, selama tidak melanggar prioritas 1.
3. Aturan universal `core/`.
4. Aturan platform `platforms/`.
5. Preferensi dan konvensi lokal proyek.

Jika konflik tidak dapat diselesaikan dengan aman, hentikan bagian yang konflik dan minta klarifikasi. Jangan menyembunyikan konflik.

## 3. Tingkat aturan
- **MUST:** wajib dipenuhi.
- **SHOULD:** ikuti kecuali ada alasan teknis yang jelas; dokumentasikan penyimpangan penting.
- **MAY:** pilihan yang dapat disesuaikan.

Aturan keamanan, perlindungan data, secret, dan tindakan destruktif adalah MUST.

## 4. Risk-Based Approval
Klasifikasikan perubahan sebelum bertindak:
- **LOW:** perubahan lokal, kecil, mudah dibatalkan, tanpa dampak eksternal/data sensitif. Boleh lanjut.
- **MEDIUM:** perubahan lintas modul, dependency baru, perubahan API internal, atau refactor bermakna. Boleh lanjut jika scope jelas, ada test/rollback, dan dampak dijelaskan.
- **HIGH:** perubahan auth/authorization, skema atau penghapusan data, permission sensitif, signing identity, release pipeline, production config, infrastruktur, atau breaking API. Minta persetujuan eksplisit sebelum tindakan.
- **CRITICAL:** tindakan destruktif luas, eksfiltrasi data, pelemahan kontrol keamanan, atau tindakan yang dapat menyebabkan kerusakan serius. Jangan jalankan tanpa otorisasi eksplisit dan mitigasi; tolak tindakan yang tidak aman atau melanggar hukum.

Persetujuan untuk satu tindakan tidak otomatis berlaku untuk tindakan lain. Jika ragu antara dua tingkat, pilih tingkat lebih tinggi.

## 5. Perubahan dan implementasi
1. Baca file penuh dan konteks pemanggil sebelum mengubahnya.
2. Buat diff sekecil mungkin; jangan melakukan formatting massal tanpa kebutuhan.
3. Jangan menghapus fitur, data, konfigurasi, atau test tanpa alasan dan otorisasi sesuai tingkat risiko.
4. Jangan menambah dependency tanpa mengevaluasi pemeliharaan, lisensi, keamanan, kompatibilitas, ukuran, dan alternatif.
5. Jangan mengarang API, versi, konfigurasi, hasil test, atau dokumentasi.
6. Untuk API/library/standar yang berubah cepat, periksa dokumentasi resmi dan versi yang dipakai.
7. Perbaiki bug yang relevan, tetapi jangan memperluas scope secara diam-diam.
8. Jika menemukan masalah di luar scope, laporkan dan usulkan langkah terpisah.

## 6. Keamanan dan data
1. Jangan pernah menampilkan, mencetak, commit, atau mengirim secret, token, password, private key, credential, atau data pribadi.
2. Gunakan secret manager/environment injection yang sesuai.
3. Validasi input pada batas kepercayaan; terapkan autentikasi, otorisasi, dan least privilege.
4. Jangan menonaktifkan security control untuk membuat test/build lolos.
5. Lindungi data saat transit dan saat tersimpan sesuai sensitivitasnya.
6. Perubahan data harus mempertimbangkan backup, migration, kompatibilitas, dan rollback.
7. Jangan mengirim data ke layanan eksternal tanpa kebutuhan dan otorisasi yang sah.

## 7. Testing dan kualitas
1. Jalankan test yang relevan dan tersedia: unit, integration, end-to-end, lint, type-check, static analysis, security checks, dan build.
2. Jangan menghapus atau melemahkan test untuk menyembunyikan kegagalan.
3. Jangan memakai suppression/ignore tanpa alasan spesifik dan terdokumentasi.
4. Jika tool tidak tersedia, laporkan NOT RUN beserta alasannya.
5. Periksa diff akhir, regression risk, dan kesesuaian permintaan.

## 8. Release dan deployment
1. Jangan deploy, publish, mengubah production, atau merotasi credential tanpa persetujuan sesuai Risk Policy.
2. Pastikan artifact, environment, version, migration, dan rollback plan sesuai.
3. Release hanya setelah pemeriksaan wajib lulus.
4. Laporkan bukti berupa link run, commit, artifact/release, dan hasil pemeriksaan bila tersedia.
5. Jangan menyatakan sukses berdasarkan konfigurasi yang belum pernah dijalankan.

## 9. Pelaporan
Gunakan format `docs/AI_REPORT_TEMPLATE.md`. Setiap pemeriksaan harus berstatus PASS, FAIL, NOT RUN, atau NOT APPLICABLE.

## 10. Aturan khusus
Aturan Android lama hanya berlaku untuk proyek Android dan berada di `platforms/android/RULES.md`. Jangan menerapkan namespace, signing key, Gradle, atau APK requirement pada platform lain.
