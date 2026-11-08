# Security Guide

Gunakan `core/SECURITY_RULES.md` sebagai baseline. Identifikasi aset, trust boundaries, threat actors, sensitivitas data, dan dampak insiden. Pilih kontrol berdasarkan risiko dan dokumentasikan residual risk.

Jangan menyimpan secret dalam repository. Batasi akses, gunakan secret manager, audit dependency, dan pastikan logging tidak membocorkan data. Perubahan auth, permission, encryption, production, dan credential mengikuti approval HIGH.
