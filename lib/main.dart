import 'package:airqu/controller/aqi_service.dart';
import 'package:airqu/view/detail_info.dart';
import 'package:airqu/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:airqu/widgets/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, Key? tes});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreenDelay(),
      },
    );
  }
}

class SplashScreenDelay extends StatelessWidget {
  const SplashScreenDelay({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.wait([
        Future.delayed(const Duration(seconds: 4)),
        fetchAQIData(
            'a58f6d7e00780076b434eca9af9ae43f95b71912') // Pastikan ini sesuai dengan fungsi yang ada di aqi_service.dart
      ]),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SplashScreen();
        } else if (snapshot.hasData) {
          // Make sure snapshot.data is not null before using it
          return MyHomePage(aqiData: snapshot.data?[0] ?? {});
        } else {
          // Handle the scenario where there is no data or there is an error
          return const SomethingWentWrongScreen();
        }
      },
    );
  }
}

class SomethingWentWrongScreen extends StatelessWidget {
  const SomethingWentWrongScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 60,
            ),
            const SizedBox(height: 16),
            const Text(
              'Something went wrong!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Unable to load data. Please try again later.',
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement your error handling logic here
                // For example, you might want to pop the current screen or retry the failed operation
              },
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
