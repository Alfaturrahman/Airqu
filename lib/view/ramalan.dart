import 'package:flutter/material.dart';

class RamalanPage extends StatefulWidget {
  const RamalanPage({super.key});

  @override
  _RamalanPageState createState() => _RamalanPageState();
}

class _RamalanPageState extends State<RamalanPage> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  backgroundColor: Colors.white,
  title: Text(
    'Ramalan Cuaca',
    style: TextStyle(color: Colors.black),
  ),
  actions: <Widget>[
    Row(
      children: [
        IconButton(
          icon: Icon(
            Icons.search_outlined,
            color: Colors.black,
          ),
          onPressed: () {
            // Tindakan yang ingin Anda eksekusi ketika ikon ditekan
          },
        ),
        SizedBox(width: 10.0), // Menambahkan jarak horizontal
        IconButton(
          icon: Icon(
            Icons.mail_lock_outlined,
            color: Colors.black,
          ),
          onPressed: () {
            // Tindakan yang ingin Anda eksekusi ketika ikon ditekan
          },
        ),
        SizedBox(width: 10.0),
      ],
    ),
  ],
)
,
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Cari Cuaca',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Cari Cuaca'),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Ramalan Cuaca Hari Ini',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
