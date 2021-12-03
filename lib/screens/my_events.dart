
import 'package:detik/screens/my_managed_events.dart';
import 'package:detik/utils/events.dart';
import 'package:flutter/material.dart';

class MyEvents extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyEventsState();
  }
}

class _MyEventsState extends State<MyEvents> {
  Widget ticketCards(ManageEvent event, BuildContext context) {
    return Card(
      elevation: 5.0,
      child: InkWell(
        //Posteriormente isso deve ser alterado para uma tela onde o
        //ingresso deve ser mostrado mesmo offline
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MyManagedEvents(
              event: event,
              tag: event.imageUrl + "managed",
            ),
          ),
        ),
        child: Hero(
          tag: event.imageUrl + "managed",
          child: Container(
            width: double.infinity,
            height: 100.0,
            child: Row(
              children: <Widget>[
                Container(
                  width: 130.0,
                  height: double.infinity,
                  child: Image(
                    image: AssetImage(event.imageUrl),
                  ),
                ),
                SizedBox(
                  width: 19.0,
                ),
                Material(
                    child: Text(
                  event.name,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 20.0),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> myEventsList(BuildContext context) {
    List<Widget> tikList = [];
    for (int i = 0; i < ClientsList.eventList.length; i++) {
      tikList.add(ticketCards(ClientsList.eventList[i], context));
    }
    return tikList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[600],
        title: Text("Event Management"),
        actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            onPressed: () => {},
            child: Text("HELP",style: TextStyle(fontWeight: FontWeight.bold),),
          ),
        ],
      ),
      body: ListView(
        children: myEventsList(context),
      ),
    );
  }
}
