# Backend Platform Rules

- Validasi input dan lakukan authorization pada server untuk setiap resource/action.
- Gunakan timeout, rate limiting, pagination, idempotency, dan retry policy sesuai kebutuhan.
- Jangan mengekspos stack trace, internal identifiers sensitif, atau credential ke client.
- Version dan dokumentasikan API contract; uji kompatibilitas.
- Terapkan health checks, graceful shutdown, observability, dan secret management.
- Perubahan schema, auth, API breaking, dan production config mengikuti Risk Policy.
