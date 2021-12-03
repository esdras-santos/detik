//import 'package:detik/screens/event.dart';
import 'package:detik/screens/home.dart';
//import 'package:detik/screens/login.dart';
import 'package:detik/screens/menu.dart';
//import 'package:detik/screens/setting.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      
      debugShowCheckedModeBanner: false,
      title: 'DeTik',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SimpleHiddenDrawer(
        menu: Menu(),
        screenSelectedBuilder: (position, controller) {
          Widget screenCurrent;
          screenCurrent = Home(controller);
          return screenCurrent;
        },
      ),
    );
  }
}
