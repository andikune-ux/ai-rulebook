# Database Migration Guide

1. Identifikasi engine, schema saat ini, sensitivitas data, dan consumer.
2. Buat migration versioned; jangan mengubah production manual tanpa prosedur.
3. Rencanakan kompatibilitas deploy bertahap (expand/migrate/contract bila cocok).
4. Backup dan uji restore sesuai kebutuhan.
5. Uji migration pada data sintetis/representatif.
6. Destructive migration wajib approval HIGH.
7. Siapkan rollback atau forward-fix; rollback schema tidak selalu aman untuk data.
8. Verifikasi integritas setelah migration.
