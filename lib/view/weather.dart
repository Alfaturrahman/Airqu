import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class Weather extends StatefulWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  List<String> days = List.filled(7, '');
  List<String> images = List.filled(7, '');
  List<int> percentages = List.filled(7, 0);
  List<String> conditions = List.filled(7, '');
  List<IconData> conditionIcons = List.filled(7, Icons.error);

  @override
  void initState() {
    super.initState();
    _fetchWeatherData();
  }

  Future<void> _fetchWeatherData() async {
    const apiKey = '0ddeff9f35c14d52bca85956231012';
    const city = 'Kota Batam'; // Ganti dengan kota yang diinginkan
    const apiUrl =
        'https://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=$city&days=7';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      Map<String, dynamic> weatherData = json.decode(response.body);

      setState(() {
        for (int i = 0; i < 7; i++) {
          final DateTime date =
              DateTime.parse(weatherData['forecast']['forecastday'][i]['date']);
          days[i] = DateFormat.EEEE()
              .format(date); // Format tanggal menjadi nama hari
          images[i] = weatherData['forecast']['forecastday'][i]['day']
              ['condition']['icon'];
          percentages[i] = weatherData['forecast']['forecastday'][i]['day']
                  ['avgtemp_c']
              .round();
          conditions[i] = weatherData['forecast']['forecastday'][i]['day']
              ['condition']['text'];

          String conditionText = weatherData['forecast']['forecastday'][i]
              ['day']['condition']['text'];
          conditions[i] = conditionText;
          // Menentukan ikon berdasarkan deskripsi kondisi cuaca
          conditionIcons[i] = _getWeatherIcon(conditionText);
        }
      });
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  IconData _getWeatherIcon(String condition) {
    switch (condition.toLowerCase()) {
      case 'sunny':
        return Icons.wb_sunny;
      case 'patchy rain possible':
        return Icons.cloud;
      case 'moderate rain':
        return Icons.beach_access;
      // Tambahkan kasus lain sesuai dengan kondisi cuaca yang Anda perlukan
      default:
        return Icons.error; // Ikon default jika kondisi tidak dikenali
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.4,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: Icon(
                (Icons.wb_sunny),
                size: 30,
              ),
            ),
            const Center(
              child: Text(
                'Today',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: Text(
                percentages[0].toString(),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: Text(
                conditions[0].toString(),
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: SizedBox(
                height: 60,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: days.asMap().entries.map(
                    (entry) {
                      int index = entry.key;
                      String day = days[index];
                      String imageUrl = images[index];
                      int percentage = percentages[index];
                      String condition = conditions[index];
                      IconData conditionIcon = conditionIcons[index];

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Card(
                          child: Container(
                            width: 125,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            height: 60,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  day,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(
                                  conditionIcon, // Tampilkan ikon kondisi cuaca
                                  size: 30, // Sesuaikan ukuran ikon
                                  color: Colors.blue, // Sesuaikan warna ikon
                                ),
                                Text(
                                  condition,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '$percentage°C',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
