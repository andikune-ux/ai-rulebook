# Cross-platform Rules

- Identifikasi framework utama dan native modules/plugins yang dipakai.
- Pisahkan shared logic dari platform-specific behavior bila membantu maintainability.
- Uji perilaku pada setiap platform target; jangan menganggap satu platform mewakili semuanya.
- Audit permission, deep links, storage, networking, accessibility, dan lifecycle per platform.
- Periksa kompatibilitas dan pemeliharaan dependency native/plugin.
