import 'package:flutter/material.dart';

class KontakFragment extends StatelessWidget {
  const KontakFragment({super.key});

  @override
  Widget build(BuildContext context) {
    // Data kontak statis (15 kontak)
    final List<Map<String, String>> kontakList = [
      {'nama': 'Pirman Fawn', 'telepon': '0812-3456-7890'},
      {'nama': 'Yosapat Napt', 'telepon': '0813-4567-8901'},
      {'nama': 'Ragus Rahmat', 'telepon': '0814-5678-9012'},
      {'nama': 'Nopal Febri', 'telepon': '0815-6789-0123'},
      {'nama': 'Ilham Daiva', 'telepon': '0816-7890-1234'},
      {'nama': 'Day Rohana', 'telepon': '0817-8901-2345'},
      {'nama': 'Nas Bella', 'telepon': '0818-9012-3456'},
      {'nama': 'Bakti Cemara', 'telepon': '0819-0123-4567'},
      {'nama': 'Ozil Innaka', 'telepon': '0821-1234-5678'},
      {'nama': 'Aurial Putri', 'telepon': '0822-2345-6789'},
      {'nama': 'Andar I', 'telepon': '0823-3456-7890'},
      {'nama': 'Dennis Nyssus', 'telepon': '0899-5678-9012'},
      {'nama': 'Nanda Pratama', 'telepon': '0899-6789-0123'},
      {'nama': 'Silas Grey', 'telepon': '0899-4567-8901'},
      {'nama': 'Zak', 'telepon': '0899-7890-1234'},
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: kontakList.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 2,
          margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            // Circle Avatar untuk foto
            leading: CircleAvatar(
              radius: 28,
              backgroundColor: Colors.blue.shade700,
              child: Text(
                kontakList[index]['nama']![0].toUpperCase(),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            // Nama kontak
            title: Text(
              kontakList[index]['nama']!,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Nomor telepon
            subtitle: Text(
              kontakList[index]['telepon']!,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
              ),
            ),
            // Icon telepon di kanan
            trailing: IconButton(
              icon: Icon(
                Icons.phone,
                color: Colors.green.shade600,
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Memanggil ${kontakList[index]['nama']}...',
                    ),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
