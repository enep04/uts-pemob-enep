Business Requirement Document (BRD)
Judul Proyek:

Aplikasi Monitoring WFH Mobile
Deskripsi Proyek:

Aplikasi ini dirancang untuk memonitor aktivitas kerja karyawan yang melakukan Work From Home (WFH). Aplikasi memungkinkan pengguna mencatat waktu check-in/check-out, menambahkan tugas, dan mengelola status pekerjaan.
1. Latar Belakang dan Tujuan Proyek
Latar Belakang:

    Perusahaan membutuhkan cara untuk memonitor aktivitas kerja karyawan WFH secara efisien.
    Memastikan produktivitas tetap terjaga melalui laporan waktu kerja dan tugas.

Tujuan:
    Memberikan transparansi atas aktivitas WFH karyawan.
    Memudahkan karyawan untuk mencatat waktu kerja (check-in/check-out).
    Memantau kemajuan tugas secara real-time.
    Menyediakan riwayat pekerjaan untuk evaluasi produktivitas.

2. Pemangku Kepentingan

    Pemilik Proyek: Tim HRD dan IT perusahaan.
    Pengguna: Karyawan WFH.
    Pengembang: Tim pengembang aplikasi (developer dan tester).

3. Ruang Lingkup
Fitur Utama:

    Autentikasi Pengguna:
        Login menggunakan username dan password.
        Menyimpan data nama pengguna secara lokal dengan SharedPreferences.

    Pencatatan Waktu Kerja:
        Fitur check-in (memulai kerja) dan check-out (selesai kerja).
        Menampilkan waktu dan tanggal untuk setiap aksi.

    Manajemen Tugas:
        Tambah, ubah, dan hapus tugas.
        Tugas memiliki atribut: judul, deskripsi, status selesai (completed/uncompleted).
        Memungkinkan pengguna mengunggah file terkait tugas (file upload).

    Tampilan Dashboard:
        Menampilkan nama pengguna.
        Status kerja saat ini (Sedang Bekerja atau Tidak Bekerja).
        Riwayat waktu check-in/check-out.
        Daftar tugas dengan status.

    Logout:
        Logout dengan menghapus data sesi pengguna.

4. Fungsionalitas Non-Fungsional

    Kinerja:
        Aplikasi harus responsif (<2 detik waktu pemuatan layar utama).
        Menangani data hingga 100 tugas tanpa penurunan performa.

    Keamanan:
        Data pengguna harus disimpan secara lokal menggunakan enkripsi.
        Tidak menyimpan informasi sensitif seperti password dalam teks biasa.

    Kompatibilitas:
        Mendukung Android 5.0 (Lollipop) ke atas.
        Dirancang menggunakan Flutter untuk mendukung lintas platform.

    Antarmuka Pengguna (UI):
        UI sederhana dan intuitif.
        Gunakan elemen desain Material Design.

    Ketergantungan Teknologi:
        Menggunakan Flutter sebagai kerangka kerja.
        Paket: shared_preferences, intl, file_picker, dan flutter_lints.

5. Skenario Penggunaan

    Login:
        Pengguna memasukkan username, password, dan nama lengkap.
        Jika berhasil, diarahkan ke HomeScreen.

    Check-In:
        Pengguna menekan tombol "Mulai Kerja".
        Sistem mencatat waktu check-in dan menyimpannya di perangkat.

    Check-Out:
        Pengguna menekan tombol "Selesai Kerja".
        Sistem mencatat waktu check-out dan menyimpannya di perangkat.

    Manajemen Tugas:
        Pengguna menekan tombol "Tambah Tugas".
        Formulir tugas menampilkan input judul, deskripsi, dan file (opsional).
        Tugas ditambahkan ke daftar setelah disimpan.

    Logout:
        Pengguna menekan ikon logout di AppBar.
        Data sesi dihapus, dan pengguna diarahkan ke layar login.

6. Batasan Proyek

    Tidak ada integrasi backend untuk saat ini (data disimpan lokal).
    Data tugas tidak dapat disinkronisasi lintas perangkat.
    Tidak mendukung pengguna dengan akun lebih dari satu.

7. Waktu dan Estimasi Proyek
Estimasi Waktu Pengembangan:

    Perancangan UI/UX: 1 minggu.
    Pengembangan Fitur: 2 minggu.
    Pengujian: 1 minggu.
    Total: 4 minggu.

8. Risiko Proyek

    Risiko Teknologi:
        Pengguna kehilangan data jika perangkat terhapus atau aplikasi dihapus.
    Risiko Pengguna:
        Pengguna lupa check-in/check-out, sehingga data tidak akurat.

9. Metode Pengukuran Keberhasilan

    Aplikasi berhasil login dan logout dengan benar.
    Data check-in/check-out tersimpan dengan akurat dan dapat dilihat di dashboard.
    Tugas dapat ditambahkan, diperiksa statusnya, dan dihapus.
    UI responsif dan mudah digunakan oleh pengguna.
