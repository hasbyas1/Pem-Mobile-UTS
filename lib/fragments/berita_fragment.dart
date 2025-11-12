import 'package:flutter/material.dart';

class BeritaFragment extends StatelessWidget {
  const BeritaFragment({super.key});

  @override
  Widget build(BuildContext context) {
    // Data berita statis
    final List<Map<String, String>> beritaList = [
      {
        'judul': 'Teknologi AI Terbaru Mengubah Dunia Pendidikan',
        'kategori': 'Teknologi',
        'tanggal': '11 Nov 2025',
        'deskripsi':
            'Artificial Intelligence semakin banyak digunakan dalam sistem pembelajaran modern...',
      },
      {
        'judul': 'Perekonomian Indonesia Tumbuh 5.2% di Kuartal III',
        'kategori': 'Ekonomi',
        'tanggal': '10 Nov 2025',
        'deskripsi':
            'Badan Pusat Statistik mencatat pertumbuhan ekonomi yang positif pada kuartal ini...',
      },
      {
        'judul': 'Timnas Indonesia Lolos ke Piala Dunia 2026',
        'kategori': 'Olahraga',
        'tanggal': '09 Nov 2025',
        'deskripsi':
            'Kemenangan gemilang atas Thailand membawa Indonesia ke kompetisi tertinggi...',
      },
      {
        'judul': 'Inovasi Energi Terbarukan di Indonesia',
        'kategori': 'Lingkungan',
        'tanggal': '08 Nov 2025',
        'deskripsi':
            'Pemerintah terus mendorong penggunaan energi bersih untuk masa depan...',
      },
      {
        'judul': 'Festival Budaya Nusantara Digelar di Jakarta',
        'kategori': 'Budaya',
        'tanggal': '07 Nov 2025',
        'deskripsi':
            'Ribuan pengunjung memadati venue untuk menyaksikan keragaman budaya Indonesia...',
      },
      {
        'judul': 'Startup Indonesia Raih Pendanaan 50 Juta Dollar',
        'kategori': 'Bisnis',
        'tanggal': '06 Nov 2025',
        'deskripsi':
            'Perusahaan teknologi lokal berhasil menarik investor internasional...',
      },
      {
        'judul': 'Terobosan Baru dalam Pengobatan Kanker',
        'kategori': 'Kesehatan',
        'tanggal': '05 Nov 2025',
        'deskripsi':
            'Peneliti menemukan metode terapi yang lebih efektif dan minim efek samping...',
      },
      {
        'judul': 'Peluncuran Satelit Komunikasi Nusantara',
        'kategori': 'Teknologi',
        'tanggal': '04 Nov 2025',
        'deskripsi':
            'Indonesia meluncurkan satelit untuk meningkatkan konektivitas digital...',
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: beritaList.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 3,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: InkWell(
            onTap: () {
              // Aksi ketika berita diklik
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(beritaList[index]['judul']!),
                  content: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.category,
                                size: 16, color: Colors.grey.shade600),
                            const SizedBox(width: 5),
                            Text(
                              beritaList[index]['kategori']!,
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(width: 15),
                            Icon(Icons.calendar_today,
                                size: 16, color: Colors.grey.shade600),
                            const SizedBox(width: 5),
                            Text(
                              beritaList[index]['tanggal']!,
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Text(beritaList[index]['deskripsi']!),
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Tutup'),
                    ),
                  ],
                ),
              );
            },
            borderRadius: BorderRadius.circular(15),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image placeholder
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.article,
                      size: 40,
                      color: Colors.blue.shade700,
                    ),
                  ),

                  const SizedBox(width: 15),

                  // Content
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Judul berita
                        Text(
                          beritaList[index]['judul']!,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),

                        const SizedBox(height: 8),

                        // Kategori
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            beritaList[index]['kategori']!,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.blue.shade700,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),

                        const SizedBox(height: 8),

                        // Tanggal
                        Row(
                          children: [
                            Icon(
                              Icons.access_time,
                              size: 14,
                              color: Colors.grey.shade600,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              beritaList[index]['tanggal']!,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
