import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
           backgroundColor: Colors.red,
             title: const Text("Flutter Demo Home Page"),
      centerTitle: true,
      leadingWidth: 100,
           flexibleSpace: Container(color: Colors.blue,),
           bottomOpacity: .5,
      elevation: 2,
           automaticallyImplyLeading: false,
           shadowColor: Colors.black87,
           foregroundColor: Colors.white60,
           toolbarHeight:10,
           primary: true,
      
    );
  }
}