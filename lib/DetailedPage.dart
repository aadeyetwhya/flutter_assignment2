import 'package:flutter/material.dart';
import 'package:assignment2/model.dart';

class DetailedPage extends StatelessWidget {
  Model model;
  int index;
  DetailedPage(this.model, this.index);
  double width, height;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie review"),
        backgroundColor: Colors.redAccent.shade700,
      ),
      body: ListView(children: [
        _sizedBox(),
        _cover(),
        _sizedBox(),
        _bar(),
        _sizedBox(),
        _discription(),
        _sizedBox(),
        _review(),
        _sizedBox(),
      ]),
    );
  }

  Widget _sizedBox() {
    return SizedBox(height: 10.0);
  }

  Widget _cover() {
    return Row(children: [
      Expanded(
        flex: 3,
        child: Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Image(
            fit: BoxFit.fill,
            height: 225.0,
            image: NetworkImage("${model.image_url[index]}"),
          ),
        ),
      ),
      SizedBox(width:10.0),
      Expanded(
          flex: 4,
          child: Column(
            children: [
              Container(
                height: 180.0,
                padding: EdgeInsets.only(top: 25.0),
                alignment: Alignment.topCenter,
                child: Text(
                  model.title[index],
                  style: TextStyle(fontSize: 25.0),
                ),
              ),
              Container(child: Text("IMDB Code: ${model.imbd_code[index]}",style:TextStyle(fontSize:15.0))),
              Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _rating(),
              )),
            ],
          ))
    ]);
  }

  Widget _bar() {
    return Row(
      children: [
        Container(
            height: 30.0,
            width: width * 0.09,
            color: Colors.redAccent.shade700),
        Container(
          height: 30.0,
          width: width * 0.36,
          child: Text("MOVIE INFO",
              style: TextStyle(
                fontSize: 27.0,
                fontWeight: FontWeight.w500,
              )),
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 5.0, ),
        ),
        Container(
            height: 30.0,
            width: width * 0.55,
            color: Colors.redAccent.shade700),
      ],
    );
  }

  Widget _discription() {
    return Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Text("${model.summary[index]}", style: TextStyle(fontSize: 16.0)));
  }

  Widget _review() {
    return Row(children: [
      Padding(
        padding: const EdgeInsets.only(left:40.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Genre:", style: TextStyle(color: Colors.red, fontSize: 20.0)),
          Text("Rating:", style: TextStyle(color: Colors.red, fontSize: 20.0)),
          Text("Language:",
              style: TextStyle(color: Colors.red, fontSize: 20.0)),
          Text("MPA rating:",
              style: TextStyle(color: Colors.red, fontSize: 20.0)),
          Text("Run Time:",
              style: TextStyle(color: Colors.red, fontSize: 20.0)),
          Text("Quality:", style: TextStyle(color: Colors.red, fontSize: 20.0)),
          Text("Type:", style: TextStyle(color: Colors.red, fontSize: 20.0)),
        ]),
      ),
      SizedBox(width: 20.0),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children:_genre()),//genre
        Text("${model.Rating[index]}", style: TextStyle(fontSize: 20.0)),
        Text(model.Language[index], style: TextStyle(fontSize: 20.0)),
        Text("${model.Certificate[index]}", style: TextStyle(fontSize: 20.0)),
        Text("${model.time[index]} min", style: TextStyle(fontSize: 20.0)),
        Text("${model.Quality[index]}", style: TextStyle(fontSize: 20.0)),
        Text("Blue-Ray", style: TextStyle(fontSize: 20.0)),
      ])
    ]);
  }

  List _rating() {
    List<Widget> star = new List();
    Widget eachstar,eachHalfStar;
    num rating=model.Rating[index];
    num doubleRating=rating*10;
    int intRating=doubleRating~/10;// double to int
    num halfStar=rating-intRating;


    for (int i = 0; i < intRating; i++) {
      eachstar = Icon(Icons.star, color: Colors.yellow.shade600);
      star.add(eachstar);
    }
    if(halfStar>0.4){
      eachHalfStar = Icon(Icons.star_half, color: Colors.yellow.shade600);
      star.add(eachHalfStar);
    }
    return star;
  }
  List _genre(){
    List<Widget> genre=new List();
    List fetchgenre=model.genre[index];//loading genre for invididual movie
    Widget eachGenre;
    int len=fetchgenre.length;
    for(int i=0;i<len;i++){
      eachGenre=Text(fetchgenre[i],style: TextStyle(fontSize: 20.0));

      genre.add(eachGenre);
      genre.add(Text(",",style: TextStyle(fontSize: 25.0)));
    }
    genre.removeLast();
    return genre;
  }
}
