import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Peta',
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
                onPressed: () {},
              ),
              const SizedBox(width: 10.0),
              IconButton(
                icon: const Icon(
                  Icons.mail_lock_outlined,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
              const SizedBox(width: 10.0),
            ],
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                    ),
                    child: SizedBox(
                      height: 250,
                      child: Stack(
                        children: [
                          Positioned(
                            top: -5,
                            left: 20,
                            child: Card(
                              color: Colors.red[600],
                              elevation: 4.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Container(
                                width: screenWidth * 0.8,
                                height: 100.0,
                                padding: const EdgeInsets.all(16.0),
                                child: const Text(
                                  'Terakhir Diperbaharui 13.15, 18 Okt 2023',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 35,
                            left: 20,
                            child: Card(
                              elevation: 5.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              color: Colors.grey[200],
                              child: Container(
                                width: screenWidth * 0.8,
                                height: 200.0,
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Row(
                                      children: [
                                        Icon(Icons.maps_home_work),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text('Batam'),
                                      ],
                                    ),
                                    const SizedBox(height: 5.0),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween, // Mengatur elemen agar sejajar
                                      children: [
                                        const Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start, // Agar elemen-elemen dalam kolom kiri sejajar di sebelah kiri
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  'TIDAK SEHAT',
                                                  style: TextStyle(
                                                    fontSize: 25.0,
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .start, // Agar elemen-elemen dalam kolom kiri sejajar di sebelah kiri
                                              children: [
                                                Text('Untuk Group Sensitif'),
                                                Text('516 Mengikuti'),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .center, // Agar elemen-elemen dalam row kanan sejajar di tengah
                                          children: [
                                            CircularPercentIndicator(
                                              percent: 0.5,
                                              radius: 40,
                                              lineWidth: 15,
                                              animation: true,
                                              progressColor:
                                                  const Color.fromARGB(
                                                      255, 32, 146, 233),
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                      255, 193, 55, 45),
                                              center: const Text(
                                                '20%',
                                                style: TextStyle(
                                                  fontFamily: 'Outfit',
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 10.0),
                                            CircularPercentIndicator(
                                              percent: 0.5,
                                              radius: 40,
                                              lineWidth: 15,
                                              animation: true,
                                              progressColor:
                                                  const Color.fromARGB(
                                                      255, 32, 146, 233),
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                      255, 193, 55, 45),
                                              center: const Text(
                                                '20%',
                                                style: TextStyle(
                                                  fontFamily: 'Outfit',
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5.0,
                                    ),
                                    const Divider(
                                      color: Colors.black,
                                      height: 30.0,
                                    ),
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                            'Udara tidak baik gunakan masker jika keluar'),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 16.0,
            left: 16.0,
            right: 16.0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: TextField(
                        decoration: const InputDecoration(
                          labelText: 'Cari Cuaca',
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        onChanged: (value) {
                          setState(() {
                            _searchQuery = value;
                          });
                        },
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 12.0,
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 0, 204, 255),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
