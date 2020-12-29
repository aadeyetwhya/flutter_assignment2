import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:assignment2/model.dart';
import 'CardPage.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        RaisedButton(
            color: Colors.redAccent.shade700,
            onPressed: () {
              _fetch(context);
            },
            child: Text("Press me")),
      ],
    );
  }

  void _fetch(BuildContext context) async {
    String url = "https://yts.mx/api/v2/list_movies.jsonp";
    Response res = await get(url);
    List movieDetail = _responseDecoder(res.body, context);
  }

  List _responseDecoder(String body, BuildContext context) {
    Map decoded = jsonDecode(body);
    List movieTitles = [];
    List movieYears = [];
    List movieImage = [];
    List movieSummary = [];
    List movieGenre = [];
    List movieLanguage = [];
    List movieImdbCode = [];
    List movieCertificate = [];
    List movieTime = [];
    List movieQuality = [];
    List movieRating = [];

    List movieDetail = decoded["data"]["movies"];
    print(movieDetail.length);
    for (int i = 0; i < movieDetail.length; i++) {
      Map eachMovie = movieDetail[i];
      String eachMovieTitle = eachMovie["title"];
      movieTitles.add(eachMovieTitle);

      int eachMovieYear = eachMovie["year"];
      movieYears.add(eachMovieYear);

      String eachMovieImage = eachMovie["large_cover_image"];
      movieImage.add(eachMovieImage);

      String eachMovieSummary = eachMovie["summary"];
      movieSummary.add(eachMovieSummary);

      List eachMovieGenre = eachMovie["genres"];
      movieGenre.add(eachMovieGenre);

      String eachMovieLanguage = eachMovie["language"];
      movieLanguage.add(eachMovieLanguage);

      String eachMovieCertificate = eachMovie["Certificate"];
      movieCertificate.add(eachMovieCertificate);

      String eachMovieImdbCode = eachMovie["imdb_code"];
      movieImdbCode.add(eachMovieImdbCode);

      int eachMovieTime = eachMovie["runtime"];
      movieTime.add(eachMovieTime);

      var eachMovieRating = eachMovie["rating"];
      movieRating.add(eachMovieRating);
    }
    Model model = Model(
        title: movieTitles,
        year: movieYears,
        image_url: movieImage,
        summary: movieSummary,
        genre: movieGenre,
        Language: movieLanguage,
        imbd_code: movieImdbCode,
        Certificate: movieCertificate,
        time: movieTime,
        Rating: movieRating);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CardPage(model),
        ));
  }
}
