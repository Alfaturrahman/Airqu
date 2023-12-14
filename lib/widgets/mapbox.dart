import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:location/location.dart';

class Mapbox extends StatefulWidget {
  const Mapbox({Key? key}) : super(key: key);

  @override
  _MapboxState createState() => _MapboxState();
}

class _MapboxState extends State<Mapbox> {
  late MapboxMapController mapController;
  Location location = Location();
  bool _isLocationInitialized = false;

  @override
  void initState() {
    super.initState();
    _initLocation(); // Inisialisasi lokasi saat halaman pertama kali dimuat
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Pembaruan lokasi jika pengguna kembali ke halaman map setelah izin diberikan sebelumnya
    _initLocation();
  }

  void _onMapCreated(MapboxMapController controller) {
    mapController = controller;
  }

  Future<void> _initLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    try {
      // Check if service is enabled
      serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled) {
          return;
        }
      }

      // Check and request permission
      permissionGranted = await location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await location.requestPermission();
        if (permissionGranted != PermissionStatus.granted) {
          return;
        }
      }

      // If permissions are granted, proceed to get the location
      location.onLocationChanged.listen((LocationData currentLocation) {
        if (!_isLocationInitialized) {
          setState(() {
            _isLocationInitialized = true;
            mapController.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                  target: LatLng(
                    currentLocation.latitude ?? 0.0,
                    currentLocation.longitude ?? 0.0,
                  ),
                  zoom: 14.0,
                ),
              ),
            );
            // Tambahkan marker pada lokasi saat ini
            mapController.addSymbol(SymbolOptions(
              geometry: LatLng(
                currentLocation.latitude ?? 0.0,
                currentLocation.longitude ?? 0.0,
              ),
              iconImage:
                  'assets/logo/logo-splash.png', // Ganti dengan path gambar marker Anda
              textOffset: const Offset(0, 2),
            ));
          });
        }
      });
    } catch (e) {
      print('Error initializing location: $e');
      // Tampilkan pesan kesalahan kepada pengguna atau lakukan penanganan lain sesuai kebutuhan
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MapboxMap(
            accessToken:
                'sk.eyJ1IjoiZmF0dXJ6eiIsImEiOiJjbHBqZ2NwZjgwY2tqMmltZ2c2OHk5d2hzIn0.cEILTqCc5Kdq8iDOkRYYZg',
            onMapCreated: _onMapCreated,
            initialCameraPosition: const CameraPosition(
              target: LatLng(0.0, 0.0), // Temporary placeholder position
              zoom: 14.0,
            ),
            styleString: MapboxStyles.MAPBOX_STREETS,
            myLocationEnabled: true, // Show user location
          ),
          if (!_isLocationInitialized)
            const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}

void main() => runApp(const MaterialApp(
      home: Mapbox(),
    ));
