// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:movies_app/provider/movie_provider.dart';
import 'package:movies_app/widgets/genere.dart';
import 'package:movies_app/widgets/header.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<MovieProvider>(context).fetchMovies();
    return  Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(),
            Genre(
              title: 'Action',
              movies: Provider.of<MovieProvider>(context).actionMovies,),
            Genre(
              title: 'Drama',
              movies: Provider.of<MovieProvider>(context).dramaMovies,),
            Genre(
              title: 'comedy',
              movies: Provider.of<MovieProvider>(context).comedyMovies,),
            Genre(
              title: 'Adventure',
              movies: Provider.of<MovieProvider>(context).adventureMovies,),
            Genre(
              title: 'Animation',
              movies: Provider.of<MovieProvider>(context).animationMovies,),

          ],
        ),
      ),
    );
  }
}
