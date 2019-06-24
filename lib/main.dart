import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:workshop_test/movie_details.dart';

import 'models/movie.dart';

void main() => runApp(MyApp());

List<Movie> movies = [
  Movie("Capitã Marvel", "Um filme muito bom", "/hasudhuasd.png", "5.4"),
  Movie("Avatar", "Um filme meio bom", "/hasudhuasd.png", "5.4"),
  Movie("Os Vingadores 2", "Um filme menos bom", "/hasudhuasd.png", "5.4"),
  Movie("Ariel", "Um filme meh", "/hasudhuasd.png", "5.4"),
  Movie("Os Vingadores O filme mais recente", "Um filme lixoso",
      "/hasudhuasd.png", "5.4"),
  Movie("A Origem", "Um filme M I N D B L O W I N G", "/hasudhuasd.png", "5.4"),
  Movie("Velozes e furiosos 7 - Do Drift em tokyo sete",
      "Um filme M I N D B L O W I N G", "/hasudhuasd.png", "5.4"),
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(title: 'Workshop DevMob'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              return FilmeTile(movies[index]);
            }));
  }
}

class FilmeTile extends StatelessWidget {
  Movie movie;

  FilmeTile(this.movie);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Material(
          child: Card(
            child: Container(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Hero(
                    tag: movie.title + "_cover",
                    child: Image.network(
                      "https://townsquare.media/site/442/files/2019/03/doradomonlineteaser1-sheet.jpg?w=1969&h=3073&q=75",
                      height: 100,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                  ),
                  Expanded(
                    child: Hero(
                      tag: movie.title + "_tr",
                      child: Material(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    movie.title,
                                    style: TextStyle(fontSize: 20),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(movie.rating, style: TextStyle(fontSize: 18,),),
                                Icon(Icons.star, size: 18, color: Colors.amber,),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetails(movie) ) ),
    );
  }
}

//Center(
//        child: Material(
//          child: Card(
//            child: Row(
//              children: <Widget>[
//                Expanded(child: Image.network("https://townsquare.media/site/442/files/2019/03/doradomonlineteaser1-sheet.jpg?w=1969&h=3073&q=75")),
//                Text("titulo do filme"),
//                Row(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: <Widget>[
//                    Icon(Icons.star),
//                    Text("5.0")
//                  ],
//                )
//              ],
//            ),
//          ),
//        ),
//      )
