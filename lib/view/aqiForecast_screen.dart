import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class AQI extends StatefulWidget {
  const AQI({Key? key}) : super(key: key);

  @override
  _AQIState createState() => _AQIState();
}

class _AQIState extends State<AQI> {
  List<String> days = List.filled(7, '');
  List<int> pm25Values = List.filled(7, 0);
  List<int> temperatureValues = List.filled(7, 0);
  List<int> pressureValues = List.filled(7, 0);
  List<int> humidityValues = List.filled(7, 0);
  List<int> windValues = List.filled(7, 0);
  List<IconData> conditionIcons = List.filled(7, Icons.error);

  @override
  void initState() {
    super.initState();
    _fetchForecastData();
  }

  Future<Map<String, dynamic>> fetchAQIForecastData(
      String token, String stationId) async {
    var url = Uri.parse(
        'https://api.waqi.info/feed/@$stationId/forecast/?token=$token');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load AQI forecast data');
    }
  }

  Future<void> _fetchForecastData() async {
    String token = 'a58f6d7e00780076b434eca9af9ae43f95b71912';
    String stationId = '8645'; // Ganti dengan ID stasiun yang diinginkan

    try {
      Map<String, dynamic> forecastData =
          await fetchAQIForecastData(token, stationId);

      setState(() {
        for (int i = 0; i < 7; i++) {
          var forecast = forecastData['data']['forecast']['daily'][i];
          final DateTime date =
              DateTime.now().add(Duration(days: i + 1)); // Hari ke depan
          days[i] = DateFormat.EEEE().format(date);

          pm25Values[i] = _parseValue(forecast['pm25']);
          temperatureValues[i] = _parseValue(forecast['temperature']);
          pressureValues[i] = _parseValue(forecast['pressure']);
          humidityValues[i] = _parseValue(forecast['humidity']);
          windValues[i] = _parseValue(forecast['wind']);
        }
      });
    } catch (e) {
      print('Error fetching forecast data: $e');
    }
  }

  int _parseValue(dynamic value) {
    if (value is String) {
      return int.tryParse(value) ?? 0;
    } else if (value is int) {
      return value;
    }
    return 0;
  }

  IconData _getAQIIcon(String condition) {
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('AQI Forecast'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SizedBox(
                height: 60,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: days.asMap().entries.map(
                    (entry) {
                      int index = entry.key;
                      String day = days[index];
                      String pm25 = pm25Values[index].toString();
                      String temperature = temperatureValues[index].toString();
                      String pressure = pressureValues[index].toString();
                      String humidity = humidityValues[index].toString();
                      String wind = windValues[index].toString();

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
                            height: 200,
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
                                  _getAQIIcon(
                                      ''), // Tampilkan ikon sesuai dengan kondisi
                                  size: 30,
                                  color: Colors.blue,
                                ),
                                Text(
                                  'PM2.5: $pm25', // Tampilkan PM2.5
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Temp: $temperature°C', // Tampilkan Temperatur
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Pressure: $pressure', // Tampilkan Pressure
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Humidity: $humidity%', // Tampilkan Humidity
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Wind: $wind m/s', // Tampilkan Wind
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

void main() {
  runApp(const MaterialApp(
    home: AQI(),
  ));
}
