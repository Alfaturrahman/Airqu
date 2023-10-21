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
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(16.0),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://www.google.com/url?sa=i&url=https%3A%2F%2Fmediaindonesia.com%2Fhumaniora%2F604929%2Fpeta-indonesia-lengkap-dengan-gambar-dan-nama-38-provinsi&psig=AOvVaw0mYkLtUujj_AHZviq_40zD&ust=1698011458678000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCODtsOCPiIIDFQAAAAAdAAAAABAJ'),
                fit: BoxFit.cover,
              ),
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 250,
                child: Stack(
                  children: [
                    Positioned(
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
                      top: 40,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Untuk Group Sensitif'),
                                          Text('516 Mengikuti'),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: const Text(
                                                  'Tentang AQI',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                content: SizedBox(
                                                  width: screenWidth * 0.5,
                                                  child: ListView(
                                                    shrinkWrap: true,
                                                    children: [
                                                      const Padding(
                                                        padding: EdgeInsets.all(
                                                            16.0),
                                                        child: Text(
                                                          'Indeks Kualitas Udara (Air Quality Index atau AQI) adalah sebuah indeks yang menunjukkan indikasi polusi udara di lokasi tertentu. AQI adalah metode pengukuran global yang dimulai dari titik 0 di ujung paling bawah dan dapat melebihi 300 di ujung paling atas. Semakin tinggi nilai AQI, semakin tinggi tingkat polusi udara dan semakin tinggi risiko udara terhadap kesehatan kita.',
                                                          style: TextStyle(
                                                            fontSize: 14.0,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 200.0,
                                                        height: 220.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.0),
                                                        ),
                                                        child: Image.asset(
                                                          'assets/Indikator.png',
                                                          width:
                                                              double.infinity,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                actions: <Widget>[
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const Text('Tutup'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        child: CircularPercentIndicator(
                                          percent: 0.5,
                                          radius: 40,
                                          lineWidth: 15,
                                          animation: true,
                                          progressColor: const Color.fromARGB(
                                              255, 32, 146, 233),
                                          backgroundColor: const Color.fromARGB(
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
                                      ),
                                      const SizedBox(width: 10.0),
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
