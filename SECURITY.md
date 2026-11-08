# Security Policy

## Secret dan signing key
- Jangan commit keystore, private key, password, token, atau file konfigurasi rahasia.
- Simpan signing values hanya di GitHub Actions Secrets.
- Gunakan secret berikut pada repository aplikasi:
  - `ANDIKUNE_KEYSTORE_BASE64`
  - `ANDIKUNE_KEYSTORE_PASSWORD`
  - `ANDIKUNE_KEY_ALIAS`
  - `ANDIKUNE_KEY_PASSWORD`
- Jangan pernah menaruh nilai secret di issue, pull request, log, dokumentasi publik, atau chat.
- Jangan membuat ulang signing key secara otomatis. Jika keystore hilang atau fingerprint berubah, hentikan release dan minta tindakan pemilik aplikasi.

## Pelaporan kerentanan
Jangan publikasikan kredensial atau detail eksploit yang belum diperbaiki. Hubungi pemilik repository secara privat melalui kanal GitHub yang tersedia.
