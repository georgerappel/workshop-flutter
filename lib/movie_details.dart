import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:workshop_test/models/movie.dart';

class MovieDetails extends StatelessWidget {
  Movie movie;
  
  MovieDetails(this.movie);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 150,
                      child: Image.network(
                          "https://cdn3.movieweb.com/i/article/zbWxdIYzk73Dyek2RpinAU6LKRshEQ/798:50/Dora-The-Explorer-Movie-Posters-Lost-City-Gold.jpg",
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Hero(
                    child: Image.network("https://townsquare.media/site/442/files/2019/03/doradomonlineteaser1-sheet.jpg?w=1969&h=3073&q=75", height: 100,),
                    tag: movie.title + "_cover",
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
              Divider(),
              Column(
                children: <Widget>[
                  Text(movie.description)
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
