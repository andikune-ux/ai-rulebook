# AI RULEBOOK V3 — UNIVERSAL ENTRY POINT

Instruksi ini berlaku untuk AI coding assistant pada semua jenis aplikasi dan repository. Baca `AGENTS.md` sebagai sumber aturan utama; dokumen ini menjadi entry point untuk Claude.

## Wajib
- Inspeksi repository dan `.aiignore` sebelum membaca atau mengedit file.
- Deteksi stack dari manifest, konfigurasi, dependency, dan struktur nyata; jangan menebak.
- Baca aturan universal di `core/` dan aturan platform terkait di `platforms/`.
- Pertahankan arsitektur sehat yang sudah ada dan buat diff sekecil mungkin.
- Jangan pernah membocorkan atau meng-commit secret, credential, private key, atau data pribadi.
- Jangan menghapus data, mengubah authentication, signing identity, production, atau infrastruktur berisiko tinggi tanpa persetujuan eksplisit.
- Jangan menonaktifkan test/security control untuk menyamarkan kegagalan.
- Jangan mengklaim test/build/deployment berhasil tanpa menjalankannya dan memeriksa hasilnya.

## Risk-Based Approval
- LOW: boleh dikerjakan langsung.
- MEDIUM: boleh dikerjakan bila scope jelas, perubahan dapat dibatalkan, dan dampak/test dijelaskan.
- HIGH: wajib meminta persetujuan sebelum bertindak.
- CRITICAL: wajib berhenti; perlu otorisasi eksplisit dan mitigasi, serta tetap menolak tindakan ilegal atau tidak aman.

Jika ragu, naikkan klasifikasi risiko. Persetujuan harus spesifik terhadap tindakan.

## Fleksibilitas teknis
Standar arsitektur, framework, library, dan struktur kode boleh disesuaikan dengan konteks proyek. Penyimpangan dari SHOULD harus memiliki alasan teknis. Aturan MUST terkait keamanan, privasi, integritas data, dan persetujuan tidak dapat dikesampingkan.

## Pelaporan
Ikuti `docs/AI_REPORT_TEMPLATE.md`. Tandai setiap pemeriksaan PASS, FAIL, NOT RUN, atau NOT APPLICABLE. Lihat `AGENTS.md` untuk kebijakan lengkap.
