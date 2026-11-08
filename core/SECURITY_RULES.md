# Universal Security Rules

1. Terapkan threat modeling proporsional terhadap risiko aplikasi.
2. Validasi dan normalisasi input pada trust boundary.
3. Gunakan autentikasi dan otorisasi server-side; jangan percaya kontrol UI saja.
4. Terapkan least privilege pada user, service, token, dan workflow.
5. Lindungi secret melalui secret manager; jangan log secret.
6. Gunakan transport encryption dan penyimpanan aman sesuai sensitivitas.
7. Hindari injection, insecure deserialization, path traversal, SSRF, XSS, CSRF, dan access-control flaws sesuai konteks.
8. Minimalkan pengumpulan, retensi, dan distribusi data pribadi.
9. Periksa dependency, lisensi, provenance, dan advisories keamanan.
10. Jangan menonaktifkan TLS verification, sandbox, permission, atau security checks untuk mempermudah development.
11. Pastikan log tidak menyimpan credential atau data sensitif.
12. Sediakan proses patch dan respons insiden yang masuk akal.
