import 'package:detik/utils/events.dart';
import 'package:detik/utils/money_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class Event extends StatefulWidget {
  EventDesc? event;
  String? tag;
  Event({Key? key, this.event, this.tag}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _EventState();
  }
}

class _EventState extends State<Event> {
  Icon favoriteIcon = Icon(Icons.favorite_border);
  late bool liked;
  late int index;
  String data = '';

  readQrCode() async {
    String code = await FlutterBarcodeScanner.scanBarcode(
      "#FFFFFF",
      "Cancel",
      false,
      ScanMode.QR,
    );

    setState(() {
      data = code != '-1' ? code : '';

      List<String> pken = data.split(" ");
      print("pk: ${pken[0]}, event: ${pken[1]}");
    });
  }

  @override
  void initState() {
    super.initState();
    liked = ClientsList.likedList.contains(widget.event);
  }

  _pressed() {
    //isso deve ser removido no futuro
    //uso somente para testes
    List<EventDesc> newClientsList = [];
    for (index = 0; index < ClientsList.eventList.length; index++) {
      if (widget.event!.name == ClientsList.eventList[index].name) {
        break;
      }
    }
    setState(() {
      liked = !liked;
    });
    if (liked == false) {
      //Posteriormente o elemento deve ser removido na lista do backend
      ClientsList.likedList.remove(widget.event);
      if (ClientsList.eventList[index].numberOfLikes != 0 &&
          ClientsList.eventList.isNotEmpty) {
        ClientsList.eventList[index].numberOfLikes--;
      }
      newClientsList = ClientsList.likedList;
    } else if (liked == true) {
      //Posteriormente o elemento deve ser adicionado na lista do backend
      ClientsList.likedList.add(widget.event!);
      if (ClientsList.eventList.isNotEmpty) {
        ClientsList.eventList[index].addLike();
      }
      newClientsList = ClientsList.likedList;
    }
    setState(() {
      ClientsList.likedList = newClientsList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            actions: <Widget>[
              IconButton(
                iconSize: 40,
                icon: Icon(liked ? Icons.favorite : Icons.favorite_border),
                color: Colors.purple[600],
                onPressed: () {
                  _pressed();
                },
              )
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Text(
                      "ALGO: " + widget.event!.price,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(top: 50.0),
                  child: Column(
                    children: <Widget>[
                      Center(
                        child: Text(widget.event!.description),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      RaisedButton(
                        highlightElevation: 10.0,
                        elevation: 8,
                        color: Colors.purple,
                        onPressed: () {
                          ClientsList.ticketList.add(widget.event!);
                          print("Ticket Buyed");
                        },
                        textColor: Colors.white,
                        child: Text(
                          "Buy Tycket",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      RaisedButton(
                        highlightElevation: 10.0,
                        elevation: 8,
                        color: Colors.purple,
                        onPressed: () => readQrCode(),
                        textColor: Colors.white,
                        child: Text(
                          "Validate",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
