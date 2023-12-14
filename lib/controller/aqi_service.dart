import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> fetchAQIData(String token) async {
  const String url =
      'https://api.waqi.info/feed/@8645/?token=a58f6d7e00780076b434eca9af9ae43f95b71912';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load AQI data');
  }
}

// Fungsi untuk mendapatkan data historis 48 jam terakhir
Future<Map<String, dynamic>> fetchLast48HoursAQIHistoricalData(
    String token, String stationId) async {
  var now = DateTime.now();
  var fortyEightHoursAgo = now.subtract(const Duration(hours: 48));
  var startTime = fortyEightHoursAgo.toUtc().millisecondsSinceEpoch ~/ 1000;
  var endTime = now.toUtc().millisecondsSinceEpoch ~/ 1000;

  var url = Uri.parse(
      'https://api.waqi.info/feed/@$stationId/?start=$startTime&end=$endTime&token=$token');
  var response = await http.get(url);

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load last 48 hours AQI historical data');
  }
}

// Fungsi untuk mencdapatkan prediksi polusi
// Pastikan URL dan parameter sesuai dengan dokumentasi API AQICN
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

void main() async {
  String token =
      'a58f6d7e00780076b434eca9af9ae43f95b71912'; // Replace with your actual token
  String stationId = '8645'; // Replace with the actual station ID

  try {
    Map<String, dynamic> currentData = await fetchAQIData(token);
    Map<String, dynamic> historicalData =
        await fetchLast48HoursAQIHistoricalData(token, stationId);
    Map<String, dynamic> forecastData =
        await fetchAQIForecastData(token, stationId);

    print("Current Data: $currentData");
    print("Historical Data: $historicalData");
    print("Forecast Data: $forecastData");
  } catch (e) {
    print('Error: $e');
  }
}
