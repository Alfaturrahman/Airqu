import 'package:airqu/view/home.dart';
import 'package:airqu/view/map.dart';
import 'package:airqu/view/setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class MyHomePage extends StatefulWidget {
  final Map<String, dynamic> aqiData;

  const MyHomePage({super.key, required this.aqiData});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  late String mapboxAccessToken; // Variable to store Mapbox API token
  late List<Widget> _widgetOptions; // Declare this here

  @override
  void initState() {
    super.initState();
    loadMapboxAccessToken(); // Load Mapbox access token

    // Initialize widget options with the AQI data
    _widgetOptions = <Widget>[
      HomePage(aqiData: widget.aqiData), // Pass the AQI data to the HomePage
      const MapPage(),
      SettingsPage(),
    ];
  }

  Future<void> loadMapboxAccessToken() async {
    final String token =
        await rootBundle.loadString('assets/mapbox_access_token.txt');
    setState(() {
      mapboxAccessToken = token;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
            icon: Icon(Icons.home),
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
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
