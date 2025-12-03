# LAPORAN TUGAS UJIAN TENGAH SEMESTER

## Grand Kencana Rail App
Grand Kencana Rail adalah aplikasi mobile berbasis Flutter untuk pemesanan tiket kereta bergaya mewah. Fitur-fiturnya lengkap, mulai dari pencarian jadwal dan destinasi wisata, hingga informasi detail mengenai fasilitas dan rute perjalanan kereta.
## Fitur Utama
- Antarmuka Mewah & Klasik: Memadukan warna Dark Red dan Gold untuk menghadirkan kesan yang benar-benar eksklusif dan elegan.
- Pencarian Perjalanan: Fitur pencarian interaktif yang memudahkan pengaturan stasiun asal, tujuan, tanggal, hingga jumlah penumpang.
- Pilihan Tiket: Menyajikan opsi kelas kereta (Royal Executive, Premier Luxury, Business Class) lengkap dengan rincian harga dan jadwal keberangkatan.
- Detail Perjalanan (Itinerary): Menampilkan rute lengkap dari stasiun awal hingga akhir dalam bentuk linimasa vertikal yang mudah dipahami.
- Destinasi Wisata: Halaman khusus yang merekomendasikan berbagai kota tujuan populer, seperti Jakarta, Bandung, dan Yogyakarta.
- Fasilitas Kereta: Informasi lengkap mengenai layanan yang tersedia bagi penumpang, mulai dari akses lounge, makanan, hingga hiburan.

## Teknologi yang Digunakan

| Teknologi | Versi | Kegunaan |
| :--- | :--- | :--- |
| **Flutter SDK** | Stable | Framework utama pengembangan aplikasi |
| **Dart** | Latest | Bahasa pemrograman logika aplikasi |
| **Material Design** | 3.0 | Sistem desain antarmuka (UI/UX) |
| **Google Fonts** | - | Menggunakan font Georgia (tema klasik) |
| **MVC Pattern** | - | Arsitektur kode (Model-View-Controller) |

## Struktur Folder
```
UTSPPBTIKETKERETA/
├── assets/                  # Menyimpan gambar statis
├── lib/
│   ├── main.dart            # Entry point aplikasi
│   ├── theme.dart           # Konfigurasi warna & tema
│   ├── screens/
│   │   ├── home_screen.dart              # Layar utama & pencarian
│   │   ├── detail_ticket_screen.dart     # Detail tiket & itinerary
│   │   └── grid_destinations_screen.dart # Galeri destinasi wisata
│   └── widgets/
│       └── custom_widgets.dart           # Header & Navigasi reusable
├── pubspec.yaml             # Manajemen dependensi
└── README.md                # Dokumentasi proyek
```
## Penerapan 5 jenis Layout

Aplikasi ini memanfaatkan beragam widget layout untuk membangun antarmuka yang rapi, fungsional, dan responsif. Berikut adalah rincian implementasinya dalam kode:

### 1. Layout Dasar (Single Child)
Digunakan untuk menata gaya, tata letak, dan spasi pada elemen secara individual.
| Widget | Lokasi Penerapan | Fungsi Spesifik dalam Aplikasi |
| :--- | :--- | :--- |
| **Container** | `screens/grid_destinations_screen.dart` (Fungsi `_buildDestinationCard`) | Digunakan untuk membungkus gambar destinasi, memberikan sentuhan sudut melengkung serta efek bayangan agar terlihat lebih estetis. |
| **Center** | `home_screen.dart` (Dalam tombol "Search Journeys") | Berfungsi menata posisi teks "SEARCH JOURNEYS" agar berada presisi tepat di tengah tombol merah. |
| **Padding** | `widgets/custom_widgets.dart` (Widget `NavBar`) | Memberikan jarak yang cukup pada menu NavBar, sehingga teks tidak terlihat sempit atau menempel ke tepi kotak. |
| **Align** | `screens/grid_destinations_screen.dart` | Mengatur tata letak nama kota (seperti "JAKARTA") agar posisinya selalu konsisten di bagian bawah tengah kartu. |

### 2. Layout Multi-child (Row & Column)
Digunakan untuk mengatur tata letak banyak elemen sekaligus, entah itu dalam susunan tegak atau mendatar.

| Widget | Lokasi Penerapan | Fungsi Spesifik dalam Aplikasi |
| :--- | :--- | :--- |
| **Column** | `home_screen.dart` | sebagai struktur utama halaman. Fungsinya untuk menyusun elemen seperti header, menu navigasi, kartu pencarian, dan daftar tiket secara berurutan dari atas ke bawah. |
| **Row** | `screens/detail_ticket_screen.dart` (Widget `_facilityItem`) | Berfungsi untuk meletakkan ikon fasilitas dan keterangan teksnya secara berdampingan (kiri dan kanan) |
| **Expanded** | `home_screen.dart` (Widget `_buildSearchCard`) | Digunakan untuk memastikan kolom input "Date" dan "Guests" berbagi ruang lebar layar secara seimbang dan proporsional (50:50) |

### 3. Layout Kompleks (Stack & Positioned)
Berfungsi untuk menyusun elemen secara bertumpuk, memungkinkan satu elemen berada di atas elemen lainnya (overlay).

| Widget | Lokasi Penerapan | Fungsi Spesifik dalam Aplikasi |
| :--- | :--- | :--- |
| **Stack** | `screens/detail_ticket_screen.dart` (Bagian Header) | Widget ini menyusun tiga lapisan elemen secara bertumpuk, mulai dari gambar latar (bawah), efek gradasi merah (tengah), hingga teks judul dan tombol kembali (atas). |
| **Positioned** | `screens/detail_ticket_screen.dart` | Digunakan di layar yang sama untuk menempatkan tombol "Back" secara presisi pada koordinat top: 40 dan left: 20, sehingga tombol tersebut terlihat melayang di atas gambar header. |

### 4. Layout Scrollable
Berfungsi untuk memuat konten yang panjang atau melebihi ukuran layar, memungkinkan pengguna untuk menggulirnya agar seluruh informasi dapat terlihat.

| Widget | Lokasi Penerapan | Fungsi Spesifik dalam Aplikasi |
| :--- | :--- | :--- |
| **ListView** | `screens/detail_ticket_screen.dart` | Widget ini memungkinkan daftar Itinerary perjalanan dan rincian fasilitas untuk digulir ke bawah (scroll) dengan lancar. |
| **GridView** | `screens/grid_destinations_screen.dart` | untuk menyajikan galeri foto kota tujuan dalam tata letak grid (kotak-kotak) yang rapi. |
| **SingleChildScrollView** | `home_screen.dart` | MFungsinya memastikan seluruh halaman tetap bisa digulir dan tidak terpotong (overflow) saat dibuka pada perangkat dengan layar yang lebih kecil. |

### 5. Layout Responsif / Adaptif
Berfungsi untuk memastikan antarmuka aplikasi tetap rapi dan dapat beradaptasi dengan ukuran layar perangkat yang digunakan.

| Widget | Lokasi Penerapan | Fungsi Spesifik dalam Aplikasi |
| :--- | :--- | :--- |
| **MediaQuery** | `screens/grid_destinations_screen.dart` | untuk mendeteksi lebar layar perangkat. Secara otomatis, aplikasi akan menampilkan 3 kolom jika dibuka pada tablet atau mode lanskap (lebar > 600px), dan menyesuaikan menjadi 2 kolom untuk layar ponsel standar. |
| **LayoutBuilder** | `screens/detail_ticket_screen.dart` | untuk membangun struktur halaman secara fleksibel. Widget ini memastikan elemen tampilan tersusun rapi dengan mengikuti batasan ruang (constraints) yang tersedia dari widget induknya. |

## Palet Warna
Aplikasi ini menerapkan skema warna khusus yang diatur secara terpusat melalui file theme.dart untuk membangun identitas visual yang khas:
- Dark Red (#660012): Warna merah gelap yang mendominasi latar belakang untuk memberikan kesan elegan.
- Gold (#C5A059): Warna emas yang berfungsi sebagai aksen pemanis pada tombol, ikon, dan judul utama.
- Cream (#F2EBD4): Warna krim lembut yang dipilih sebagai latar area konten agar tetap nyaman di mata.
- Black (#1A1A1A): Warna hitam pekat yang digunakan pada teks isi untuk keterbacaan yang maksimal.

## Pratinjau Halaman

<img width="1364" height="655" alt="image" src="https://github.com/user-attachments/assets/f9b08f05-9aa9-4178-9ba9-f32564a7d0a6" />

<img width="1353" height="649" alt="image" src="https://github.com/user-attachments/assets/77a93448-fc64-4aa7-b2e7-cb36be0f1f25" />

- Halaman Utama (Home Screen): Menyambut pengguna dengan header berlogo, kotak pencarian "Plan Your Journey" yang mudah diakses, serta daftar rekomendasi tiket perjalanan.

<img width="1365" height="656" alt="image" src="https://github.com/user-attachments/assets/7748135e-812d-47dd-9c17-f405b5bfaf71" />

- Halaman Detail (Detail Screen): Ditampilkan ketika tiket dipilih, halaman ini memuat header dengan efek gradasi visual, linimasa perjalanan yang jelas, serta tombol "Book Now" untuk pemesanan.

<img width="1365" height="655" alt="image" src="https://github.com/user-attachments/assets/f94113cc-fc2e-4a04-b01e-b455b01d3703" />

- Halaman Destinasi (Destinations Screen): Menyajikan galeri foto kota-kota tujuan wisata dalam susunan grid yang responsif dan rapi.

---

## Roadmap & Pengembangan

Aplikasi ini masih dalam tahap pengembangan aktif. Berikut adalah rencana fitur dan perbaikan teknis yang akan diimplementasikan pada versi selanjutnya:

### Fase 1: Penyempurnaan UI & Navigasi (Saat Ini)
- [x] Desain antarmuka *High Fidelity* dengan tema *Luxury*.
- [x] Implementasi navigasi dasar (Home, Detail, Destinations).
- [x] Struktur folder modular (MVC Pattern).
- [ ] Menambahkan animasi transisi (*Hero Animation*) pada gambar tiket.

### Fase 2: Fungsionalitas Inti
- [ ] **Logika Pencarian**: Membuat fitur pencarian berfungsi untuk memfilter tiket berdasarkan kota dan tanggal.
- [ ] **Halaman "My Journey"**: Menampilkan riwayat tiket yang sudah dipesan oleh pengguna.
- [ ] **Pemilihan Kursi**: Menambahkan fitur interaktif untuk memilih gerbong dan nomor kursi.
- [ ] **Formulir Validasi**: Memastikan input tanggal dan jumlah penumpang valid.

###  Fase 3: Integrasi Backend & Data
- [ ] **Database Dinamis**: Mengganti data *hardcoded* (dummy) dengan API atau Firebase.
- [ ] **Autentikasi Pengguna**: Fitur Login dan Register untuk menyimpan data penumpang.
- [ ] **Payment Gateway**: Simulasi pembayaran tiket (e-wallet/transfer bank).

## Profil Mahasiswa
*Nama : Dhiya'an Sani*

*NIM : 230102036*

*Email : dhiyaansani06@gmail.com*

*LinkedIn : dhiyaansani06*
