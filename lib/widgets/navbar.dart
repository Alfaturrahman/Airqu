import 'package:airqu/view/home.dart';
import 'package:airqu/view/map.dart';
import 'package:airqu/view/setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const MapPage(),
    SettingsPage(),
  ];

  late String mapboxAccessToken; // Variabel untuk menyimpan token Mapbox API

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Fungsi untuk memuat token Mapbox API dari file
  Future<void> loadMapboxAccessToken() async {
    final String token =
        await rootBundle.loadString('assets/mapbox_access_token.txt');
    setState(() {
      mapboxAccessToken = token;
    });
  }

  @override
  void initState() {
    super.initState();
    loadMapboxAccessToken(); // Memuat token saat halaman diinisialisasi
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            label: 'Peta',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setelan',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 44, 175, 241),
        unselectedItemColor:
            Colors.grey, // Atur warna ikon ketika tidak dipilih.
        onTap: _onItemTapped,
      ),
    );
  }
}
