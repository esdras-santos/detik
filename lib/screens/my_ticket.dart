import 'package:detik/screens/buyed_ticket.dart';
import 'package:detik/screens/event.dart';
import 'package:detik/utils/events.dart';
import 'package:flutter/material.dart';

class Ticket extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _TicketState();
  }
}
class _TicketState extends State<Ticket>{
  
  Widget ticketCards(EventDesc event,BuildContext context){
    return Card(
        elevation: 5.0,
        child: InkWell(
          //Posteriormente isso deve ser alterado para uma tela onde o
          //ingresso deve ser mostrado mesmo offline
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => BuyedTicket(event, event.url+"ticket"), 
            ),
          ),
          child: Hero(
            tag: event.url+"ticket",
            child: Container(
              width: double.infinity,
              height: 100.0,
              child: Row(
                children: <Widget>[
                  Container(
                    width: 130.0,
                    height: double.infinity,
                    child: Image(
                      image: AssetImage(event.url),
                    ),
                  ),
                  SizedBox(width: 19.0,),
                  Material(child: Text(
                    event.name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 20.0),
                    )
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }

  List<Widget> ticketList(BuildContext context){
    List<Widget> tikList = [];
    for(int i=0;i<ClientsList.ticketList.length;i++){
      tikList.add(ticketCards(ClientsList.ticketList[i],context));
    }
    return tikList;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.purple[600],
          title: Text("My tickets"),
          actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            onPressed: () => {},
            child: Text("HELP",style: TextStyle(fontWeight: FontWeight.bold),),
          ),
        ],
        ),
      body: ListView(
        children: ticketList(context),
      ),
    );
  }

}