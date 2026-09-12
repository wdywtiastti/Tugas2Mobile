import 'package:flutter/material.dart';

void main() {
  runApp(const RestaurantApp());
}

class RestaurantApp extends StatelessWidget {
  const RestaurantApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Detail Restoran',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',
      ),
    );
  }
}

class DetailRestoran extends StatefulWidget {
  const DetailRestoran({super.key});

  @override
  State<DetailRestoran> createState() => _DetailRestoranState();
}

class _DetailRestoranState extends State<DetailRestoran> {
  //Menyimpan menu yang dipilh sebegai favorit
  final Set<String> favorit = {};

  //mengubbah status favorit
  void ubahFavorit(String nama) {
    setState(() {
      if (favorit.contains(nama)){
        favorit.remove(nama);
      } else {
        favorit.add(nama);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),

      appBar: AppBar(
        title: const Text(
          'La Brasserie Bistro',
          style: TextStyle(fontWeight: FontWeight.bold
          ),
        ),

        backgroundColor: (Colors.white),
        actions: [
          IconButton(onPressed: () {}, 
          icon: const Icon(Icons.share),
          )
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            //GAMBAR RESTORAN
            Image.network(
              'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4',
              height: 230,
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(25),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // NAMA RESTORAN
                  const Text(
                    'La Brasserie Bistro',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),

                      const SizedBox(width: 5),

                      const Text(
                        '4.8',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(width: 5),

                      const Text(
                        '(1250 Ulasan)',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),

                      const SizedBox(width: 15),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green.shade50,
                          borderRadius:
                              BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'Western • Bistro',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.grey,
                        size: 20,
                      ),

                      const SizedBox(width: 5),

                      const Expanded(
                        child: Text(
                          'Jl. Kemang Raya No.45, Jakarta Selatan',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceAround,
                      children: const [

                        InfoStat(
                          icon: Icons.near_me,
                          value: '2.5 km',
                          label: 'Jarak',
                        ),

                        InfoStat(
                          icon: Icons.access_time,
                          value: '10.00 - 22.00',
                          label: 'Waktu Buka',
                        ),

                        InfoStat(
                          icon: Icons.restaurant,
                          value: 'Rp 100.000',
                          label: 'Harga Rata-rata',
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    'La Brasserie Bistro menghadirkan pengalaman '
                    'bersantap dengan cita rasa khas Eropa dalam '
                    'suasana yang hangat dan elegan. Menggunakan '
                    'bahan-bahan segar pilihan dan racikan chef '
                    'berpengalaman untuk setiap hidangan istimewa.',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.grey,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 25),

                  // JUDUL MENU
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Menu Populer',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Lihat Semua',
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  Row(
                    children: [

                      // STEAK
                      MenuCard(
                        gambar:
                            'https://images.unsplash.com/photo-1544025162-d76694265947',
                        nama: 'Grilled Sirloin Steak',
                        harga: 'Rp 145.000',
                        isFavorite:
                            favorit.contains(
                          'Grilled Sirloin Steak',
                        ),
                        onFavorite: () {
                          ubahFavorit(
                            'Grilled Sirloin Steak',
                          );
                        },
                      ),

                      const SizedBox(width: 10),

                      // CARBONARA
                      MenuCard(
                        gambar:
                            'https://images.unsplash.com/photo-1473093295043-cdd812d0e601',
                        nama: 'Truffle Carbonara',
                        harga: 'Rp 98.000',
                        isFavorite:
                            favorit.contains(
                          'Truffle Carbonara',
                        ),
                        onFavorite: () {
                          ubahFavorit(
                            'Truffle Carbonara',
                          );
                        },
                      ),

                      const SizedBox(width: 10),

                      // SALMON
                      MenuCard(
                        gambar:
                            'https://images.unsplash.com/photo-1467003909585-2f8a72700288',
                        nama: 'Grilled Salmon',
                        harga: 'Rp 128.000',
                        isFavorite:
                            favorit.contains(
                          'Grilled Salmon',
                        ),
                        onFavorite: () {
                          ubahFavorit(
                            'Grilled Salmon',
                          );
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 90),
                ],
              ),
            ),
          ],
        ),
      ),

      // TOMBOL RESERVASI
      floatingActionButton:
          FloatingActionButton.extended(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Reservasi berhasil dipilih!',
              ),
            ),
          );
        },
        backgroundColor: Colors.teal,
        icon: const Icon(Icons.calendar_month),
        label: const Text(
          'Reservasi Sekarang',
        ),
      ),

      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerFloat,
    );
  }
}

class InfoStat extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const InfoStat({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.teal,
        ),

        const SizedBox(height: 5),

        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 3),

        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}


// WIDGET MENU
class MenuCard extends StatelessWidget {
  final String gambar;
  final String nama;
  final String harga;

  // Status favorit
  final bool isFavorite;

  // Fungsi ketika tombol love ditekan
  final VoidCallback onFavorite;

  const MenuCard({
    super.key,
    required this.gambar,
    required this.nama,
    required this.harga,
    required this.isFavorite,
    required this.onFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [

            // STACK
            Stack(
              children: [

                // GAMBAR MENU
                Image.network(
                  gambar,
                  height: 100,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),

                // TOMBOL LOVE
                Positioned(
                  right: 5,
                  top: 5,
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.white,

                    child: IconButton(
                      padding: EdgeInsets.zero,

                      // Jalankan fungsi favorit
                      onPressed: onFavorite,

                      // Icon berubah sesuai status
                      icon: Icon(
                        isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,

                        // Warna berubah sesuai status
                        color: isFavorite
                            ? Colors.red
                            : Colors.grey,

                        size: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // NAMA DAN HARGA
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [

                  Text(
                    nama,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    harga,
                    style: const TextStyle(
                      color: Colors.teal,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
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
