// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:movies_app/screens/movie.dart';

class Genre extends StatelessWidget {
  final String title;
  final List movies;

  const Genre({super.key, required this.title, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 200,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: movies.length,
                    itemBuilder: (context, index) {
                      final item =movies[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context)=> MovieDetails(
                                    title: item['title'],
                                    cover: item['cover'],
                                    director: item['director'],
                                    duration: item['duration'],
                                    rating: item['rating'],
                                    summary: item['summary'],
                                    video: item['video'],
                                    year: item['year'])
                            )
                            );
                          },
                          child: Container(
                            width: 100,
                            height: 100,
                            color: Colors.black,
                            child:Image(
                              image: NetworkImage(
                                item['cover'],),
                              errorBuilder: (context, exception, stackTrack) => Image(image: NetworkImage('https://cloud.filmdb.elcapitantheatre.com/FilmImages/56/1/309/AWOW%20Poster%20New.png'),fit: BoxFit.cover,),
                              fit: BoxFit.cover,

                            )

                            // Image.network(
                            //   item['cover'] ?? 'https://m.media-amazon.com/images/M/MV5BOTlmNGE0ZGMtMzdkMC00MjQyLWI1ZjgtZTIxODAyNWJlZDFlXkEyXkFqcGdeQXVyNTQ4ODM2NjM@._V1_FMjpg_UX1000_.jpg',
                            //   cacheHeight: 300,
                            //   cacheWidth: 200
                            //   ,fit: BoxFit.cover,),
                          ),
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
