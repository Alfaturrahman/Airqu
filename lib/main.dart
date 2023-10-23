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
      initialRoute: '/', // Set initialRoute to '/'
      routes: {
        '/': (context) =>
            const SplashScreenDelay(), // Use '/' as the initial route
        // 'home': (context) => HomeScreen(),
        // 'login': (context) => LoginScreen(),
      },
    );
  }
}

class SplashScreenDelay extends StatelessWidget {
  const SplashScreenDelay({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 4)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SplashScreen();
        } else {
          return const MyHomePage(); // Ganti dengan halaman beranda Anda.
        }
      },
    );
  }
}
