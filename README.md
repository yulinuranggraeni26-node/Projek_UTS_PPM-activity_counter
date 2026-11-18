ActivityCounter — Aplikasi Pencatat Aktivitas & Target Harian

Mata Kuliah:** Pemrograman Perangkat Bergerak (PPM) — Ujian Tengah Semester (UTS)  
Nama:** Yuli Nuranggraeni  
NIM:** 20240040033
Kelas:** TI24C

---

Deskripsi Aplikasi
**ActivityCounter** adalah aplikasi mobile berbasis Flutter yang dirancang untuk membantu pengguna menghitung aktivitas harian secara real-time, memantau progres pencapaian target harian, serta menyimpan catatan evaluasi aktivitas dalam satu antarmuka yang ringkas.

Video Demonstrasi Aplikasi
Video demonstrasi penggunaan aplikasi (durasi 2–3 menit) dapat diakses melalui tautan berikut:  
https://drive.google.com/file/d/1cT_x3mLxKBVFHs24v-Cuop062jTBcBm5/view?usp=sharing

Fitur Utama
- **Home:** Menampilkan ringkasan total aktivitas harian, status target yang tercapai, dan akses cepat ke menu utama.
- **Hitungan (Counter):** Fitur penghitung aktivitas secara real-time (tambah, kurang, dan reset hitungan).
- **Target:** Pengaturan target harian dan indikator progres pencapaian aktivitas.
- **Catatan (Notes):** Fitur pencatatan detail dan evaluasi kegiatan harian pengguna.

Struktur Proyek & Kelengkapan Berkas
Aplikasi ini dibangun menggunakan arsitektur **Layered MVVM (Model-View-ViewModel)**:
- `lib/config/` — Konfigurasi tema dan tampilan aplikasi (`app_theme.dart`).
- `lib/domain/models/` — Model data aktivitas dan catatan (`activity_model.dart`, `note_model.dart`).
- `lib/data/` — Layanan penyimpanan lokal dan repository data.
- `lib/ui/` — Antarmuka pengguna (Screen) dan pengelolaan state (ViewModel).
- `screenshot/` — Kumpulan tangkapan layar tampilan aplikasi.
- `[UTS_PPM_TI24C_YuliNurAnggraeni_20240040033].pdf` — Dokumen laporan / dokumentasi proyek.
- `[activity_counter].zip` — Arsip lengkap source code proyek.

Cara Menjalankan Proyek
1. Pastikan Flutter SDK sudah terpasang di perangkat.
2. Unduh atau clone repositori ini:
   ```bash
   git clone [https://github.com/yulinuranggraeni26-node/Projek_UTS_PPM-activity_counter.git]
