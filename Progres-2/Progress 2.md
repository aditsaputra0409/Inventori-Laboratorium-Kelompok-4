# BAB IV

# ENTITY RELATIONSHIP DIAGRAM (ERD)

## 4.1 Diagram ERD

Berdasarkan hasil analisis kebutuhan sistem yang telah dilakukan pada Progres 1, tahap selanjutnya adalah merancang struktur basis data menggunakan **Entity Relationship Diagram (ERD)**. ERD digunakan untuk menggambarkan hubungan antar entitas yang terdapat pada Sistem Manajemen Inventori Laboratorium sehingga dapat menjadi dasar dalam pembuatan database.

ERD yang dirancang terdiri dari beberapa entitas utama yaitu:

* Barang
* Kategori Barang
* Kondisi Barang
* Laboratorium
* Mahasiswa
* Laboran
* Pengguna
* Peminjaman
* Detail Peminjaman
* Pengembalian

### Diagram ERD

> **Gambar 1.2 Diagram ERD**
>
> 

---

## 4.2 Penjelasan Entitas

### 1. Barang

Menyimpan data inventaris laboratorium seperti nama barang, jumlah stok, kategori, kondisi, dan lokasi penyimpanan.

### 2. Kategori Barang

Digunakan untuk mengelompokkan barang berdasarkan jenis tertentu.

### 3. Kondisi Barang

Menyimpan informasi kondisi barang seperti baik, rusak ringan, atau rusak berat.

### 4. Laboratorium

Menyimpan informasi laboratorium tempat barang digunakan atau disimpan.

### 5. Mahasiswa

Menyimpan data mahasiswa yang melakukan peminjaman alat.

### 6. Laboran

Menyimpan data petugas yang bertanggung jawab terhadap inventaris laboratorium.

### 7. Pengguna

Menyimpan data akun yang digunakan untuk login ke dalam sistem.

### 8. Peminjaman

Mencatat seluruh transaksi peminjaman barang.

### 9. Detail Peminjaman

Menyimpan rincian barang yang dipinjam dalam setiap transaksi.

### 10. Pengembalian

Mencatat data pengembalian barang yang telah dipinjam.

---

## 4.3 Penjelasan Antar Relasi

1. Satu kategori barang dapat memiliki banyak barang (**1:M**).
2. Satu kondisi barang dapat dimiliki oleh banyak barang (**1:M**).
3. Satu laboratorium dapat memiliki banyak barang (**1:M**).
4. Satu mahasiswa dapat melakukan banyak peminjaman (**1:M**).
5. Satu laboran dapat menangani banyak transaksi peminjaman (**1:M**).
6. Satu transaksi peminjaman dapat memiliki banyak detail peminjaman (**1:M**).
7. Satu barang dapat muncul pada banyak detail peminjaman (**1:M**).
8. Satu transaksi peminjaman memiliki satu data pengembalian (**1:1**).
9. Satu laboran memiliki satu akun pengguna (**1:1**).

---

# BAB V

# NORMALISASI DATABASE

## 5.1 Bentuk Tidak Normal (UNF)

Pada tahap awal, seluruh data inventaris laboratorium disimpan dalam satu tabel yang berisi data barang, mahasiswa, laboran, serta transaksi peminjaman dan pengembalian. Bentuk ini masih menimbulkan redundansi data dan kesulitan dalam pengelolaan data.

| ID Pinjam | Nama Mahasiswa | Barang            | Jumlah | Tanggal    |
| --------- | -------------- | ----------------- | ------ | ---------- |
| P001      | Aldi Saputra   | Laptop, Proyektor | 1,1    | 07-06-2026 |

---

## 5.2 First Normal Form (1NF)

Pada tahap ini setiap atribut harus memiliki nilai tunggal dan tidak boleh terdapat kelompok data berulang.

| ID Pinjam | Nama Mahasiswa | Barang    | Jumlah |
| --------- | -------------- | --------- | ------ |
| P001      | Aldi Saputra   | Laptop    | 1      |
| P001      | Aldi Saputra   | Proyektor | 1      |

---

## 5.3 Second Normal Form (2NF)

Pada tahap Second Normal Form (2NF), dilakukan pemisahan data berdasarkan ketergantungan penuh terhadap primary key. Tujuannya adalah untuk menghilangkan ketergantungan parsial sehingga setiap atribut non-key bergantung sepenuhnya pada primary key tabel masing-masing.

### Tabel Mahasiswa

| NIM        | Nama Mahasiswa |
| ---------- | -------------- |
| 2501020140 | Aldi Saputra   |

### Tabel Peminjaman

| ID Pinjam | NIM        | Tanggal    |
| --------- | ---------- | ---------- |
| P001      | 2501020140 | 07-06-2026 |

### Tabel Barang

| ID Barang | Nama Barang |
| --------- | ----------- |
| B001      | Laptop      |
| B002      | Proyektor   |

### Tabel Detail_Peminjaman

| ID Detail | ID Pinjam | ID Barang | Jumlah |
| --------- | --------- | --------- | ------ |
| D001      | P001      | B001      | 1      |
| D002      | P001      | B002      | 1      |

Berdasarkan hasil normalisasi hingga bentuk 2NF, data mahasiswa, barang, dan transaksi peminjaman telah dipisahkan ke dalam tabel yang berbeda. Pemisahan ini bertujuan untuk mengurangi redundansi data dan mempermudah proses pengelolaan serta pemeliharaan basis data.

---

## 5.4 Third Normal Form (3NF)

Pada tahap Third Normal Form (3NF), dilakukan penghilangan ketergantungan transitif sehingga setiap atribut non-key hanya bergantung pada primary key tabel masing-masing.

Hasil normalisasi menghasilkan sepuluh tabel utama yang digunakan dalam Sistem Manajemen Inventori Laboratorium, yaitu:

* Barang
* Kategori Barang
* Kondisi Barang
* Laboratorium
* Mahasiswa
* Laboran
* Pengguna
* Peminjaman
* Detail Peminjaman
* Pengembalian

---

# BAB VI

# KAMUS DATA

Kamus data merupakan kumpulan informasi yang menjelaskan struktur data yang digunakan dalam sistem. Kamus data berfungsi untuk memberikan deskripsi mengenai atribut, tipe data, serta fungsi dari setiap field yang terdapat pada basis data.

---

## 6.1 Tabel Barang

| Field       | Tipe Data    | Keterangan  |
| ----------- | ------------ | ----------- |
| id_barang   | INT          | Primary Key |
| nama_barang | VARCHAR(100) | Nama barang |
| jumlah_stok | INT          | Jumlah stok |
| id_kategori | INT          | Foreign Key |
| id_kondisi  | INT          | Foreign Key |
| id_lab      | INT          | Foreign Key |

---

## 6.2 Tabel Kategori_Barang

| Field         | Tipe Data   | Keterangan           |
| ------------- | ----------- | -------------------- |
| id_kategori   | INT         | Primary Key          |
| nama_kategori | VARCHAR(50) | Nama kategori barang |

---

## 6.3 Tabel Kondisi_Barang

| Field        | Tipe Data   | Keterangan     |
| ------------ | ----------- | -------------- |
| id_kondisi   | INT         | Primary Key    |
| nama_kondisi | VARCHAR(30) | Kondisi barang |

---

## 6.4 Tabel Laboratorium

| Field    | Tipe Data    | Keterangan          |
| -------- | ------------ | ------------------- |
| id_lab   | INT          | Primary Key         |
| nama_lab | VARCHAR(100) | Nama laboratorium   |
| lokasi   | VARCHAR(100) | Lokasi laboratorium |

---

## 6.5 Tabel Mahasiswa

| Field          | Tipe Data    | Keterangan         |
| -------------- | ------------ | ------------------ |
| nim            | VARCHAR(15)  | Primary Key        |
| nama_mahasiswa | VARCHAR(100) | Nama mahasiswa     |
| prodi          | VARCHAR(50)  | Program Studi      |
| semester       | INT          | Semester mahasiswa |

---

## 6.6 Tabel Laboran

| Field        | Tipe Data    | Keterangan            |
| ------------ | ------------ | --------------------- |
| id_laboran   | INT          | Primary Key           |
| nama_laboran | VARCHAR(100) | Nama laboran          |
| no_hp        | VARCHAR(15)  | Nomor telepon laboran |

---

## 6.7 Tabel Pengguna

| Field       | Tipe Data    | Keterangan          |
| ----------- | ------------ | ------------------- |
| id_pengguna | INT          | Primary Key         |
| username    | VARCHAR(50)  | Nama pengguna       |
| password    | VARCHAR(255) | Kata sandi pengguna |
| role        | VARCHAR(20)  | Hak akses pengguna  |
| id_laboran  | INT          | Foreign Key         |

---

## 6.8 Tabel Peminjaman

| Field          | Tipe Data   | Keterangan         |
| -------------- | ----------- | ------------------ |
| id_pinjam      | INT         | Primary Key        |
| tanggal_pinjam | DATE        | Tanggal peminjaman |
| status_pinjam  | VARCHAR(20) | Status peminjaman  |
| nim            | VARCHAR(15) | Foreign Key        |
| id_laboran     | INT         | Foreign Key        |

---

## 6.9 Tabel Detail_Peminjaman

| Field     | Tipe Data | Keterangan                  |
| --------- | --------- | --------------------------- |
| id_detail | INT       | Primary Key                 |
| id_pinjam | INT       | Foreign Key                 |
| id_barang | INT       | Foreign Key                 |
| jumlah    | INT       | Jumlah barang yang dipinjam |

---

## 6.10 Tabel Pengembalian

| Field           | Tipe Data   | Keterangan                       |
| --------------- | ----------- | -------------------------------- |
| id_kembali      | INT         | Primary Key                      |
| tanggal_kembali | DATE        | Tanggal pengembalian             |
| kondisi_kembali | VARCHAR(30) | Kondisi barang saat dikembalikan |
| id_pinjam       | INT         | Foreign Key                      |
