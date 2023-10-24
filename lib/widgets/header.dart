// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:http/http.dart' as http;

import '../screens/movie.dart';

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  String title = '';
  String coverUrl = '';
  double rating = 0.0;
  int year = 0;
  String duration = '';
  String summary = '';
  String director = '';
  String video = '';

  // String subtitle ='';

  Future getForYouMoves() async {
    Random random = Random();
    int randomNumber = random.nextInt(9);
    final response = await http
        .get(Uri.parse('https://salardev.com/devs/moviesProject/movies.json'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        title = data['foryou'][randomNumber]['title'];
        coverUrl = data['foryou'][randomNumber]['cover'];
        rating = data['foryou'][randomNumber]['rating'];
        year = data['foryou'][randomNumber]['year'];
        duration = data['foryou'][randomNumber]['duration'];
        summary = data['foryou'][randomNumber]['summary'];
        director = data['foryou'][randomNumber]['director'];
        video = data['foryou'][randomNumber]['video'];
      });
    } else {
      if (kDebugMode) {
        print('A network error occurred');
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getForYouMoves();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=> MovieDetails(
                title: title,
                cover: coverUrl,
                director: director,
                duration: duration,
                rating: rating,
                summary: summary,
                video: video,
                year: year
            )
        )
        );




      },

      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 400,
            decoration: BoxDecoration(color: Colors.black),
            child: coverUrl == '' ? Container(color: Colors.red,): Image.network(coverUrl,fit:BoxFit.cover ,),
          ),
          Positioned(
            bottom: 0,
              child: Container(
                height: 250,
                width: MediaQuery.of(context).size.width,
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
                child: Padding(
                  padding: EdgeInsets.all( 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.star,color: Colors.amber,),
                          SizedBox(width: 5,),
                          Text(
                            rating.toString(),
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
          )
        ],
      ),
    );
  }
}
