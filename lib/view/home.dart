import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: const Text(
          'Ramalan Cuaca',
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.search_outlined,
                  color: Colors.black,
                ),
                onPressed: () {
                  // Tindakan yang ingin Anda eksekusi ketika ikon ditekan
                },
              ),
              const SizedBox(width: 10.0), // Menambahkan jarak horizontal
              IconButton(
                icon: const Icon(
                  Icons.mail_lock_outlined,
                  color: Colors.black,
                ),
                onPressed: () {
                  // Tindakan yang ingin Anda eksekusi ketika ikon ditekan
                },
              ),
              const SizedBox(width: 10.0),
            ],
          ),
        ],
      ),
      body: const Column(
        children: [
          Text(
            'Halo, Alfaturrahman',
            style: TextStyle(
              color: Colors.black,
              fontSize: 35.0,
            ),
          ),
          Text(
            'Halo, Alfaturrahman',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
            ),
          ),
          // Tempatkan widget lain di sini sesuai kebutuhan Anda
        ],
      ),
    );
  }
}
