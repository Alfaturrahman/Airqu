import 'package:airqu/view/detail_info.dart';
import 'package:airqu/widgets/mapbox.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:airqu/controller/aqi_service.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  String _searchQuery = '';
  Future<Map<String, dynamic>>? aqiData;
  @override
  void initState() {
    super.initState();
    aqiData = fetchAQIData('a58f6d7e00780076b434eca9af9ae43f95b71912');
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          const Mapbox(),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(16.0),
            // decoration: const BoxDecoration(
            //   image: DecorationImage(
            //     image: AssetImage('assets/map.jpg'),
            //     fit: BoxFit.cover,
            //   ),
            // ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 250,
                child: Stack(
                  children: [
                    Positioned(
                      child: FutureBuilder<Map<String, dynamic>>(
                        future: aqiData,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text('Error: ${snapshot.error}'));
                          } else {
                            var city = snapshot.data!['data']['city']['name'];
                            var aqiValue = snapshot.data!['data']['aqi'] is int
                                ? snapshot.data!['data']['aqi']
                                : int.tryParse(snapshot.data!['data']['aqi']
                                        .toString()) ??
                                    0;
                            String aqiStatus;
                            Color statusColor;
                            if (aqiValue <= 50) {
                              aqiStatus = "BAIK";
                              statusColor = Colors.green;
                            } else if (aqiValue <= 100) {
                              aqiStatus = "SEDANG";
                              statusColor = Colors.yellow;
                            } else if (aqiValue <= 150) {
                              aqiStatus = "TIDAK SEHAT";
                              statusColor = Colors.orange;
                            } else {
                              aqiStatus = "SANGAT TIDAK SEHAT";
                              statusColor = Colors.red;
                            }
                            return SizedBox(
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
                                        borderRadius:
                                            BorderRadius.circular(16.0),
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
                                      elevation: 10.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      color: Colors.grey[200],
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const DetailInfo()),
                                          );
                                        },
                                        child: Container(
                                          width: screenWidth * 0.8,
                                          height: 200.0,
                                          padding: const EdgeInsets.all(16.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  const Icon(
                                                      Icons.maps_home_work),
                                                  const SizedBox(
                                                    width: 8,
                                                  ),
                                                  Text(city),
                                                ],
                                              ),
                                              const SizedBox(height: 5.0),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text(
                                                            aqiStatus,
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 25.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color: Colors.red,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                              'Untuk Group Sensitif'),
                                                          Text('516 Mengikuti'),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          showDialog(
                                                            context: context,
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return AlertDialog(
                                                                title:
                                                                    const Text(
                                                                  'Tentang AQI',
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                content:
                                                                    SizedBox(
                                                                  width:
                                                                      screenWidth *
                                                                          0.5,
                                                                  child:
                                                                      ListView(
                                                                    shrinkWrap:
                                                                        true,
                                                                    children: [
                                                                      const Padding(
                                                                        padding:
                                                                            EdgeInsets.all(16.0),
                                                                        child:
                                                                            Text(
                                                                          'Indeks Kualitas Udara (Air Quality Index atau AQI) adalah sebuah indeks yang menunjukkan indikasi polusi udara di lokasi tertentu. AQI adalah metode pengukuran global yang dimulai dari titik 0 di ujung paling bawah dan dapat melebihi 300 di ujung paling atas. Semakin tinggi nilai AQI, semakin tinggi tingkat polusi udara dan semakin tinggi risiko udara terhadap kesehatan kita.',
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                14.0,
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        width:
                                                                            200.0,
                                                                        height:
                                                                            220.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Colors.white,
                                                                          borderRadius:
                                                                              BorderRadius.circular(16.0),
                                                                        ),
                                                                        child: Image
                                                                            .asset(
                                                                          'assets/Indikator.png',
                                                                          width:
                                                                              double.infinity,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                actions: <Widget>[
                                                                  TextButton(
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop();
                                                                    },
                                                                    child: const Text(
                                                                        'Tutup'),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          );
                                                        },
                                                        child:
                                                            CircularPercentIndicator(
                                                          percent: 0.5,
                                                          radius: 40,
                                                          lineWidth: 15,
                                                          animation: true,
                                                          progressColor:
                                                              const Color
                                                                  .fromARGB(255,
                                                                  32, 146, 233),
                                                          backgroundColor:
                                                              const Color
                                                                  .fromARGB(255,
                                                                  193, 55, 45),
                                                          center: Text(
                                                            aqiValue.toString(),
                                                            style:
                                                                const TextStyle(
                                                              fontFamily:
                                                                  'Outfit',
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          width: 10.0),
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
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  FittedBox(
                                                    fit: BoxFit.scaleDown,
                                                    child: Text(
                                                      'Klik bel untuk mendapatkan notifikasi!',
                                                      style: TextStyle(
                                                        fontSize: 14.0,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  Icon(Icons.notification_add),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          }
                        },
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
                          labelText: 'Cari Lokasi',
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
