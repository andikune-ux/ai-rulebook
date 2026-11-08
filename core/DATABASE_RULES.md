# Database and Data Rules

- Identifikasi database, ownership data, retention, dan backup strategy sebelum perubahan bermakna.
- Gunakan migration versioned untuk schema changes.
- Pertahankan data pengguna; destructive migration wajib approval HIGH.
- Migration harus mempertimbangkan deploy bertahap, kompatibilitas versi lama/baru, dan rollback/forward-fix.
- Hindari menyimpan secret atau data pribadi yang tidak diperlukan.
- Terapkan authorization pada query dan operasi data.
- Uji migration pada data representatif tanpa mengekspos data produksi.
