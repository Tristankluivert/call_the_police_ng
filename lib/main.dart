import 'dart:convert';
import 'package:flutter/material.dart';


void main()=> runApp(new MaterialApp(

  theme: new ThemeData(
    primarySwatch: Colors.blue,

  ),

  home: new HomePage()

));

class HomePage extends StatefulWidget{

  @override
  HomePageState createState() => new HomePageState();

}



class HomePageState extends State<HomePage> {


    @override
    Widget build(BuildContext context) {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text("Call The Police Ng"),

        ),
        body: new Container(
          child: new Center(
            child: new FutureBuilder(
              future: DefaultAssetBundle.of(context).loadString(
                  'lib/load_json/contacts.json'),
              builder: (context, snapshot) {
                //Decode json
                var mydata = jsonDecode(snapshot.data.toString());
                return new ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return new Card(
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          new Text(
                              "location  :   " + mydata[index]["location"]),
                          new Text("phone  :   " + mydata[index]["phone"])
                        ],
                      ),
                    );
                  },
                  itemCount: mydata == null ? 0 : mydata.length,
                );
              },
            ),
          ),
        ),
      );
    }
  }


