import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class Mapbox extends StatelessWidget {
  const Mapbox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          MapboxMap(
            accessToken:
                'pk.eyJ1IjoiZmF0dXJ6eiIsImEiOiJjbHA5emdrM3owMjRtMnFreDc3a2RqZnQzIn0.4qwuj-Qn_19maC2HWrGN4A',
            initialCameraPosition: const CameraPosition(
              target: LatLng(
                  0.0, 0.0), // Ganti dengan koordinat awal yang diinginkan
              zoom: 14.0,
            ),
            styleString: MapboxStyles
                .MAPBOX_STREETS, // Atau style peta lain yang Anda inginkan
            // Tambahkan properti lainnya sesuai kebutuhan
          ),
          // ... Widget lainnya (misal FutureBuilder, Positioned, dll.)
        ],
      ),
    );
  }
}
