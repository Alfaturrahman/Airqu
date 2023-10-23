import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setelan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Lokasi',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: Text('Lokasi'),
              subtitle: Text('Ubah lokasi saat ini'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            SizedBox(height: 16),
            Text(
              'Bahasa',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: Text('Ganti Bahasa'),
              subtitle: Text('Ubah bahasa aplikasi'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return BahasaPage();
                }));
              },
            ),
            SizedBox(height: 16),
            Text(
              'Tentang Aplikasi',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: Text('Tentang'),
              subtitle: Text('Informasi tentang aplikasi'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AboutPage();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tentang Aplikasi'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('AIR-QU',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Versi: 1.0.0'),
            Text('Pengembang: -'),
            Text('Email: developer@gmail.com'),
            SizedBox(height: 16),
            Text('Tentang Aplikasi',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('.............................'),
          ],
        ),
      ),
    );
  }
}

class BahasaPage extends StatefulWidget {
  @override
  _BahasaPageState createState() => _BahasaPageState();
}
class _BahasaPageState extends State<BahasaPage> {
   int selectedLanguage = 0;

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ganti Bahasa'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Bahasa Indonesia'),
            leading: selectedLanguage == 0
                ? Icon(Icons.check, color: Colors.green)
                : SizedBox(width: 24,), // Tampilkan ceklis jika dipilih
            onTap: () {
              setState(() {
                selectedLanguage = 0;
              });
            },
          ),
          ListTile(
            title: Text('Bahasa Inggris'),
            leading: selectedLanguage == 1
                ? Icon(Icons.check, color: Colors.green)
                : SizedBox(width: 24), // Tampilkan ceklis jika dipilih
            onTap: () {
              setState(() {
                selectedLanguage = 1;
              });
            },
          ),
        ],
      ),
    );
  }
}

