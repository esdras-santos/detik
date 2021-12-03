import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ManagedSetting extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ManagedSettingState();
  }
}

class _ManagedSettingState extends State<ManagedSetting> {

  @override
  Widget build(BuildContext context) {
     return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple[600],
          title: Text("Manager settings"),
        ),
        body: ListView(
          children: <Widget>[
            Card(
              child: ListTile(
                leading: Icon(Icons.adjust),
                title: Text(
                  "Edit Tickets Available",
                  style: TextStyle(fontSize: 20),
                ),
                
                onTap: () => {},
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.add
                ),
                title: Text(
                  "Add Manager",
                  style: TextStyle(fontSize: 20),
                ),
                
                onTap: () => {},
              ),
            ),
            
            Card(
              child: ListTile(
                leading: Icon(Icons.cancel),
                title: Text(
                  "Cancel event",
                  style: TextStyle(fontSize: 20),
                ),
                
                onTap: () => {},
              ),
            )

          ],
        )); 
    
    //         Container(
    //           height: 50.0,
    //           padding: EdgeInsets.only(left: 20.0, top: 20.0),
    //           child: InkWell(
    //             child: Text(
    //               "Cancelar evento",
    //               style: TextStyle(fontSize: 20.0),
    //             ),
    //             onTap: () {},
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}