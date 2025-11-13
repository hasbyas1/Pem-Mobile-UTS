# Aplikasi Mobile UTS - Pemrograman Mobile

Repository ini dibuat untuk memenuhi **Ujian Tengah Semester (UTS)** pada mata kuliah **IFB-355 Pemrograman Mobile** - Institut Teknologi Nasional Bandung.

Muhammad Hasby As-shiddiqy | 15-2023-072 |  IFB-355 Pemrograman Mobile AA
---

## Deskripsi Aplikasi

Aplikasi mobile berbasis Flutter yang dikembangkan sebagai tugas UTS Pemrograman Mobile. Aplikasi ini menampilkan berbagai fitur dan implementasi UI/UX yang interaktif, meliputi:

1. **Splash Screen** - Halaman pembuka aplikasi
2. **Dashboard dengan Bottom Navigation** - Navigasi utama antar menu
3. **Halaman Biodata** - Form input data pribadi dengan berbagai widget
4. **Halaman Kontak** - Daftar kontak telepon
5. **Halaman Kalkulator** - Kalkulator sederhana dengan operasi matematika
6. **Halaman Cuaca** - Informasi cuaca (data statis)
7. **Halaman Berita** - Daftar berita dengan gambar

---

## Fitur yang Sudah Dikembangkan

### 1. Splash Screen
Halaman awal aplikasi yang ditampilkan selama **5 detik** dengan informasi:
- Judul aplikasi
- Foto mahasiswa
- NIM mahasiswa
- Nama mahasiswa

**Screenshot:**

<img width="232" height="425" alt="image" src="https://github.com/user-attachments/assets/c48efb96-0553-4edf-b9d0-2083abee2b87" />

---

### 2. Dashboard dengan Bottom Navigation
Dashboard utama aplikasi yang menggunakan **Bottom Navigation Bar** untuk navigasi antar menu. Terdapat 5 menu utama:
- Biodata
- Kontak
- Kalkulator
- Cuaca
- Berita

Semua menu menggunakan konsep **Fragment** untuk perpindahan halaman yang efisien.

**Screenshot:**

<img width="233" height="33" alt="image" src="https://github.com/user-attachments/assets/5d748fbb-ab60-4bde-aa6e-164ea2151f2b" />

---

### 3. Halaman Biodata
Halaman yang menampilkan informasi pribadi dengan form input yang interaktif, meliputi:

**Komponen UI yang digunakan:**
- **Image Profile** - Foto profil user (CircleAvatar)
- **TextField** - Input nama lengkap, NIM (dengan format XX-XXXX-XXX), email (dengan validasi regex)
- **Dropdown** - Pilihan jurusan
- **Radio Button** - Pilihan jenis kelamin (2 kolom: Laki-laki & Perempuan)
- **Calendar/DatePicker** - Pemilihan tanggal lahir
- **TextArea** - Input alamat (multiline)
- **Button** - Tombol simpan dengan validasi

**Fitur Khusus:**
- Validasi email dengan regex pattern
- Format NIM otomatis (XX-XXXX-XXX) dengan maksimal 9 digit
- Data default sudah terisi (dapat diedit)
- Visual feedback (border merah/hijau, icon check/error)

**Screenshot:**

<img width="230" height="386" alt="image" src="https://github.com/user-attachments/assets/569184a3-21b1-4943-9274-e51558d21b7d" />
<img width="230" height="387" alt="image" src="https://github.com/user-attachments/assets/a43f387f-1afb-48c1-8a32-c2a825067ba3" /> <br>
<img width="228" height="163" alt="image" src="https://github.com/user-attachments/assets/d1ed850e-8293-4f44-9d56-ceadb478b797" /> <br>
<img width="225" height="358" alt="image" src="https://github.com/user-attachments/assets/b581717f-4d2b-41cc-9f5a-9b80db221392" /> <br>
<img width="230" height="55" alt="image" src="https://github.com/user-attachments/assets/23116ed5-3004-44ce-bf45-e5c42a3ee029" /> <br>
<img width="232" height="62" alt="image" src="https://github.com/user-attachments/assets/2fe54db0-01b8-49c9-9d64-1665a8af8455" /> <br>
<img width="231" height="63" alt="image" src="https://github.com/user-attachments/assets/3a5b6d7d-7052-4a99-872e-f4520c0d1609" /> <br>


---

### 4. Halaman Kontak
Halaman yang menampilkan **daftar 15 kontak telepon** dengan layout yang menarik.

**Komponen UI:**
- **ListView** - Daftar kontak yang dapat di-scroll
- **Card** - Container untuk setiap item kontak
- **CircleAvatar** - Foto profil dengan inisial nama
- **ListTile** - Menampilkan nama dan nomor telepon
- **IconButton** - Tombol telepon untuk aksi call

**Data:** 15 kontak statis dengan nama dan nomor telepon

**Screenshot:**

<img width="230" height="150" alt="image" src="https://github.com/user-attachments/assets/df59b7d7-252a-457d-b9d7-404738291b28" /> <br>
<img width="232" height="117" alt="image" src="https://github.com/user-attachments/assets/ff8e5ba2-5054-4bfd-8d03-ff94795df0e6" /> <br>


---

### 5. Halaman Kalkulator
Kalkulator sederhana yang **sudah dapat melakukan perhitungan** matematika.

**Operasi yang tersedia:**
- ➕ Penjumlahan
- ➖ Pengurangan
- ✖️ Perkalian
- ➗ Pembagian
- 🔲 Kuadrat (x²)
- √ Akar kuadrat
- ⌫ Backspace (hapus satu karakter)
- AC (hapus semua)

**Fitur Khusus:**
- Tampilan ekspresi lengkap (contoh: 98×4)
- Preview hasil real-time dengan warna hijau
- Layout tombol kotak dengan warna yang intuitif
- Display rata kanan dengan scroll horizontal
- Validasi pembagian dengan nol

**Screenshot:**

<img width="231" height="390" alt="image" src="https://github.com/user-attachments/assets/fd5eca65-4d62-4134-ab64-5ad85bcb2ce9" />
<img width="232" height="185" alt="image" src="https://github.com/user-attachments/assets/ab36f9c8-597f-4a95-afbf-3a7c5024868d" /> <br>


---

### 6. Halaman Cuaca
Halaman yang menampilkan informasi cuaca dengan UI yang menarik.

**Informasi yang ditampilkan:**
- Lokasi (Bandung, Indonesia)
- Suhu (°C)
- Kelembapan (%)
- Kondisi cuaca
- Kecepatan angin
- Jarak pandang

**Fitur:**
- Gradient background biru
- Icon cuaca animatif
- Card informasi dengan styling modern
- Data masih bersifat statis

**Screenshot:**

<img width="232" height="390" alt="image" src="https://github.com/user-attachments/assets/7ccc0d3f-833a-4a89-a1c3-f1bda11507d7" />
<img width="231" height="390" alt="image" src="https://github.com/user-attachments/assets/abd4ccc0-2e85-4cf9-95b1-8dba3c7fd65e" />

---

### 7. Halaman Berita
Halaman yang menampilkan **daftar berita** dengan gambar dan informasi lengkap.

**Komponen UI:**
- **ListView** - Daftar berita yang dapat di-scroll
- **Card** - Container untuk setiap item berita
- **Image.network** - Gambar berita dari internet
- **Badge kategori** - Label kategori berita
- **Icon tanggal** - Informasi waktu publikasi
- **AlertDialog** - Popup detail berita saat di-klik

**Fitur:**
- 4 berita dengan gambar unik
- Loading indicator saat gambar dimuat
- Error handling jika gambar gagal dimuat
- Detail berita dalam dialog popup
- Deskripsi berita yang lengkap (beberapa paragraf)

**Screenshot:**

<img width="232" height="421" alt="image" src="https://github.com/user-attachments/assets/f4217b61-81c5-4920-a190-0866d2debe2e" />
<img width="231" height="425" alt="image" src="https://github.com/user-attachments/assets/93f2fd90-7d94-4a08-858f-827742f72212" />


---

## Teknologi yang Digunakan

- **Flutter SDK** - Framework utama
- **Dart** - Bahasa pemrograman
- **Material Design 3** - Design system
- **Image.network** - Load gambar dari internet

---

## Persyaratan Sistem

- Flutter SDK: `>=3.0.0 <4.0.0`
- Dart SDK: `>=3.0.0`
- Android Studio / VS Code
- Android SDK (untuk emulator/device Android)
- Internet connection (untuk load gambar berita)

---

## Cara Menjalankan Aplikasi

### 1. Clone Repository
```bash
git clone https://github.com/hasbyas1/Pem-Mobile-UTS.git
cd Pem-Mobile-UTS
```

### 2. Install Dependencies
```bash
flutter pub get
```

### 3. Jalankan Aplikasi
```bash
flutter run
```

Atau jalankan melalui IDE:
- **Android Studio**: Klik tombol Run️
- **VS Code**: Press F5

---

## Struktur Project

```
lib/
├── main.dart                          # Entry point aplikasi
├── screens/
│   ├── splash_screen.dart            # Splash screen (5 detik)
│   └── dashboard_screen.dart         # Dashboard dengan bottom navigation
└── fragments/
    ├── biodata_fragment.dart         # Halaman biodata
    ├── kontak_fragment.dart          # Halaman kontak (15 kontak)
    ├── kalkulator_fragment.dart      # Halaman kalkulator
    ├── cuaca_fragment.dart           # Halaman cuaca
    └── berita_fragment.dart          # Halaman berita (8 berita)

assets/
└── images/
    └── hasby.png                     # Foto profil mahasiswa

android/
└── app/
    └── src/
        └── main/
            └── AndroidManifest.xml   # Manifest
```

---

## Informasi Mahasiswa

- **Nama**: Muhammad Hasby As-shiddiqy
- **NIM**: 15-2023-072
- **Kelas**: AA
- **Program Studi**: Informatika
- **Institut**: Institut Teknologi Nasional Bandung
- **Mata Kuliah**: IFB-355 Pemrograman Mobile
- **Dosen**: Galih Ashari R., S.Si., MT
- **Semester**: Ganjil 2025/2026

---

## Catatan Pengembangan

### Fitur yang Sudah Diimplementasikan
- [x] Splash Screen dengan timer 5 detik
- [x] Bottom Navigation dengan 5 menu
- [x] Biodata dengan TextField, Dropdown, Radio Button, DatePicker
- [x] Validasi email dengan regex
- [x] Format NIM otomatis (XX-XXXX-XXX)
- [x] Kontak dengan 15 data statis
- [x] Kalkulator dengan 8 operasi matematika
- [x] Preview hasil kalkulator real-time
- [x] Cuaca dengan UI gradient dan icon
- [x] Berita dengan gambar dari internet
- [x] Dialog detail berita dengan deskripsi lengkap

### Perbaikan yang Dilakukan
- Format NIM otomatis dengan pattern XX-XXXX-XXX
- Validasi email real-time dengan visual feedback
- Kalkulator dengan preview hasil dan scroll horizontal
- Jenis kelamin dalam 2 kolom
- Data default biodata sudah terisi dan bisa diedit
- Gambar berita dengan loading indicator dan error handling

---

## Lisensi

Project ini dibuat untuk keperluan akademik (UTS Pemrograman Mobile) dan tidak untuk dipublikasikan secara komersial.

---

## Ucapan Terima Kasih

Terima kasih kepada:
- **Bapak Galih Ashari R., S.Si., MT** selaku dosen pengampu mata kuliah
- **Institut Teknologi Nasional Bandung** sebagai institusi pendidikan
- Teman-teman yang telah membantu dalam proses pengembangan aplikasi ini

---

**© 2025 - Muhammad Hasby As-shiddiqy - Institut Teknologi Nasional Bandung**
