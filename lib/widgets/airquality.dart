import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class AirQualityInfo extends StatelessWidget {
  final String city;
  final String aqiStatus;
  final Color statusColor;
  final String aqiWarn;
  final String temperatureValue;
  final int aqiValue;
  final String formattedLastUpdatedTime;
  final double screenWidth;

  const AirQualityInfo({
    super.key,
    required this.city,
    required this.aqiStatus,
    required this.statusColor,
    required this.aqiWarn,
    required this.temperatureValue,
    required this.aqiValue,
    required this.formattedLastUpdatedTime,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Stack(
        children: [
          Positioned(
            top: -5,
            left: 20,
            child: Card(
              color: statusColor,
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Container(
                width: screenWidth * 0.8,
                height: 100.0,
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Terakhir diperbarui : $formattedLastUpdatedTime', // Tambahkan informasi waktu terakhir diperbarui
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  ),
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
                    Row(
                      children: [
                        const Icon(Icons.maps_home_work),
                        const SizedBox(width: 8),
                        Text(city),
                      ],
                    ),
                    const SizedBox(height: 5.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  aqiStatus,
                                  style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.w700,
                                    color: statusColor,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(aqiWarn),
                                Text('suhu : $temperatureValue °C'),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                // Tampilkan dialog atau aksi yang diinginkan
                              },
                              child: CircularPercentIndicator(
                                percent: 0.5,
                                radius: 40,
                                lineWidth: 15,
                                animation: true,
                                progressColor: statusColor,
                                center: Text(
                                  aqiValue.toString(),
                                  style: const TextStyle(
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
                    const SizedBox(height: 5.0),
                    const Divider(
                      color: Colors.black,
                      height: 30.0,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          )
        ],
      ),
    );
  }
}
