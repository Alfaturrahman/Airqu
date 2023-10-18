import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setelan'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.language),
              title: Text('Ganti Bahasa'),
              onTap: () {
                // Tambahkan logika ketika opsi "Ganti Bahasa" diklik.
              },
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notifikasi'),
              onTap: () {
                // Tambahkan logika ketika opsi "Tentang" diklik.
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_phone),
              title: Text('Hubungi Kami'),
              onTap: () {
                // Tambahkan logika ketika opsi "Hubungi Kami" diklik.
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Tentang'),
              onTap: () {
                // Tambahkan logika ketika opsi "Tentang" diklik.
              },
            ),
          ],
        ),
      ),
    );
  }
}
