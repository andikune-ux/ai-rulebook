# AI Rulebook V3 — Universal Development Standard

AI Rulebook adalah pusat instruksi untuk AI coding assistant yang bekerja pada berbagai jenis aplikasi dan sistem perangkat lunak.

## Keputusan V3
- **Platform:** Universal + Auto Detection.
- **Approval:** Risk-Based Approval.
- **Release:** V3.
- **Prinsip:** aturan keamanan wajib, standar teknis dapat disesuaikan dengan konteks, dan tindakan berisiko dikendalikan dengan persetujuan.

## Mulai menggunakan
1. Berikan AI akses ke repository proyek.
2. Minta AI membaca `AGENTS.md` atau `CLAUDE.md`, seluruh aturan `core/`, dan profil proyek jika tersedia.
3. AI memeriksa struktur repository dan mendeteksi stack secara otomatis.
4. AI memuat aturan platform yang relevan dari `platforms/`.
5. AI membuat rencana, klasifikasi risiko, implementasi, pengujian, dan laporan.

## Struktur
- `core/`: aturan universal yang berlaku untuk semua proyek.
- `platforms/`: aturan khusus teknologi/platform.
- `workflows/`: prosedur kerja AI.
- `templates/`: konfigurasi dan checklist siap pakai.
- `docs/`: panduan operasional.
- `scripts/`: utilitas repository.
- `AGENTS.md` dan `CLAUDE.md`: entry point instruksi AI.

## Auto Detection
AI wajib memeriksa manifest, file konfigurasi, dependency, struktur folder, dan dokumentasi proyek. Jangan menyimpulkan stack hanya dari nama repository. Jika beberapa stack ditemukan, muat semua aturan yang relevan. Jika tidak dikenali, gunakan aturan universal dan nyatakan keterbatasannya.

## Risk-Based Approval
- **Low:** AI boleh melanjutkan dan menguji.
- **Medium:** AI boleh melanjutkan jika perubahan dapat dibatalkan, ruang lingkup jelas, dan dampak dijelaskan.
- **High:** berhenti sebelum tindakan; minta persetujuan eksplisit.
- **Critical:** jangan lakukan tanpa otorisasi eksplisit dan rencana mitigasi; tolak tindakan yang melanggar hukum, keamanan, atau privasi.

Lihat `core/RISK_POLICY.md`.

## Aturan prioritas
1. Hukum, keselamatan, privasi, dan keamanan.
2. Instruksi eksplisit pemilik proyek yang tidak bertentangan dengan tingkat 1.
3. Aturan universal di `core/`.
4. Aturan platform di `platforms/`.
5. Konvensi dan preferensi proyek.

Jika dua aturan setingkat bertentangan, jelaskan konflik dan pilih opsi paling aman yang tetap memenuhi tujuan. Jangan diam-diam mengabaikan aturan.

## Status pemeriksaan
Gunakan `PASS`, `FAIL`, `NOT RUN`, atau `NOT APPLICABLE`. Jangan mengklaim build, test, audit, atau deployment berhasil tanpa bukti aktual.

## Batas repository
Repository ini adalah rulebook dan kumpulan template, bukan aplikasi Android atau aplikasi runnable. Template CI/CD harus disesuaikan dan dipasang pada repository aplikasi yang sesuai.

## Kontribusi
Baca `CONTRIBUTING.md`. Setiap perubahan aturan harus disinkronkan ke entry point terkait dan dicatat di `CHANGELOG.md`.
