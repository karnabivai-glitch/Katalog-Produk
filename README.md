# Katalog Produk (GitHub Pages + Nhost)

Katalog statis (HTML + JavaScript) yang membaca data dari Nhost. Pelanggan melihat katalog dan memesan lewat WhatsApp. Admin login untuk mengelola produk.

## 1. Siapkan Nhost
1. Buat proyek di https://app.nhost.io, lalu catat **subdomain** dan **region**.
2. Buka **Database > SQL**, tempel isi `schema.sql`, jalankan, dan centang **Track this**.
3. Di **Auth > Settings**, **matikan sign-up** (Disable sign-ups), supaya orang luar tidak bisa mendaftar.
4. Di **Auth > Users**, buat 1 pengguna admin (email + password) secara manual.

## 2. Atur permission (Hasura Console > Data > tabel > Permissions)
| Tabel | Role | Izin |
|---|---|---|
| `products` | `public` | select (semua kolom, tanpa filter) |
| `products` | `user` | select, insert, update, delete (semua kolom, tanpa filter) |
| `store_settings` | `public` | select (semua kolom) |
| `store_settings` | `user` | select, update (semua kolom) |
| `storage.files` | `public` | select (tanpa filter, agar foto tampil) |
| `storage.files` | `user` | select, insert, delete (tanpa filter) |

Karena sign-up dimatikan, hanya admin yang punya role `user`.

## 3. Isi config.js
Ganti `subdomain` dan `region` dengan milik proyek Nhost Anda.

## 4. Upload ke GitHub
```
git init
git add .
git commit -m "Katalog produk"
git branch -M main
git remote add origin https://github.com/USERNAME/NAMA-REPO.git
git push -u origin main
```
Di GitHub: **Settings > Pages > Source: Deploy from a branch > main / (root)**. Alamat katalog: `https://USERNAME.github.io/NAMA-REPO/`

## 5. Pakai
- Klik tulisan kecil **Admin** di bagian bawah halaman, lalu login.
- Klik **Buka mode edit** untuk tambah, edit, hapus produk dan ubah pengaturan toko (termasuk nomor WhatsApp).

## Pemecahan masalah
- "field not found" / tabel tidak ada: tabel belum di-track atau permission `public` belum diatur.
- Foto tidak tampil: permission `public` select pada `storage.files` belum diatur.
- Error CORS: di Nhost, pastikan domain GitHub Pages Anda diizinkan (default biasanya sudah terbuka).
