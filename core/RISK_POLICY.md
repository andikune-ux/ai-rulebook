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
