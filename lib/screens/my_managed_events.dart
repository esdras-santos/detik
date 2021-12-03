import 'package:detik/screens/managed_settings.dart';
import 'package:detik/utils/events.dart';
import 'package:detik/utils/money_format.dart';
import 'package:flutter/material.dart';


class MyManagedEvents extends StatefulWidget {
  ManageEvent? event;
  String? tag;
  ClientsList cl = ClientsList();

  MyManagedEvents({Key?key, this.event, this.tag}):super(key:key);
  @override
  State<StatefulWidget> createState() {
    return _MyManagedEventsState();
  }
}

class _MyManagedEventsState extends State<MyManagedEvents> {
  @override
  Widget build(BuildContext context) {
    
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[600],
        title: Text(widget.event!.name),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(
              icon: Icon(
                Icons.settings,
                size: 30.0,
                color: Colors.white,
              ),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ManagedSetting()),
              ),
            ),
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          //essa informação deve ser atualizada de forma dinamica ultizando dados do backend
          SizedBox(height: 10),
          Card(
            elevation: 6.0,
            child: Container(
              width: double.infinity,
              height: 50.0,
              child: Column(
                children: <Widget>[
                  Text(
                    "Solded amount: ",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    widget.event!.collectedAmount.toString(),
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Card(
            elevation: 6.0,
            child: Container(
              width: double.infinity,
              height: 50.0,
              child: Column(
                children: <Widget>[
                  Text(
                    "Your ranking: ",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    "${widget.cl.getRank(widget.event!)}",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          //essa informação deve ser atualizada de forma dinamica ultizando dados do backend
          Card(
            elevation: 6.0,
            child: Container(
              width: double.infinity,
              height: 50.0,
              child: Column(
                children: <Widget>[
                  Text(
                    "Likes: ",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    "${widget.event!.numberOfLikes}",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          //essa informação deve ser atualizada de forma dinamica ultizando dados do backend
          Card(
            elevation: 6.0,
            child: Container(
              width: double.infinity,
              height: 50.0,
              child: Column(
                children: <Widget>[
                  Text(
                    "Ticket price: ",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    MoneyFormat("${widget.event!.valuePerTicket}").formatToString(),
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          //essa informação deve ser atualizada de forma dinamica ultizando dados do backend
          Card(
            elevation: 6.0,
            child: Container(
              width: double.infinity,
              height: 50.0,
              child: Column(
                children: <Widget>[
                  Text(
                    "Tickets sold: ",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    "${widget.event!.ticketSolds}",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          //essa informação deve ser atualizada de forma dinamica ultizando dados do backend
          
          //essa informação deve ser atualizada de forma dinamica ultizando dados do backend
          Card(
            elevation: 6.0,
            child: Container(
              width: double.infinity,
              height: 50.0,
              child: Column(
                children: <Widget>[
                  Text(
                    "Ingressos Disponíveis: ",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    "${widget.event!.totIngre - widget.event!.ticketSolds}",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),

          //essa informação deve ser atualizada de forma dinamica ultizando dados do backend
        ],
      ),
    );
  }
}