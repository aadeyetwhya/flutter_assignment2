import 'package:flutter/material.dart';
import 'CardPage.dart';

class Model {
  List title = List();
  List movieDetails;
  List year;
  List image_url;
  List time;
  List genre;
  List summary;
  List Language;
  List imbd_code;
  List Certificate;
  List Rating;
  List Quality=["720P","1080 P","720P","1080 P","720P","1080 P","720P","1080 P","720P","1080 P","720P","1080 P","720P","1080 P","720P","1080 P","720P","1080 P","720P","1080 P"];
  Model(
      {this.title,
      this.year,
      this.image_url,
      this.summary,
      this.genre,
      this.Language,
      this.imbd_code,
      this.Certificate,
      this.time,
      this.Rating}) {
    /*
    for (int i = 0; i < title.length; i++) {
      print(title[i]);
    }

     */
  }
}
