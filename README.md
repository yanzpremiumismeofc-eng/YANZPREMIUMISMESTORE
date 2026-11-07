# YANZ PREMIUMISME — Clean Glass Release

## Tampilan
- Menggunakan satu font stack konsisten: Arial / Helvetica / sans-serif.
- Banner asli `public/banner.jpg` ditampilkan utuh dan tajam tanpa overlay atau blur.
- Liquid glass yang terlihat pada navbar, kontrol, kartu, panel statistik, dan modal.
- Light/dark mode, layout responsif, animasi lembut, dan dukungan reduced motion/transparency.
- Musik latar `public/music.mp3` mencoba autoplay. Browser dapat memblokir autoplay bersuara; tombol musik tersedia untuk aktivasi manual.

## Menjalankan lokal
1. Salin `.env.example` menjadi `.env.local`.
2. Isi `NEXT_PUBLIC_SUPABASE_URL` dan `NEXT_PUBLIC_SUPABASE_ANON_KEY`.
3. Jalankan SQL lengkap dari `supabase.sql` di Supabase SQL Editor.
4. Jalankan:

```bash
npm install
npm run dev
```

Buka `http://localhost:3000`.

## Penjualan dan verifikasi pembayaran
- Checkout membuat pesanan dengan status `awaiting_confirmation`.
- Admin utama `yanz.premiumismeofc@gmail.com` dapat melihat daftar pesanan dari panel admin.
- Setelah memeriksa pembayaran yang masuk, admin menekan **Tandai lunas**.
- Statistik penjualan publik bertambah berdasarkan jumlah unit pada pesanan berstatus `paid` saja. Pesanan menunggu atau belum diverifikasi tidak dihitung.
- Angka awal statistik mengikuti baseline yang sudah ada, yaitu 1.281.400 unit.

## Keamanan
- Jalankan SQL terbaru agar policy admin dapat membaca seluruh pesanan dan hanya admin utama dapat memperbarui status pesanan.
- Kebijakan database dan Storage tetap membatasi pengelolaan katalog/gambar ke email admin.
- Jangan pernah menaruh Supabase service-role key di browser atau `.env` dengan awalan `NEXT_PUBLIC_`.

## Autoplay
Autoplay audio dengan suara tidak dapat dipaksakan oleh website. Chrome, Safari, dan browser mobile dapat menolak `play()` sampai pengunjung melakukan interaksi. Website mencoba autoplay ketika dibuka dan mencoba ulang pada interaksi pertama; tombol musik tetap disediakan sebagai fallback.
