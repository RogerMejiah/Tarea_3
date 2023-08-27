import 'dart:convert';

import 'package:unahplus/constants.dart';
import 'package:unahplus/models/movies.dart';
import 'package:http/http.dart' as http;

class Api {
  static const _popularUrl =
      'https://api.themoviedb.org/3/movie/popular?api_key=${Constants.apiKey}';

  static const _creditsUrl =
      'https://api.themoviedb.org/3/movie/{movie_id}/credits?api_key=${Constants.apiKey}';

  Future<List<Movies>> getPopularMovies() async {
    final response = await http.get(Uri.parse(_popularUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movies.fromJson(movie)).toList();
    } else {
      throw Exception('Something went wrong');
    }
  }

  Future<List<Movies>> getCredits(Movies movies) async {
    final response = await http.get(Uri.parse(_creditsUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['cast'] as List;
      return decodedData.map((movie) => Movies.fromJson(movie)).toList();
    } else {
      throw Exception('Something went wrong');
    }
  }
}
