import 'money_format.dart';

class EventDesc{
  String name,url,description,date,price;
  int lot;
  EventDesc(this.name,this.url,this.description,this.price,this.lot,this.date);
}
class ManageEvent{
  String name,imageUrl,valuePerTicket;
  double collectedAmount;
  int ticketSolds,lot,numberOfLikes,totIngre;
  bool isLoted;
  //todas essas informações devev ser tiradas do server
  ManageEvent(this.name,this.imageUrl,this.valuePerTicket,this.collectedAmount,this.ticketSolds,this.lot,this.numberOfLikes,this.totIngre,this.isLoted);

  double media(){
    return (ticketSolds+numberOfLikes)/2;
  }

  void addLike(){
    //essa informação deve ser passada parra o server
    numberOfLikes++;
  }
  int get likes{
    return this.numberOfLikes;
  }
  
  void addAmount(){
    double myPart = (MoneyFormat(valuePerTicket).formatToDouble()*7)/100;
    //essa informação deve ser passada para o sever
    this.collectedAmount = this.collectedAmount + (MoneyFormat(valuePerTicket).formatToDouble()-myPart);
    //ess informação deve ser passada para o server
    this.ticketSolds++;
  }
  double get amount{
    return this.collectedAmount;
  }
}

List<EventDesc> events = [EventDesc("Grassland","./images/Grassland.jpg","this is the Grasland","1000",1,"10/02/2020"),
                      EventDesc("Hummingbird","images/Hummingbird.jpg","This is the Hummingbird","500",1,"20/02/2020"),
                      EventDesc("Mountain","images/Mountain.jpg","The great Mountain","1230",1,"03/03/2020"),
                      EventDesc("Sunset","images/Sunset.jpg","The beautiful Sunset","750",1,"06/03/2020")];
List<String> allTitle(){
  List<String> _eventsTitle = [];
  for(int i = 0;i < events.length;i++){
    _eventsTitle.add(events[i].name.toLowerCase());
  }
  return _eventsTitle;
}

class ClientsList{
  static List<EventDesc> likedList = [];
  static List<EventDesc> ticketList = [];
  static List<ManageEvent> eventList = [ManageEvent("Hummingbird","images/Hummingbird.jpg" , "399,99", 0, 0, 1,0,300,true)];
  static List<EventDesc> valTick = [events[1]];
//O código abaixo precisa ser melhorado, ele será mantido apenas para testar interface
  int getRank(ManageEvent element){
    sortRank();
    return eventList.indexOf(element)+1;
  }
  void sortRank(){
    eventList.sort((a,b) => b.media().compareTo(a.media()));
  } 
  
}