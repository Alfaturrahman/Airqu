import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> fetchAQIData(String token) async {
  const String url =
      'https://api.waqi.info/feed/here/?token=a58f6d7e00780076b434eca9af9ae43f95b71912';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load AQI data');
  }
}

void main() async {
  String token =
      'a58f6d7e00780076b434eca9af9ae43f95b71912'; // Gunakan token Anda
  try {
    Map<String, dynamic> data = await fetchAQIData(token);
    print(data);
  } catch (e) {
    print('Error: $e');
  }
}
