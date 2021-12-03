import 'package:detik/screens/my_events.dart';
import 'package:detik/screens/setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

import 'my_ticket.dart';
import 'package:hidden_drawer_menu/simple_hidden_drawer/provider/simple_hidden_drawer_provider.dart';


class Menu extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _MenuState();
  }
}

class _MenuState extends State<Menu> {
  late SimpleHiddenDrawerController controller;

  @override
  void didChangeDependencies(){
    controller = SimpleHiddenDrawerController.of(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    return WillPopScope(
      onWillPop: () async {
        controller.setSelectedMenuPosition(0);
        return true;
      },
      child: Material(
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          color: Colors.white,
          padding: const EdgeInsets.only(
            left: 25.0,
            top: 150.0,
          ),
          child: ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 10.0, bottom: 20.0),
                child: Text(
                  "Hello Esdras",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              // ListTile(
              //     onTap: () {
              //       SimpleHiddenDrawerProvider.of(context)
              //           .setSelectedMenuPosition(0);
              //     },
              //     title: Text(
              //       "Home",
              //       style:
              //           TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              //     )),
              
              ListTile(
                  onTap: () {
                    //THIS PATH SHOULD BE FIX FOR THE RIGHT PATH
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Ticket()));
                  },
                  title: Text(
                    "My tickets",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  )),
              
              ListTile(
                  onTap: () {
                    //THIS PATH SHOULD BE FIX FOR THE RIGHT PATH
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyEvents()));
                  },
                  title: Text(
                    "Event management",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  )),
              

              ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Setting()));
                  },
                  title: Text(
                    "Settings",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

ListTile item(var controller, int position, String title) {
  return ListTile(
      onTap: () {
        controller.setSelectedMenuPosition(position);
      },
      title: Text(
        title,
        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      ));
}
