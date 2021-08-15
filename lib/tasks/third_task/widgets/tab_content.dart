import 'package:flutter/material.dart';
import 'package:hackathon_fatura/tasks/third_task/models/movie.dart';
import 'package:hackathon_fatura/tasks/third_task/widgets/movie_tile.dart';

class TabContent extends StatelessWidget {
  final List<Movie>? movies;

  const TabContent({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (movies == null) return Center(child: CircularProgressIndicator());

    return GridView.count(
      crossAxisCount: 2,
      children: movies!.map((e) => MovieTile(movie: e)).toList(),
    );
  }
}
