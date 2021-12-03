import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

class Setting extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SettingState();
  }
}

class _SettingState extends State<Setting> {
  //esses dois vvalores tem que ser salvos no db
  bool _isSwitched1 = false;
  bool _isSwitched2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple[600],
          title: Text("Settings"),
        ),
        body: ListView(
          children: <Widget>[
            Card(
              child: ListTile(
                leading: Icon(Icons.notifications),
                title: Text(
                  "Notifications",
                  style: TextStyle(fontSize: 20),
                ),
                trailing: Container(
                  height: 30.0,
                  width: 65.0,
                  child: Switch(
                    onChanged: (val) => setState(() => _isSwitched1 = val),
                    value: _isSwitched1,
                    activeColor: Colors.purple[600],
                  ),
                ),
                onTap: () => {},
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.panorama_fish_eye),
                title: Text(
                  "Visibility at the list",
                  style: TextStyle(fontSize: 20),
                ),
                trailing: Container(
                  height: 30.0,
                  width: 65.0,
                  child: Switch(
                    onChanged: (val) => setState(() => _isSwitched2 = val),
                    value: _isSwitched2,
                    activeColor: Colors.purple[600],
                  ),
                ),
                onTap: () => {},
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.change_history),
                title: Text(
                  "Chage personal data",
                  style: TextStyle(fontSize: 20),
                ),
                
                onTap: () => {},
              ),
            )
          ],
        ));
    
  }
}