import 'package:flutter/material.dart';

class CuacaFragment extends StatelessWidget {
  const CuacaFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.blue.shade400,
            Colors.blue.shade700,
          ],
        ),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Location
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.location_on, color: Colors.white, size: 24),
                SizedBox(width: 8),
                Text(
                  'Bandung, Indonesia',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            // Weather Icon (Animasi bisa ditambahkan nanti)
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.wb_sunny,
                size: 100,
                color: Colors.yellow,
              ),
            ),

            const SizedBox(height: 20),

            // Temperature
            const Text(
              '28°C',
              style: TextStyle(
                fontSize: 64,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const Text(
              'Cerah Berawan',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white70,
              ),
            ),

            const SizedBox(height: 40),

            // Weather Details Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  _buildWeatherDetail(
                    Icons.water_drop,
                    'Kelembapan',
                    '65%',
                  ),
                  const Divider(color: Colors.white30, height: 30),
                  _buildWeatherDetail(
                    Icons.air,
                    'Kecepatan Angin',
                    '12 km/h',
                  ),
                  const Divider(color: Colors.white30, height: 30),
                  _buildWeatherDetail(
                    Icons.thermostat,
                    'Terasa Seperti',
                    '30°C',
                  ),
                  const Divider(color: Colors.white30, height: 30),
                  _buildWeatherDetail(
                    Icons.visibility,
                    'Jarak Pandang',
                    '10 km',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Forecast (Perkiraan beberapa hari ke depan)
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Perkiraan 3 Hari',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 15),
                  _buildForecastItem('Besok', Icons.wb_cloudy, '27°', '24°'),
                  const SizedBox(height: 10),
                  _buildForecastItem('Rabu', Icons.cloud, '26°', '23°'),
                  const SizedBox(height: 10),
                  _buildForecastItem('Kamis', Icons.wb_sunny, '29°', '25°'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeatherDetail(IconData icon, String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.white, size: 24),
            const SizedBox(width: 12),
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
          ],
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildForecastItem(
      String day, IconData icon, String maxTemp, String minTemp) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 60,
            child: Text(
              day,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Icon(icon, color: Colors.white, size: 28),
          Row(
            children: [
              Text(
                maxTemp,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Text(
                ' / ',
                style: TextStyle(color: Colors.white54),
              ),
              Text(
                minTemp,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
