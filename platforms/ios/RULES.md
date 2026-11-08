# iOS Platform Rules

- Ikuti Swift/SwiftUI atau UIKit yang sudah dipakai proyek.
- Kelola signing certificate, provisioning profile, bundle identifier, dan App Store Connect credential melalui mekanisme aman.
- Perubahan signing, entitlements, capabilities, atau publishing adalah HIGH risk.
- Periksa privacy manifest, permission purpose strings, data collection, dan platform policies yang berlaku.
- Uji lifecycle, accessibility, supported iOS versions, localization, dan device layouts.
- Jalankan tests dan archive/export validation yang tersedia sebelum menyatakan release siap.
