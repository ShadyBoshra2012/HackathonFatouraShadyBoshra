import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_fatura/tasks/third_task/models/movie.dart';
import 'package:hackathon_fatura/tasks/third_task/services/db_service.dart';
import 'package:hackathon_fatura/tasks/third_task/third_task_constants.dart';

class HomeController extends ChangeNotifier {
  List<Movie>? popularMovies;
  List<Movie>? topRatedMovies;
  List<Movie>? favourties;

  HomeController() {
    DBService.instance.open();
    DBService.instance.getMovies().then((value) => favourties = value);
    initPopularMovies();
    initTopRatedMovies();
  }

  Future initPopularMovies() async {
    popularMovies = [];

    Response response = await Dio()
        .get("${ThirdTaskConstants.getRequestURL(MoviesSortBy.popularity, 1)}");

    // Get all results.
    List<Map<String, dynamic>> results =
        List<Map<String, dynamic>>.from(response.data["results"]);
    print(results);

    for (var movieMap in results) {
      Movie movie = Movie.fromJson(movieMap);
      popularMovies!.add(movie);
    }

    notifyListeners();
  }

  Future initTopRatedMovies() async {
    topRatedMovies = [];

    Response response = await Dio()
        .get("${ThirdTaskConstants.getRequestURL(MoviesSortBy.recent, 1)}");

    // Get all results.
    List<Map<String, dynamic>> results =
        List<Map<String, dynamic>>.from(response.data["results"]);
    print(results);

    for (var movieMap in results) {
      Movie movie = Movie.fromJson(movieMap);
      topRatedMovies!.add(movie);
    }

    notifyListeners();
  }
}
