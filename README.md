# AI Rulebook V3 — Universal

AI Rulebook adalah pusat instruksi dan standar kerja untuk AI coding assistant pada **semua jenis aplikasi**. V3 menggunakan **Universal + Auto Detection** dan **Risk-Based Approval** dengan prinsip ketat tetapi fleksibel.

## Keputusan V3
- **Platform:** Universal; deteksi otomatis satu atau lebih platform.
- **Approval:** Risk-based — LOW, MEDIUM, HIGH, CRITICAL.
- **Target:** V3 major release.
- **Aturan inti:** selalu berlaku; aturan platform hanya dimuat jika relevan.

## Cakupan
Android, iOS, web, backend, desktop, cross-platform, API/integrasi, database, cloud, dan CI/CD. Teknologi lain tetap dicakup oleh aturan inti dan dokumentasi resmi ekosistemnya.

## Mulai menggunakan
1. Minta AI memeriksa repository, status kerja, instruksi, manifest, lockfile, build system, dan CI sebelum mengubah apa pun.
2. Muat `core/` dan `core/RISK_POLICY.md`.
3. Deteksi semua platform yang relevan, lalu muat aturan di `platforms/<platform>/RULES.md`.
4. Ikuti workflow di `workflows/` dan isi `templates/project-profile.yml` bila berguna.
5. Jalankan validasi yang benar-benar tersedia dan laporkan status dengan bukti.

Prompt awal:

> Baca AI Rulebook V3 dari https://github.com/andikune-ux/ai-rulebook. Audit repository dan deteksi otomatis semua platform, bahasa, framework, build system, database, serta target deployment. Terapkan seluruh aturan core dan risk-based approval, lalu muat hanya aturan platform yang relevan. Sebelum perubahan, klasifikasikan risikonya. Jangan lakukan tindakan HIGH/CRITICAL tanpa persetujuan eksplisit. Jangan mengarang hasil test, build, atau deployment.

## Struktur
- `core/`: aturan universal, keamanan, testing, database, release, dan risk policy.
- `platforms/`: aturan Android, iOS, web, backend, desktop, cross-platform, dan API.
- `workflows/`: prosedur discovery, development, review, testing, dan deployment.
- `templates/`: project profile dan laporan pengembangan.
- `docs/`: panduan implementasi.

## Approval policy
| Level | Perilaku |
|---|---|
| LOW | AI boleh lanjut dan melaporkan |
| MEDIUM | Boleh lanjut dengan safeguards jika scope jelas; minta approval bila ada ketidakpastian/dampak material |
| HIGH | Wajib approval eksplisit sebelum tindakan |
| CRITICAL | Stop, eskalasi, dan minta otorisasi spesifik serta mitigasi |

Jika ragu, gunakan level risiko lebih tinggi. Akses tool bukan persetujuan.

## Legacy Android DEV.ANDIKUNE
Aturan signing `andikune`, namespace `dev.andikune`, format versi Android, secrets `ANDIKUNE_*`, dan template Gradle/Actions lama adalah **konvensi khusus aplikasi Android DEV.ANDIKUNE**. Itu bukan persyaratan universal dan tidak boleh diterapkan ke aplikasi lain tanpa instruksi pemilik.

## Status validasi
Repository ini adalah rulebook/template, bukan aplikasi dari semua platform. Build dan test platform harus dijalankan di repository aplikasi yang sesuai. Laporkan pemeriksaan yang belum dijalankan sebagai `NOT RUN`, bukan `PASS`.

Ikuti `CONTRIBUTING.md` untuk kontribusi dan sinkronisasi dokumentasi.
