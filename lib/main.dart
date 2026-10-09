import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const Color warnaTema = Color(0xFF6C4AB6);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PPM Sesi 2',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: warnaTema),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF7F5FC),
      ),
      home: const HalamanUtama(),
    );
  }
}

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PPM Sesi 2 - Fathir Ardiansyah (20240040008)',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 0, 0),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          BannerPromo(),
          SizedBox(height: 20),
          Text(
            'Profil Mahasiswa',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          KartuProfil(),
          SizedBox(height: 24),
          Text(
            'Produk Pilihan',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          KartuProduk(),
        ],
      ),
    );
  }
}

// BANNER PROMO MENGGUNAKAN STACK DAN POSITIONED
class BannerPromo extends StatelessWidget {
  const BannerPromo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 145,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color.fromARGB(255, 248, 0, 0), Color(0xFFAA7DF0)],
              ),
              borderRadius: BorderRadius.circular(18),
            ),
          ),
          const Positioned(
            left: 20,
            top: 24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'PROMO SPESIAL!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Belanja produk favoritmu sekarang',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 6),
                Text(
                  'Diskon menarik menantimu!',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const Positioned(
            right: 15,
            bottom: 12,
            child: Icon(Icons.local_offer, size: 42, color: Colors.white70),
          ),
        ],
      ),
    );
  }
}

// KARTU PROFIL MENGGUNAKAN STATELESSWIDGET
class KartuProfil extends StatelessWidget {
  const KartuProfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          children: [
            Container(
              width: 85,
              height: 85,
              decoration: BoxDecoration(
                color: warnaTema.withValues(alpha: 0.12),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.person, size: 55, color: warnaTema),
            ),
            const SizedBox(width: 16),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Fathir Ardiansyah',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text('NIM: 20240040008'),
                  Text('Prodi: Teknik Informatika'),
                  Text('Kelas: TI24A'),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      Icon(Icons.star, color: Colors.amber, size: 20),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// KARTU PRODUK MENGGUNAKAN STATEFULWIDGET
class KartuProduk extends StatefulWidget {
  const KartuProduk({super.key});

  @override
  State<KartuProduk> createState() => _KartuProdukState();
}

class _KartuProdukState extends State<KartuProduk> {
  bool favorit = false;
  int jumlahLike = 0;
  int jumlahProduk = 1;

  final String namaProduk = 'Headphone Wireless';
  final int hargaProduk = 150000;

  String formatRupiah(int angka) {
    String nilai = angka.toString();
    String hasil = '';
    int hitung = 0;

    for (int i = nilai.length - 1; i >= 0; i--) {
      hasil = nilai[i] + hasil;
      hitung++;

      if (hitung % 3 == 0 && i != 0) {
        hasil = '.$hasil';
      }
    }

    return 'Rp$hasil';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // PLACEHOLDER GAMBAR PRODUK
          Container(
            width: double.infinity,
            height: 170,
            color: const Color(0xFFECE5FA),
            child: const Icon(Icons.headphones, size: 100, color: warnaTema),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  namaProduk,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),

                Text(
                  formatRupiah(hargaProduk),
                  style: const TextStyle(
                    fontSize: 18,
                    color: warnaTema,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),
                const Text('Kategori: Elektronik'),

                const SizedBox(height: 12),

                // TOMBOL FAVORIT DAN JUMLAH LIKE
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          favorit = !favorit;

                          if (favorit) {
                            jumlahLike++;
                          } else {
                            jumlahLike--;
                          }
                        });
                      },
                      icon: Icon(
                        favorit ? Icons.favorite : Icons.favorite_border,
                        color: favorit ? Colors.red : Colors.grey,
                        size: 28,
                      ),
                    ),
                    Text('$jumlahLike Like'),
                  ],
                ),

                const Divider(),

                // TOMBOL PENGATUR JUMLAH PRODUK
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Jumlah produk:',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        if (jumlahProduk > 1) {
                          setState(() {
                            jumlahProduk--;
                          });
                        }
                      },
                      icon: const Icon(Icons.remove_circle_outline),
                    ),
                    Text(
                      '$jumlahProduk',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          jumlahProduk++;
                        });
                      },
                      icon: const Icon(Icons.add_circle_outline),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                // TOTAL HARGA BERUBAH OTOMATIS
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0EAFB),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Total Harga'),
                      const SizedBox(height: 4),
                      Text(
                        formatRupiah(hargaProduk * jumlahProduk),
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: warnaTema,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // TOMBOL TAMBAH KE KERANJANG
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            '$jumlahProduk $namaProduk berhasil '
                            'ditambahkan ke keranjang!',
                          ),
                          backgroundColor: warnaTema,
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    },
                    icon: const Icon(Icons.shopping_cart),
                    label: const Text('Tambah ke Keranjang'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: warnaTema,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
