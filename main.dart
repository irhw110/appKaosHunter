import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VendorList',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: ListDisplay(),
    );
  }
}

class ListDisplay extends StatefulWidget {
  @override
  State createState() => new DynamicList();
}

class DynamicList extends State<ListDisplay> {
  List<String> vendorName = ["TokoQ","New Jersey","Bora bora","Sadikin","myDenim","Jaketku","Seragam Sekolah"];
  List<String> vendorAdress = ["Jalan Cisitu no.7 Bandung","Jalan Setiabudi no.5 Bandung","Jalan Sangkuriang, Bandung","Jalan Ganeca, bandung","Jalan Dayang Sumbi, Bandung","Jalan Braga, Bandung","Jalan Reformasi, Bandung"];
  List<String> vendorRating = ["3","4.5","2","4","4","3","3.5"];

  Widget buildBody(BuildContext ctxt, int index) {
    final leftSection = new Container(
        padding: new EdgeInsets.only(left: 8.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
              new Container(
                padding: new EdgeInsets.only(bottom: 60),
                  child: new Text(vendorName[index],
                  style: new TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                  ),),
            ),
              new Text(vendorAdress[index],
                style: new TextStyle(color: Colors.white),),
          ],
        ),
      );

    final rightSection = new Container(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children :<Widget>[
          new Container(
            padding: new EdgeInsets.all(8.0),
            child: new CircleAvatar(
              backgroundImage: new NetworkImage('https://picsum.photos/250?image=9'),
              radius: 45.0,
            ),
          ),
          new Container(
            padding: new EdgeInsets.all(8.0),
            child: new Text("rating "+ vendorRating[index] +"/5",
            style: new TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 16.0,
            ),
          ),
          ),

        ],
      ),
    );

    return new Container(
      padding: EdgeInsets.all(12.0),
      child: new GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => VendorProfile()),
          );
        },
        child: new Container(
          color: Colors.blue,
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              leftSection,
              rightSection,
            ],
          ),
        ),
      ),

    );
  }

  @override
  Widget build (BuildContext ctxt) {
    return new Scaffold(
        appBar: new AppBar(title: new Text("VendorList"),),
        body: new Column(
          children: <Widget>[
            new Expanded(
                child: new ListView.builder
                  (
                  itemCount: vendorName.length,
                  itemBuilder: (BuildContext ctxt, int index) => buildBody(ctxt, index),
                )
            ),
          ],
        )
    );
  }
}

class VendorProfile extends StatelessWidget {

  final List<String> images = [
    "https://uae.microless.com/cdn/no_image.jpg",
    "https://images-na.ssl-images-amazon.com/images/I/81aF3Ob-2KL._UX679_.jpg",
    "https://www.boostmobile.com/content/dam/boostmobile/en/products/phones/apple/iphone-7/silver/device-front.png.transform/pdpCarousel/image.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgUgs8_kmuhScsx-J01d8fA1mhlCR5-1jyvMYxqCB8h3LCqcgl9Q",
    "https://ae01.alicdn.com/kf/HTB11tA5aiAKL1JjSZFoq6ygCFXaw/Unlocked-Samsung-GALAXY-S2-I9100-Mobile-Phone-Android-Wi-Fi-GPS-8-0MP-camera-Core-4.jpg_640x640.jpg",
    "https://media.ed.edmunds-media.com/gmc/sierra-3500hd/2018/td/2018_gmc_sierra-3500hd_f34_td_411183_1600.jpg",
    "https://hips.hearstapps.com/amv-prod-cad-assets.s3.amazonaws.com/images/16q1/665019/2016-chevrolet-silverado-2500hd-high-country-diesel-test-review-car-and-driver-photo-665520-s-original.jpg",
    "https://www.galeanasvandykedodge.net/assets/stock/ColorMatched_01/White/640/cc_2018DOV170002_01_640/cc_2018DOV170002_01_640_PSC.jpg",
    "https://media.onthemarket.com/properties/6191869/797156548/composite.jpg",
    "https://media.onthemarket.com/properties/6191840/797152761/composite.jpg",
  ];

  @override
  Widget build (BuildContext ctxt) {
    return new Scaffold(
        appBar: new AppBar(title: new Text("Vendor Profile"),),
        body: new Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: <Widget>[
            new Container(
              height: 300,
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken),
                  image: NetworkImage('https://picsum.photos/250?image=9'),
                  fit: BoxFit.fill,
                ),
              ),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                      new Container(
                        padding: new EdgeInsets.all(16.0),
                        child: new CircleAvatar(
                          backgroundImage: new NetworkImage('https://picsum.photos/250?image=9'),
                          radius: 45.0,
                        ),
                      ),
                      new Column(
                        children: <Widget>[
                          new Container(
                            padding: EdgeInsets.only(bottom: 10),
                            child: new Text('TokoQ',
                              style: new TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 25.0,
                              ),),
                          ),
                          new Text('rating 4.4/5',
                            style: new TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),),
                        ],
                      ),

                    ],
                  ),
                  new Container(
                    padding: EdgeInsets.only(left: 12),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[new Text("menyediakan aneka kaos, jersey, jaket kualitas super",
                            style: new TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0,
                            ),),new Text('Jalan Cisitu no.7 Bandung',
                            style: new TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 12.0,
                            ),),
                    new Text('+6281264024647',
                            style: new TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 12.0,
                            ),),
                      ],
                    ),
                  ),
                  new Container(
                    padding: new EdgeInsets.only(left: 12.0, right: 8.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        new Text("Like : 1019",
                          style: new TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 12.0,
                          ),),
                        Align(
                          alignment: Alignment.topRight,
                          child: new Row(
                            children: <Widget>[

                              new RaisedButton(
                                color: Colors.lightBlue,
                                child: new Text("follow"),
                                onPressed:() {
                                  Navigator.pop(ctxt);
                                } ,
                              ),
                              new Container(
                                padding: EdgeInsets.only(left: 12),
                                child: new RaisedButton(
                                  color: Colors.lightBlue,
                                  child: new Text("chat"),
                                  onPressed:() {
                                    Navigator.push(
                                      ctxt,
                                      MaterialPageRoute(builder: (context) => ChatDisplay()),
                                    );
                                  } ,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  new Container(
                    padding: new EdgeInsets.only(left: 12.0, right:  8.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        new Text("Ordered : 20",
                          style: new TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 12.0,
                          ),),
                        Align(
                          alignment: Alignment.topRight,
                          child: new RaisedButton(
                              color: Colors.lightBlue,
                              child: new Text("Order Custom"),
                              onPressed: () {
                                Navigator.pop(ctxt);
                              } ,),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          new Container(
            color: Colors.lightBlue,
            child: new Container(
              padding: EdgeInsets.all(6),
              child: new Center(
                child: new Text('Galleries',
                  style: new TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                  ),),
              ),
            )
          ),
          new Expanded(child: new GridView(
            physics: BouncingScrollPhysics(), // if you want IOS bouncing effect, otherwise remove this line
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),//change the number as you want
            children: images.map((url) {
              return Card(child: Image.network(url));
            }).toList(),
          ),)
          ],
        )
    );
  }
}

class ChatDisplay extends StatefulWidget {
  @override
  State createState() => BubbleScreen();
}

class BubbleScreen extends State<ChatDisplay> {
  List<String> chatList = [];
  List<DateTime> timeList = [];
  List<bool> deliveredList= [];
  List<bool> isMeList=[];


  final chatBox = new TextEditingController();

  Widget bubble(BuildContext context,int index) {
    final bg = isMeList[index] ? Colors.white : Colors.greenAccent.shade100;
    final align = isMeList[index] ? CrossAxisAlignment.start : CrossAxisAlignment.end;
    final icon = deliveredList[index] ? Icons.done_all : Icons.done;
    final radius = isMeList[index]
        ? BorderRadius.only(
      topRight: Radius.circular(5.0),
      bottomLeft: Radius.circular(10.0),
      bottomRight: Radius.circular(5.0),
    )
        : BorderRadius.only(
      topLeft: Radius.circular(5.0),
      bottomLeft: Radius.circular(5.0),
      bottomRight: Radius.circular(10.0),
    );
    final minute = timeList[index].minute<10 ? "0"+timeList[index].minute.toString() : timeList[index].minute.toString();
    return Column(
      crossAxisAlignment: align,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.all(3.0),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  blurRadius: .5,
                  spreadRadius: 1.0,
                  color: Colors.black.withOpacity(.12))
            ],
            color: bg,
            borderRadius: radius,
          ),
          child: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 48.0),
                child: Text(chatList[index]),
              ),
              Positioned(
                bottom: 0.0,
                right: 0.0,
                child: Row(
                  children: <Widget>[
                    Text(timeList[index].hour.toString() + "." + minute,
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 10.0,
                        )),
                    SizedBox(width: 3.0),
                    Icon(
                      icon,
                      size: 12.0,
                      color: Colors.black38,
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
           title: new Row(
             children: <Widget>[
               new CircleAvatar(
                   backgroundImage: new NetworkImage('https://picsum.photos/250?image=9'),
                   radius: 24.0,
               ),
               new Container(
                 padding: EdgeInsets.only(left: 20),
                 child: new Text("TokoQ",
                     style: TextStyle(
                       color: Colors.white,
                       fontSize: 18.0,
                     )
                 ),
               ),
             ],
           ),
           leading: new IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
        ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Expanded(
                child: new ListView.builder
                  (
                    itemCount: chatList.length,
                    itemBuilder: (BuildContext ctxt, int index) =>
                        bubble(ctxt, index),
                )
            ),

            new TextField(
              controller: chatBox,
            ),

            new FlatButton.icon(onPressed: (){
              chatList.add(chatBox.text);
              timeList.add(DateTime.now());
              deliveredList.add(true);
              isMeList.add(true);
              chatBox.clear();
              setState(() {});
            }
                , icon: Icon(Icons.send), label: new Text("Send")),
            new FlatButton.icon(onPressed: (){
              chatList.add(chatBox.text);
              timeList.add(DateTime.now());
              deliveredList.add(true);
              isMeList.add(false);
              chatBox.clear();
              setState(() {});
            }, icon: Icon(Icons.send), label: new Text("Send"))
          ],
        ),
      ),
    );
  }
}