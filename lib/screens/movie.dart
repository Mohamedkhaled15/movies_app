// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:movies_app/screens/video.dart';

class MovieDetails extends StatelessWidget {
  final String title;

  final String cover;

  final double rating;
  final int year;

  final String duration;

  final String summary;

  final String director;

  final String video;

  MovieDetails({super.key,
    required this.title,
    required this.cover,
    required this.director,
    required this.duration,
    required this.rating,
    required this.summary,
    required this.video,
    required this.year,

  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 500,
                  color: Colors.black,
                  child: Stack(
                    children: [
                    Positioned.fill(
                      child: Image(
                        image: NetworkImage(
                          cover,),
                        errorBuilder: (context, exception, stackTrack) => Image(image: NetworkImage('https://cloud.filmdb.elcapitantheatre.com/FilmImages/56/1/309/AWOW%20Poster%20New.png'),fit: BoxFit.cover,),
                        fit: BoxFit.cover,

                      ),),
                    Positioned.fill(
                      bottom: 0,
                      child: Container(
                        height: 100,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black,
                                ]
                            )
                        ),
                      ),
                         ),
                    Positioned.fill(
                      
                      child: Container(
                        color: Colors.black.withOpacity(0.4),

                      )
                         ),
                      Positioned(bottom: 0,left:0,
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Image(
                                  image: NetworkImage(
                                    cover,),
                                  errorBuilder: (context, exception, stackTrack) => Image(image: NetworkImage('https://cloud.filmdb.elcapitantheatre.com/FilmImages/56/1/309/AWOW%20Poster%20New.png'),fit: BoxFit.cover,),
                                ),
                                height: 220,
                              ),
                              SizedBox(height: 5,),
                              Text(title,
                                softWrap: true,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.star,color: Colors.amber,),
                                  SizedBox(width: 4,),
                                  Text(rating.toString(),
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white
                                  ),
                                  ),
                                  SizedBox(width: 15,),
                                  Text(year.toString(),
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white
                                  ),) ,
                                  SizedBox(width: 15,),
                                  Text(duration,style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white
                                  ),)

                              ],
                              )
                            ],
                          ),
                        )
                        ,)
                    ],
                  ),


                ),
                Padding(
                    padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 55,
                        decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.all(Radius.circular(8))

                        ),
                        child: MaterialButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>VideoScreen(video: video)));
                          },
                          child: Text(
                            'Watch Now',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),

                      ),
                      SizedBox(
                        height: 10,),
                      Text(summary,textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16
                      ),
                      ),
                      SizedBox(
                        height: 10,),
                      Text(director,textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SafeArea(
              child: Padding(
            padding: EdgeInsets.only(left: 10),
                child: IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios,color: Colors.deepOrange,),


                ),
              )
          )


        ],
      ),
    );
  }
}
