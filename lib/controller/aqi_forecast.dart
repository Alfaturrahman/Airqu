import 'dart:convert';
import 'package:http/http.dart' as http;

class AQIService {
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

  Future<Map<String, dynamic>> fetchAQIHistoricalData(
      String token, String stationId) async {
    var url = Uri.parse('https://api.waqi.info/feed/@$stationId/?token=$token');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load historical AQI data');
    }
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
}
