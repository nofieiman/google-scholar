# 📊 Analisis Google Scholar dengan R

Proyek ini menggunakan paket `scholar` di R untuk mengambil dan menganalisis data dari profil Google Scholar dua akademisi Indonesia, serta memvisualisasikan publikasi dan kutipan mereka secara tahunan.

## 🧰 Tools yang Digunakan

- `scholar`: Mengambil data publikasi dan kutipan dari Google Scholar
- `ggplot2`: Visualisasi data
- `dplyr` dan `tidyr`: Transformasi dan manipulasi data

## 📦 Instalasi

Pastikan kamu sudah menginstal R. Kemudian, jalankan kode berikut untuk menginstal paket-paket yang dibutuhkan:

```r
install.packages(c("scholar", "ggplot2", "dplyr", "tidyr"))
```

## ▶️ Cara Menjalankan

- Ubah `userid_1` dan `userid_2` sesuai dengan ID Google Scholar yang ingin dianalisis.

- Jalankan seluruh script untuk:

        - Mengambil data publikasi dan kutipan

        - Membuat visualisasi publikasi per tahun

        - Membandingkan kutipan tahunan

        - Menganalisis trajektori karier akademik

## 📈 Contoh Output

- Grafik jumlah publikasi per tahun

- Grafik perbandingan kutipan tahunan antar akademisi

- Grafik perkembangan kutipan berdasarkan tahun karier

## 📑 Catatan

- Data diambil langsung dari Google Scholar melalui paket scholar.
  
- Visualisasi dibuat agar mudah dibaca dan dapat digunakan untuk presentasi atau analisis lebih lanjut.

## 👤 Penulis

Script sederhana ini dikembangkan untuk keperluan analisis dan visualisasi data akademik berbasis Google Scholar di lingkungan R.
