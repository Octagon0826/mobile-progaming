
import 'package:flutter/material.dart';

void main() {
  runApp(const WisataIndonesiaApp());
}

class WisataIndonesiaApp extends StatelessWidget {
  const WisataIndonesiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wisata Indonesia',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F7FA),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/pantai': (context) => const PantaiPage(),
        '/gunung': (context) => const GunungPage(),
        '/budaya': (context) => const BudayaPage(),
        '/kuliner': (context) => const KulinerPage(),
      },
    );
  }
}

// MODEL DATA WISATA

class WisataItem {
  final String nama;
  final String deskripsi;
  final String lokasi;
  final IconData icon;

  const WisataItem({
    required this.nama,
    required this.deskripsi,
    required this.lokasi,
    required this.icon,
  });
}

// HALAMAN BERANDA


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final menus = [
      {
        'nama': 'Pantai',
        'deskripsi': 'Wisata bahari Indonesia',
        'icon': Icons.beach_access,
        'warna': Colors.blue,
        'route': '/pantai',
      },
      {
        'nama': 'Gunung',
        'deskripsi': 'Keindahan alam pegunungan',
        'icon': Icons.landscape,
        'warna': Colors.green,
        'route': '/gunung',
      },
      {
        'nama': 'Budaya',
        'deskripsi': 'Warisan budaya Nusantara',
        'icon': Icons.account_balance,
        'warna': Colors.orange,
        'route': '/budaya',
      },
      {
        'nama': 'Kuliner',
        'deskripsi': 'Makanan khas daerah',
        'icon': Icons.restaurant,
        'warna': Colors.red,
        'route': '/kuliner',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Wisata Indonesia',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // BANNER JELAJAHI INDONESIA
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.travel_explore,
                      color: Colors.white,
                      size: 38,
                    ),
                    SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Jelajahi Indonesia!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Temukan keindahan alam, budaya, dan kuliner Nusantara.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              const Text(
                'Kategori Wisata',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              // GRID 2 X 2 MENYESUAIKAN LAYAR
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final tinggiKartu =
                        (constraints.maxHeight - 12) / 2;

                    final lebarKartu =
                        (constraints.maxWidth - 12) / 2;

                    final rasio =
                        lebarKartu / tinggiKartu;

                    return GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: rasio,
                      physics:
                          const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,

                      children: menus.map((menu) {
                        final warna = menu['warna'] as Color;

                        return InkWell(
                          borderRadius:
                              BorderRadius.circular(16),
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              menu['route'] as String,
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black
                                      .withOpacity(0.06),
                                  blurRadius: 7,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),

                            child: LayoutBuilder(
                              builder: (context, cardSize) {
                                final ukuranIkon =
                                    (cardSize.maxHeight * 0.27)
                                        .clamp(20.0, 40.0);

                                final layarKecil =
                                    cardSize.maxHeight < 105;

                                return Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      menu['icon'] as IconData,
                                      color: warna,
                                      size: ukuranIkon,
                                    ),

                                    const SizedBox(height: 6),

                                    Text(
                                      menu['nama'] as String,
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      overflow:
                                          TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize:
                                            layarKecil ? 13 : 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    if (!layarKecil) ...[
                                      const SizedBox(height: 4),
                                      Text(
                                        menu['deskripsi'] as String,
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        overflow:
                                            TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 11,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ],
                                );
                              },
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// HALAMAN KATEGORI

class PantaiPage extends StatelessWidget {
  const PantaiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const KategoriPage(
      judul: 'Wisata Pantai',
      ikon: Icons.beach_access,
      warna: Colors.blue,
      items: [
        WisataItem(
          nama: 'Pantai Kuta',
          lokasi: 'Bali',
          deskripsi:
              'Pantai Kuta terkenal dengan pasir putih, ombak, dan pemandangan matahari terbenam yang indah.',
          icon: Icons.waves,
        ),
        WisataItem(
          nama: 'Pantai Parangtritis',
          lokasi: 'Yogyakarta',
          deskripsi:
              'Pantai yang terkenal dengan hamparan pasir luas dan pemandangan laut selatan.',
          icon: Icons.beach_access,
        ),
        WisataItem(
          nama: 'Pantai Tanjung Tinggi',
          lokasi: 'Belitung',
          deskripsi:
              'Pantai dengan pasir putih dan batu granit besar yang menjadi daya tarik wisata.',
          icon: Icons.water,
        ),
      ],
    );
  }
}

class GunungPage extends StatelessWidget {
  const GunungPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const KategoriPage(
      judul: 'Wisata Gunung',
      ikon: Icons.landscape,
      warna: Colors.green,
      items: [
        WisataItem(
          nama: 'Gunung Bromo',
          lokasi: 'Jawa Timur',
          deskripsi:
              'Gunung Bromo terkenal dengan pemandangan matahari terbit dan lautan pasir.',
          icon: Icons.landscape,
        ),
        WisataItem(
          nama: 'Gunung Rinjani',
          lokasi: 'Lombok',
          deskripsi:
              'Gunung Rinjani memiliki pemandangan alam yang indah dan Danau Segara Anak.',
          icon: Icons.terrain,
        ),
        WisataItem(
          nama: 'Gunung Semeru',
          lokasi: 'Jawa Timur',
          deskripsi:
              'Gunung Semeru merupakan gunung tertinggi di Pulau Jawa.',
          icon: Icons.filter_hdr,
        ),
      ],
    );
  }
}

class BudayaPage extends StatelessWidget {
  const BudayaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const KategoriPage(
      judul: 'Wisata Budaya',
      ikon: Icons.account_balance,
      warna: Colors.orange,
      items: [
        WisataItem(
          nama: 'Candi Borobudur',
          lokasi: 'Magelang',
          deskripsi:
              'Candi Buddha terbesar di dunia yang memiliki nilai sejarah dan budaya tinggi.',
          icon: Icons.temple_buddhist,
        ),
        WisataItem(
          nama: 'Rumah Gadang',
          lokasi: 'Sumatera Barat',
          deskripsi:
              'Rumah adat Minangkabau yang memiliki bentuk atap khas menyerupai tanduk kerbau.',
          icon: Icons.house,
        ),
        WisataItem(
          nama: 'Tari Kecak',
          lokasi: 'Bali',
          deskripsi:
              'Tarian tradisional Bali yang menampilkan pertunjukan dengan suara cak yang khas.',
          icon: Icons.theater_comedy,
        ),
      ],
    );
  }
}

class KulinerPage extends StatelessWidget {
  const KulinerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const KategoriPage(
      judul: 'Wisata Kuliner',
      ikon: Icons.restaurant,
      warna: Colors.red,
      items: [
        WisataItem(
          nama: 'Rendang',
          lokasi: 'Sumatera Barat',
          deskripsi:
              'Makanan khas Minangkabau berbahan daging sapi dengan bumbu rempah yang kaya rasa.',
          icon: Icons.restaurant,
        ),
        WisataItem(
          nama: 'Gudeg',
          lokasi: 'Yogyakarta',
          deskripsi:
              'Makanan khas Yogyakarta berbahan nangka muda yang dimasak dengan santan dan gula aren.',
          icon: Icons.rice_bowl,
        ),
        WisataItem(
          nama: 'Pempek',
          lokasi: 'Palembang',
          deskripsi:
              'Makanan khas Palembang berbahan ikan dan sagu yang disajikan dengan kuah cuko.',
          icon: Icons.dinner_dining,
        ),
      ],
    );
  }
}

// TAMPILAN UMUM HALAMAN KATEGORI

class KategoriPage extends StatelessWidget {
  final String judul;
  final IconData ikon;
  final Color warna;
  final List<WisataItem> items;

  const KategoriPage({
    super.key,
    required this.judul,
    required this.ikon,
    required this.warna,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(judul),
        backgroundColor: warna,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final wisata = items[index];

          return Card(
            color: Colors.white,
            margin: const EdgeInsets.only(bottom: 14),
            child: ListTile(
              contentPadding: const EdgeInsets.all(14),
              leading: CircleAvatar(
                backgroundColor: warna.withOpacity(0.12),
                child: Icon(wisata.icon, color: warna),
              ),
              title: Text(
                wisata.nama,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(wisata.lokasi),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailWisataPage(
                      wisata: wisata,
                      warna: warna,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// HALAMAN DETAIL WISATA

class DetailWisataPage extends StatelessWidget {
  final WisataItem wisata;
  final Color warna;

  const DetailWisataPage({
    super.key,
    required this.wisata,
    required this.warna,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Wisata'),
        backgroundColor: warna,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                color: warna.withOpacity(0.12),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Icon(
                wisata.icon,
                size: 85,
                color: warna,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              wisata.nama,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.location_on, color: warna),
                const SizedBox(width: 5),
                Text(
                  wisata.lokasi,
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Deskripsi Wisata',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              wisata.deskripsi,
              style: const TextStyle(
                fontSize: 15,
                height: 1.6,
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text('Kembali'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: warna,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
