import 'dart:convert';

import 'package:movie_app/core/errors.dart';
import 'package:movie_app/data/data_sources/movie_remote_data_source.dart';
import 'package:movie_app/data/models/movie_models.dart';
import 'package:http/http.dart' as http;

class MovieRemoteDateSourceImpl implements MovieRemoteDateSource {
  final http.Client client;

  MovieRemoteDateSourceImpl({required this.client});
  static const BASE_URL = "https://api.themoviedb.org/3";
  static const API_KEY = "6a810c9e7e13a5d78732c63baa4f724a";
  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response =
        await client.get(Uri.parse("$BASE_URL/movie/popular?api_key=$API_KEY"));
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      final List<MovieModel> movies =
          (responseBody["results"] as List).map((movie) {
        return MovieModel.fromJson(movie);
      }).toList();
      return movies;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> getTrendingMovies() async {
    final response = await client
        .get(Uri.parse("$BASE_URL/trending/movie/day?api_key=$API_KEY"));
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      final List<MovieModel> movies =
          (responseBody["results"] as List).map((movie) {
        return MovieModel.fromJson(movie);
      }).toList();
      return movies;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> searchMovies(String query) async {
    final response = await client
        .get(Uri.parse("$BASE_URL/search/movie?query=$query&api_key=$API_KEY"));
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      final List<MovieModel> movies =
          (responseBody["results"] as List).map((movie) {
        return MovieModel.fromJson(movie);
      }).toList();
      return movies;
    } else {
      throw ServerException();
    }
  }
}
