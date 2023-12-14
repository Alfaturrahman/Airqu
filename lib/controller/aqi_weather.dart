import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Map<String, dynamic>> getWeatherData(String city) async {
  const apiKey = '0ddeff9f35c14d52bca85956231012';
  final apiUrl =
      'https://api.weatherapi.com/v1/current.json?key=$apiKey&q=$city';

  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load weather data');
  }
}
