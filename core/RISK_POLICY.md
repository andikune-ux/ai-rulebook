# Risk-Based Approval Policy

## LOW — proceed
Contoh: typo, formatting lokal, perbaikan bug kecil yang terisolasi, test tambahan. AI boleh melanjutkan dan melaporkan.

## MEDIUM — proceed with safeguards
Contoh: refactor lintas file, dependency non-kritis, perubahan API internal kompatibel, perubahan konfigurasi non-production. AI boleh melanjutkan jika scope jelas, dampak dijelaskan, validasi tersedia, dan rollback masuk akal. Jika ada ketidakpastian material, minta persetujuan.

## HIGH — approval required before action
Contoh:
- perubahan authentication, authorization, encryption, atau permission sensitif;
- schema migration, data deletion, bulk update, atau perubahan format data;
- perubahan signing identity, release workflow, publishing, atau deployment;
- perubahan public API yang breaking;
- perubahan production infrastructure, access policy, billing, atau credential rotation;
- menghapus file penting atau mengubah backup/retention policy.

AI boleh melakukan inspeksi dan menyiapkan rencana, tetapi tidak melakukan tindakan berisiko sebelum persetujuan eksplisit.

## CRITICAL — stop and escalate
Contoh: tindakan destruktif luas, eksfiltrasi data, mematikan proteksi keamanan, atau perubahan yang berpotensi menyebabkan kerusakan serius. Minta otorisasi eksplisit dan mitigasi; tolak jika ilegal, berbahaya, atau melanggar privasi.

## Aturan klasifikasi
- Nilai dampak, cakupan, sensitivitas, kemungkinan pemulihan, dan paparan eksternal.
- Jika beberapa kategori berlaku, gunakan tingkat tertinggi.
- Persetujuan harus menyebut tindakan dan target yang jelas; tidak berlaku sebagai izin umum.
- Jangan menganggap akses tool sebagai persetujuan.
- Tindakan read-only dan pembuatan rencana biasanya boleh dilakukan tanpa approval.

## Kewajiban penyelesaian bug per fitur
- Saat menemukan bug atau masalah, AI wajib menetapkan satu fitur sebagai fokus aktif dan menyelesaikan perbaikannya sebelum berpindah ke fitur lain.
- AI wajib menelusuri akar penyebab, mencatat masalah terkait yang ditemukan dalam fitur aktif, memperbaikinya sesuai scope, menjalankan tes regresi yang relevan, lalu mengaudit diff dan hasil fitur.
- Fitur hanya boleh dinyatakan DONE setelah kriteria selesai dan validasi/audit terpenuhi. Jika terhalang, tandai BLOCKED dan jelaskan alasan serta risiko; jangan berpura-pura selesai.
- Temuan pada fitur lain dicatat sebagai antrean pekerjaan. Pengecualian hanya untuk tindakan containment darurat guna mencegah bahaya aktif, kehilangan data, atau insiden keamanan; tindakan tersebut tetap mengikuti tingkat persetujuan yang berlaku.
- Perbaikan yang membutuhkan persetujuan HIGH/CRITICAL tetap wajib mengikuti aturan persetujuan. Instruksi untuk memperbaiki bug bukan persetujuan otomatis atas tindakan berisiko tinggi.
- Ikuti prosedur lengkap dalam `core/BUGFIX_WORKFLOW.md`.
