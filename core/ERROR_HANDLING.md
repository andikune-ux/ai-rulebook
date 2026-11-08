# Error Handling and Observability

- Tangani error pada batas yang tepat dan pertahankan konteks diagnostik yang aman.
- Jangan menelan error atau mengembalikan sukses palsu.
- Pisahkan pesan pengguna dari detail internal.
- Log harus terstruktur bila sesuai, memiliki level yang tepat, dan bebas secret/data sensitif.
- Tambahkan metrics/tracing/crash reporting sesuai kebutuhan dan kebijakan privasi.
- Hindari retry tanpa batas; gunakan timeout, backoff, dan idempotency bila relevan.
