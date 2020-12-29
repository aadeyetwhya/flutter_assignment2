import 'package:flutter/material.dart';
import 'package:assignment2/model.dart';
import 'package:assignment2/DetailedPage.dart';

class CardPage extends StatelessWidget {
  List eachItems = new List();
  Model model;
  List movieDetails;
  CardPage(this.model);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      appBar: AppBar(title: Text("MOVIE REVIEW"),backgroundColor:Colors.redAccent.shade700),
      body: ListView(
        children: EachCard(context),
      ),
    );
  }

  List<Widget> EachCard(BuildContext context) {
    List<Widget> _cards = List();
    for (int i = 0; i < model.title.length; i++) {
      Widget _eachCard = GestureDetector(onTap:(){
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailedPage(model,i),));
        print("its ok");
      },child:Card(
        color: Colors.white,
        child: Column(children: [
          Text(
            model.title[i],
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
          ),
          Divider(
            color: Colors.black87,
          ),
          Image(
            height: 300,
            width: double.infinity,
            fit: BoxFit.fill,
            image: NetworkImage("${model.image_url[i]}"),
          ),
          Container(alignment:Alignment.centerLeft,
            padding:EdgeInsets.only(top:5.0,bottom:5.0,left:5.0),
            child: Text("(Release Year :${model.year[i]})",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
          ),
        ]),
      ));
      _cards.add(_eachCard);
    }
    return _cards;
  }
}
