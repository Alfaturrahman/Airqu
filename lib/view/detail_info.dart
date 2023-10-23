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
              // Tindakan yang ingin Anda eksekusi ketika ikon ditekan
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
              child: SizedBox(
                width: screenWidth * 0.85,
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.maps_home_work),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'Batam',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Text('<kurang lebih 100km dari anda',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Icon(Icons.download),
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
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'TIDAK SEHAT',
                                  style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                  ),
                                ),
                                Text(
                                  '11.56, 22 Okt 2023',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                                width: screenWidth *
                                    0.15), // Atur jarak sesuai kebutuhan
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
                                                fontWeight: FontWeight.bold),
                                          ),
                                          content: SizedBox(
                                            width: screenWidth * 0.5,
                                            child: ListView(
                                              shrinkWrap: true,
                                              children: [
                                                const Padding(
                                                  padding: EdgeInsets.all(16.0),
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
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                  ),
                                                  child: Image.asset(
                                                    'assets/Indikator.png',
                                                    width: double.infinity,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
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
                                    progressColor:
                                        const Color.fromARGB(255, 32, 146, 233),
                                    backgroundColor:
                                        const Color.fromARGB(255, 193, 55, 45),
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
                        const Divider(
                          color: Colors.grey,
                          height: 30.0,
                        ),
                        const Row(
                          children: [
                            Icon(Icons.error),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Udara tidak Aman untuk dihirup',
                                style: TextStyle(fontWeight: FontWeight.bold)),
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                fontSize: 18, fontWeight: FontWeight.bold),
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
                                                fontWeight: FontWeight.bold))),
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
                                                fontWeight: FontWeight.bold))),
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
                                  ), // Gantilah YourChildWidget() dengan widget yang ingin Anda tampilkan di dalam container.
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
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
