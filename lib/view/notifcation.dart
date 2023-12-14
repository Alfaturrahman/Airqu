import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  NotifPage createState() => NotifPage();
}

class NotifPage extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text('Notifikasi'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Menggunakan Navigator.pop untuk kembali
          },
        ),
      ),
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: <Widget>[
              ButtonsTabBar(
                contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                backgroundColor: Colors.grey,
                unselectedBackgroundColor: Colors.grey[300],
                unselectedLabelStyle: const TextStyle(color: Colors.black),
                labelStyle: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
                tabs: const [
                  Tab(
                    text: "Untuk Kamu",
                  ),
                  Tab(
                    text: "Peringatan",
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: <Widget>[
                    // Tab 1
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10.0),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 241, 239, 227),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                            width: double.infinity,
                            padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 217, 217, 217),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              title: const Text('Peningkatan Polusi Udara'),
                              subtitle: const Text(
                                  'Batu aji: Lokasi yang kamu tambahkan berada pada kualitas udara sedang'),
                              leading: const Icon(Icons.notifications),
                              trailing: IconButton(
                                icon: const Icon(Icons.arrow_circle_right),
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const NotificationPage(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          const Divider(
                            thickness: 1,
                            color: Colors.grey,
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 217, 217, 217),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              title: const Text('Peningkatan Polusi Udara'),
                              subtitle: const Text(
                                  'Batu aji: Lokasi yang kamu tambahkan berada pada kualitas udara sedang'),
                              leading: const Icon(Icons.notifications),
                              trailing: IconButton(
                                icon: const Icon(Icons.arrow_forward_ios),
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const NotificationPage(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Tab 2
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10.0),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 241, 239, 227),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                            width: double.infinity,
                            padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 217, 217, 217),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              title: const Text('Peningkatan Polusi Udara'),
                              subtitle: const Text(
                                  'Batu aji: Lokasi yang kamu tambahkan berada pada kualitas udara sedang'),
                              leading: const Icon(Icons.notifications),
                              trailing: IconButton(
                                icon: const Icon(Icons.arrow_circle_right),
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const NotificationPage(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          const Divider(
                            thickness: 1,
                            color: Colors.grey,
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 217, 217, 217),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              title: const Text('Peningkatan Polusi Udara'),
                              subtitle: const Text(
                                  'Batu aji: Lokasi yang kamu tambahkan berada pada kualitas udara sedang'),
                              leading: const Icon(Icons.notifications),
                              trailing: IconButton(
                                icon: const Icon(Icons.arrow_forward_ios),
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const NotificationPage(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
