# Testing Rules

- Pilih unit, integration, contract, UI, end-to-end, performance, dan security tests sesuai risiko.
- Test harus deterministik sejauh memungkinkan dan tidak bergantung pada secret pribadi.
- Jangan menghapus atau melemahkan test untuk membuat pipeline hijau.
- Jalankan formatter/linter/type checker yang dikonfigurasi.
- Perubahan kritis data, auth, payment, permission, atau API memerlukan test yang relevan.
- Laporkan test yang tidak dapat dijalankan sebagai NOT RUN beserta alasannya.
- Jangan mengklaim coverage atau hasil yang tidak diukur.
