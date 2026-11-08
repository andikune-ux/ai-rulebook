# Security Policy — AI Rulebook V3

## Prinsip
Keamanan, privasi, integritas data, dan least privilege berlaku untuk semua platform. Terapkan kontrol yang sesuai dengan threat model dan stack proyek.

## Secret dan credential
- Jangan commit atau menampilkan password, token, API key, private key, signing key, certificate privat, atau credential.
- Gunakan secret manager atau CI secret store.
- Rotasi credential yang diduga bocor; jangan menyalin nilainya ke issue atau chat.
- File rahasia dan data lokal sensitif harus dikecualikan dari konteks AI melalui `.aiignore` atau kontrol akses setara.

## Pelaporan kerentanan
Jangan publikasikan detail eksploit yang belum diperbaiki atau data sensitif. Laporkan secara privat kepada pemilik repository melalui kanal GitHub yang tersedia.

## Perubahan berisiko
Perubahan autentikasi, otorisasi, enkripsi, permission, penyimpanan data, dependency kritis, pipeline release, dan production wajib mengikuti `core/RISK_POLICY.md`.

## Respons insiden
1. Batasi paparan dan hentikan proses berbahaya bila aman dilakukan.
2. Jangan menghapus bukti atau log audit.
3. Minta persetujuan sebelum rotasi atau perubahan production yang berdampak.
4. Dokumentasikan cakupan, dampak, mitigasi, dan tindak lanjut tanpa memasukkan secret.
