//This is the home screen of the app
//import 'package:avatar_glow/avatar_glow.dart';
//import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:detik/screens/event.dart';
//import 'package:detik/screens/search.dart';
import 'package:detik/utils/events.dart';
//import 'package:detik/utils/searchIcon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Home extends StatefulWidget {
  var controller;
  Home(this.controller);
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  final List<String> eventTitles;
  late MySearchDelegate _delegate;

  late PageController _pageController;
  late PageController _pageController1;
  var likeds;
  //int likedsLength;

  _HomeState()
      : eventTitles = List.from(Set.from(allTitle()))
          ..sort(
            (w1, w2) => w1.toLowerCase().compareTo(w2.toLowerCase()),
          ),
        super();

  @override
  void initState() {
    super.initState();
    //likedsLength = ClientsList.likedList.length;
    likeds = ClientsList.likedList;
    _delegate = MySearchDelegate(eventTitles);
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
    _pageController1 = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  int likedsLength() {
    return ClientsList.likedList.length;
  }

  //THE IMAGES HERE MUST BE TAKED FROM A BACKEND
  //WHEN THE BACKEND IS WORKING FINE YOU MUST PASS THE EVENTS LIST AS AN ARGUMENT OF THIS FUNCTION
  _eventSelector(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget? widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page! - index;
          value = (1 - (value.abs() * 0.3) + 0.01).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 270.0,
            width: Curves.easeInOut.transform(value) * 400.0,
            child: widget,
          ),
        );
      },
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => Event(
              event: events[index],
              tag: events[index].url,
            ),
          ),
        ),
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.purple[600]!,
                      offset: Offset(0.0, 4.0),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: Center(
                  child: Hero(
                    tag: events[index].url,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image(
                        image: AssetImage(events[index].url),
                        height: 280.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 30.0,
              bottom: 20.0,
              child: Container(
                width: 250.0,
                child: Text(
                  events[index].name.toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _likedSelector(int index) {
    return AnimatedBuilder(
      animation: _pageController1,
      builder: (BuildContext context, Widget? widget) {
        double value = 1;
        if (_pageController1.position.haveDimensions) {
          value = _pageController1.page! - index;
          value = (1 - (value.abs() * 0.3) + 0.01).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 270.0,
            width: Curves.easeInOut.transform(value) * 400.0,
            child: widget,
          ),
        );
      },
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => Event(
              event: likeds[index],
              tag: likeds[index].url + "gostei",
            ),
          ),
        ),
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 0.0, vertical: 20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.purple[600]!,
                      offset: Offset(0.0, 4.0),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: Center(
                  child: Hero(
                    tag: likeds[index].url + "gostei",
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image(
                        image: AssetImage(likeds[index].url),
                        height: 220.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 30.0,
              bottom: 40.0,
              child: Container(
                width: 250.0,
                child: Text(
                  events[index].name.toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
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
    return Material(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          //this code below makes the logo
//        Stack(children: [
//          Opacity(child: Image.asset(imagePath, color: Colors.black), opacity: 0.2),
//          ClipRect(child: BackdropFilter(
//            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
//              child: Image.asset(imagePath)))
//        ])
          leading: IconButton(
            padding: EdgeInsets.only(left: 30),
            onPressed: () => {widget.controller.toggle()},
            icon: Icon(Icons.menu),
            iconSize: 30.0,
            color: Colors.purple[600],
          ),
          actions: <Widget>[
            IconButton(
              padding: EdgeInsets.only(right: 30),
              tooltip: 'Search',
              onPressed: () async {
                final String? selected = await showSearch<String>(
                  context: context,
                  delegate: _delegate,
                );
                //if(selected != null){
                //  Scaffold.of(context).showSnackBar(
                //  SnackBar(content: Text("you have $selected"),)
                //);
                // }
              },
              icon: const Icon(Icons.search),
              iconSize: 30.0,
              color: Colors.purple[600],
            )
          ],
        ),
        body: ListView(
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Featured",
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  
                ],
              ),
            ),
            Container(
              height: 300.0,
              width: double.infinity,
              child: PageView.builder(
                controller: _pageController,
                itemCount: events.length,
                itemBuilder: (BuildContext context, int index) {
                  return _eventSelector(index);
                },
              ),
            ),
            SizedBox(height: 50,),
            //THIS CONTENT MUST BE TAKED FROM THE BACKEND

            //THIS CONTENT MUST BE TAKED FROM THE BACKEND
            //THE EVENTS LABELED WITH "LIKE", WILL BE SHOWED ONLY IF THERE IS EVENT STAMPED

            //Fazer o setstate dessa parte
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(
                //O nome "gostei" deve ser repensado posteriormente
                "Interest list",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            likeds.isEmpty
                ? Container( 
                    padding: EdgeInsets.only(top: 40),
                    child: Center(
                      child: Text(
                        "you don't give your \"liked\" yet",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple[200]),
                      ),
                    ),
                  )
                : Container(
                    height: 240.0,
                    width: double.infinity,
                    child: PageView.builder(
                      controller: _pageController1,
                      itemCount: likedsLength(),
                      itemBuilder: (BuildContext context, int index) {
                        return _likedSelector(index);
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

// Concertar essa porra depois
// class SpeechToText extends StatefulWidget {

//   @override
//   _SpeechToTextState createState() => _SpeechToTextState();
// }

// class _SpeechToTextState extends State<SpeechToText> {
//   stt.SpeechToText _speech;
//   double _confidence = 1.0;
//   bool _isListening = false;
//   String _text = "";

//   @override
//   void initState() {
//     super.initState();
//     _speech = stt.SpeechToText();
//   }

//   void _listen() async {
//     if (!_isListening) {
//       bool available = await _speech.initialize(
//         onStatus: (val) => print("onStatus: $val"),
//         onError: (val) => print("onError: $val"),
//       );
//       if (available) {
//         setState(() => _isListening = true);
//         _speech.listen(
//           onResult: (val) => setState(() {
//             _text = val.recognizedWords;
//             if (val.hasConfidenceRating && val.confidence > 0) {
//               _confidence = val.confidence;
//             }
//           }),
//         );
//       }
//     } else {
//       setState(() => _isListening = false);
//       _speech.stop();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return  AvatarGlow(
//               animate: _isListening,
//               glowColor: _isListening ? Colors.white : Colors.purple[600],
//               endRadius: 40.0,
//               duration: const Duration(milliseconds: 2000),
//               repeatPauseDuration: const Duration(milliseconds: 100),
//               repeat: true,
//               child: IconButton(
//                 tooltip: 'Voice Search',
//                 icon: Icon(_isListening ? Icons.mic : Icons.mic_none),
//                 onPressed: () {
//                   //o query não pode ser usado nessa função
//                   this.query = _listen;
//                 },
//               ),
//       );
//   }
// }

class MySearchDelegate extends SearchDelegate<String> {
  final List<String> _words;
  final List<String> _history;

  MySearchDelegate(List<String> words)
      : _words = words,
        _history = [],
        super();

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      query.isEmpty
          //resolver o problema do query
          ? Container()
          : IconButton(
              tooltip: 'clear',
              icon: const Icon(Icons.clear),
              onPressed: () {
                query = '';
                showSuggestions(context);
              },
            )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, ' ');
      },
    );
  }

  Widget searchCards(EventDesc event, BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => Event(
              event: event,
              tag: event.url + "search",
            ),
          ),
        ),
        child: Hero(
          tag: event.url + "search",
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

  List<Widget> searchList(BuildContext context) {
    List<Widget> seaList = [];
    for (int i = 0; i < events.length; i++) {
      if (events[i].name.toLowerCase().contains(this.query)) {
        if (events[i].name.toLowerCase().startsWith(this.query)) {
          seaList.add(searchCards(events[i], context));
        }
      }
    }
    return seaList;
  }

  @override
  Widget buildResults(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: ListView(
          //mainAxisSize: MainAxisSize.min,
          children: searchList(context),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final Iterable<String> suggestions = this.query.isEmpty
        ? _history
        : _words.where((word) => word.startsWith(query.toLowerCase()));

    return _SuggestionList(
      query: this.query,
      suggestions: suggestions.toList(),
      onSelected: (String suggestion) {
        this.query = suggestion;
        if (!_history.contains(suggestion)) this._history.insert(0, suggestion);
        showResults(context);
      },
    );
  }
}

class _SuggestionList extends StatelessWidget {
  final List<String>? suggestions;
  final String? query;
  final ValueChanged<String>? onSelected;

  const _SuggestionList({this.suggestions, this.query, this.onSelected});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.subtitle1;
    return ListView.builder(
      itemCount: suggestions!.length,
      itemBuilder: (BuildContext context, int i) {
        final String suggestion = suggestions![i].toLowerCase();
        return ListTile(
          leading: query!.isEmpty ? Icon(Icons.history) : Icon(null),
          title: RichText(
            text: TextSpan(
                text: suggestion.substring(0, query!.length),
                style: textTheme!.copyWith(fontWeight: FontWeight.bold),
                children: <TextSpan>[
                  TextSpan(
                    text: suggestion.substring(query!.length),
                    style: TextStyle(fontSize: 20.0),
                  )
                ]),
          ),
          onTap: () {
            onSelected!(suggestion);
          },
        );
      },
    );
  }
}