import 'package:detik/utils/events.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:detik/utils/did.dart';

class BuyedTicket extends StatefulWidget {
  EventDesc? event;
  String? tag;
  BuyedTicket(EventDesc _event, String _tag) {
    event = _event;
    tag = _tag;
  }

  @override
  State<StatefulWidget> createState() {
    return _BuyedTicketState();
  }
}

class _BuyedTicketState extends State<BuyedTicket> {

  Node node = Node("Esdras","password123");
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      // resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.purple,
            automaticallyImplyLeading: false,
            pinned: false,
            floating: true,
            expandedHeight: 300.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: widget.tag!,
                child: Image(
                  height: 400.0,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  image: AssetImage(widget.event!.url),
                ),
              ),
            ),
          ),
          SliverAppBar(
            iconTheme: IconThemeData(color: Colors.purple[600]),
            backgroundColor: Colors.white,
            pinned: true,
            expandedHeight: 60.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                widget.event!.name,
                style: TextStyle(fontSize: 16, color: Colors.purple[600]),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.only(top: 50.0),
              child: Column(
                children: <Widget>[
                  QrImage(
                    //"data:" deve ser extraido do banco de dados offline e futuramente deve ser addicionado o nome
                    // do comprador do ingresso e o timestamp deve ser adicionado ao banco de dados
                    data: widget.event!.name +" "+ String.fromCharCodes(node.node.publicKey), 
                    version: QrVersions.auto,
                    size: 330.0,
                  ),
                  
                  const SizedBox(
                    height: 40.0,
                  ),
                  
                  
                   SizedBox(
                     height: 20.0,
                   )
                 ],
              ),
            ),
          )
        ],
      ),
    );
  }
}