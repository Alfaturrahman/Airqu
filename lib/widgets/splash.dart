import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Center(
          child: SizedBox(
            width: 300.0,
            height: 300.0,
            child: Image.asset(
              'assets/logo/logo-splash.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
