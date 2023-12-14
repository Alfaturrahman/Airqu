import 'package:airqu/controller/aqi_service.dart';
import 'package:airqu/view/aqiForecast_screen.dart';
import 'package:airqu/view/weather.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

void main() {
  runApp(const MaterialApp(
    home: DetailInfo(),
  ));
}

class DetailInfo extends StatefulWidget {
  const DetailInfo({Key? key}) : super(key: key);

  @override
  _DetailInfoState createState() => _DetailInfoState();
}

class _DetailInfoState extends State<DetailInfo> {
  int selectedCard = -1;
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
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.lightBlue,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.favorite,
              color: Colors.black,
            ),
            onPressed: () {
              // Tindakan yang ingin Anda eksekusi ketika ikon ditekan
            },
          ),
          const SizedBox(width: 10.0), // Menambahkan jarak horizontal
          IconButton(
            icon: const Icon(
              Icons.notifications,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AQI()),
              );
            },
          ),
          const SizedBox(width: 10.0),
        ],
      ),
      backgroundColor: Colors.lightBlue,
      body: SingleChildScrollView(
        child: Center(
          child: Card(
            color: Colors.white,
            elevation: 10.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FutureBuilder<Map<String, dynamic>>(
                future: aqiData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    var humidity = snapshot.data!['data']['iaqi']['h'];
                    var humidityValue =
                        humidity != null ? humidity['v'] : 'N/A';

                    var pm1 = snapshot.data!['data']['iaqi']['pm1'];
                    var pm1Value = pm1 != null ? pm1['v'] : 'N/A';

                    var pm10 = snapshot.data!['data']['iaqi']['pm10'];
                    var pm10Value = pm10 != null ? pm10['v'] : 'N/A';

// Menggunakan nilai-nilai ini untuk menampilkan data di UI atau melakukan pemrosesan lebih lanjut

                    var pm25Data = snapshot.data!['data']['iaqi']['pm25'];
                    var pm25Value = pm25Data != null ? pm25Data['v'] : 'N/A';
                    var city = snapshot.data!['data']['city']['name'];
                    var aqiValue = snapshot.data!['data']['aqi'] is int
                        ? snapshot.data!['data']['aqi']
                        : int.tryParse(
                                snapshot.data!['data']['aqi'].toString()) ??
                            0;
                    String aqiStatus;
                    String aqiWarn;
                    Color statusColor;
                    if (aqiValue <= 50) {
                      aqiStatus = "BAIK";
                      statusColor = Colors.green;
                      aqiWarn = "Kualitas udara baik";
                    } else if (aqiValue <= 100) {
                      aqiStatus = "SEDANG";
                      statusColor = Colors.yellow;
                      aqiWarn = "Kualitas udara cukup baik";
                    } else if (aqiValue <= 150) {
                      aqiStatus = "TIDAK SEHAT";
                      statusColor = Colors.orange;
                      aqiWarn = "Kualitas udara tidak sehat";
                    } else {
                      aqiStatus = "SANGAT TIDAK SEHAT";
                      statusColor = Colors.red;
                      aqiWarn = "Kualitas udara sangat tidak sehat";
                    }
                    var lastUpdatedTimeString =
                        snapshot.data!['data']['time']['s'];
                    var lastUpdatedTime = DateTime.parse(lastUpdatedTimeString);
                    var formattedLastUpdatedTime =
                        '${lastUpdatedTime.day}/${lastUpdatedTime.month}/${lastUpdatedTime.year} ${lastUpdatedTime.hour}:${lastUpdatedTime.minute}:${lastUpdatedTime.second}';
                    var temperature = snapshot.data!['data']['iaqi']['t'];
                    var temperatureValue =
                        temperature != null ? temperature['v'] : 'N/A';
                    var wind = snapshot.data!['data']['iaqi']['w'];
                    var windSpeed = wind != null ? wind['v'] : 'N/A';

// Gunakan nilai windSpeed untuk menampilkan kecepatan angin di UI atau lakukan pemrosesan tambahan jika diperlukan

                    return SizedBox(
                      width: screenWidth * 0.85,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(Icons.maps_home_work),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        city,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  const Text('Lokasi Terdekat Anda',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              const Icon(Icons.download),
                            ],
                          ),
                          const Divider(
                            color: Colors.grey,
                            height: 30.0,
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        aqiStatus,
                                        style: TextStyle(
                                          fontSize: 25.0,
                                          fontWeight: FontWeight.bold,
                                          color: statusColor,
                                        ),
                                      ),
                                      Text(
                                        formattedLastUpdatedTime,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                      width: screenWidth *
                                          0.10), // Atur jarak sesuai kebutuhan
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .center, // Agar elemen-elemen dalam row kanan sejajar di tengah
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
                                        child: Row(
                                          children: [
                                            CircularPercentIndicator(
                                              percent: aqiValue / 300,
                                              radius: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.09,
                                              lineWidth: 10,
                                              animation: true,
                                              progressColor: statusColor,
                                              center: Text(
                                                aqiValue.toString(),
                                                style: const TextStyle(
                                                  fontFamily: 'Outfit',
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            CircularPercentIndicator(
                                              percent: aqiValue / 250.4,
                                              radius: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.09,
                                              lineWidth: 10,
                                              animation: true,
                                              progressColor: statusColor,
                                              center: Text(
                                                pm25Value.toString(),
                                                style: const TextStyle(
                                                  fontFamily: 'Outfit',
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      // const SizedBox(width: 10.0),
                                    ],
                                  ),
                                ],
                              ),
                              const Divider(
                                color: Colors.grey,
                                height: 30.0,
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.error),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(aqiWarn,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              const Divider(
                                color: Colors.grey,
                                height: 30.0,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text('Kcptn Angin'),
                                          Text(
                                            windSpeed.toString(),
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Text('m/s'),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text('Suhu'),
                                          Text(
                                            temperatureValue.toString(),
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Text('°C'),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text('Kelembapan'),
                                          Text(
                                            humidityValue.toString(),
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Text('%'),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(
                                color: Colors.grey,
                                height: 30.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Rekomendasi',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      buildCard(Icons.home, 0),
                                      buildCard(Icons.work, 1),
                                      buildCard(Icons.shopping_cart, 2),
                                      buildCard(Icons.school, 3),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              if (selectedCard >= 0)
                                Text(
                                  getRecommendation(selectedCard),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              const Divider(
                                color: Colors.grey,
                                height: 30.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Prediksi AQI',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey),
                                  ),
                                  const SizedBox(
                                      height: 10), // Tambahkan jarak vertikal
                                  const Row(
                                    children: [
                                      Card(
                                        elevation: 5.0,
                                        child: SizedBox(
                                          width: 100,
                                          height: 30,
                                          child: Center(
                                              child: Text('Hari ini',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold))),
                                        ),
                                      ),
                                      Card(
                                        elevation: 5.0,
                                        child: SizedBox(
                                          width: 100,
                                          height: 30,
                                          child: Center(
                                              child: Text('Kemarin',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold))),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black, // Warna garis
                                            width: 1.0, // Lebar garis
                                          ),
                                        ),
                                        child: const Column(
                                            children: []), // Gantilah YourChildWidget() dengan widget yang ingin Anda tampilkan di dalam container.
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        '24 Jam kedepan',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.grey),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        width: double.infinity,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black, // Warna garis
                                            width: 1.0, // Lebar garis
                                          ),
                                        ), // Gantilah YourChildWidget() dengan widget yang ingin Anda tampilkan di dalam container.
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCard(IconData icon, int index) {
    bool isCardSelected = selectedCard == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCard = isCardSelected ? -1 : index;
        });
      },
      child: Card(
        color: isCardSelected ? Colors.white : Colors.white,
        elevation: isCardSelected ? 5.0 : 0.0, // Add elevation when selected
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: isCardSelected ? Colors.red : Colors.transparent,
            width: 3.0,
          ),
          borderRadius: BorderRadius.circular(20.0), // Customize card size
        ),
        child: SizedBox(
          width: 50.0, // Set a specific width for the icon container
          height: 50.0, // Set a specific height for the icon container
          child: Icon(
            icon,
            size: 35.0, // Adjust the icon size
            color: isCardSelected ? Colors.red : Colors.red,
          ),
        ),
      ),
    );
  }

  String getRecommendation(int cardIndex) {
    // Gantilah ini dengan rekomendasi sesuai dengan masing-masing kartu.
    if (cardIndex == 0) {
      return 'Disarankan Untuk menggunakan masker';
    } else if (cardIndex == 1) {
      return 'Disarankan untuk tetap dirumah';
    } else if (cardIndex == 2) {
      return 'Disarankan untuk tidak berolahraga terlebih dahulu';
    } else if (cardIndex == 3) {
      return 'Disarankan menggunakan Air Purifier';
    } else {
      return '';
    }
  }
}
