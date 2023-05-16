import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/home_models/AlsoLiked.dart';
import '../models/home_models/popular.dart';
import '../models/home_models/trending_movie.dart';
import '../models/series_models/series_popular.dart';
import '../models/series_models/series_top_rated.dart';
import '../models/series_models/series_trending.dart';

class ApiServices {
  final Dio dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {'api_key': '85c769a17d7385f87d8114d0a5c0d7a1'}));
  Future<TrendingMovies?> getTrending() async {
    try {
      Response response = await dio.get('/trending/movie/day');
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        var jsonResponse = json.encode(response.data);
        return trendingMoviesFromJson(jsonResponse);
      }
    } catch (e) {
      print("an error occured on getTrending :$e");
    }
    return null;
  }

  Future<AlsoLikedMovies?> getLiked() async {
    try {
      Response response = await dio.get('/movie/top_rated');
      if (response.statusCode == 200) {
        var jsonResponse = json.encode(response.data);
        return alsoLikedMoviesFromJson(jsonResponse);
      }
    } catch (e) {
      print('an error occured on getLiked :$e');
    }
    return null;
  }

  Future<PopularMovies?> getPopular() async {
    try {
      Response response = await dio.get('/movie/now_playing');
      if (response.statusCode == 200) {
        var jsonResponse = json.encode(response.data);
        return popularMoviesFromJson(jsonResponse);
      }
    } catch (e) {
      print('an error occured in getpopular :$e');
    }
    return null;
  }

  Future<SeriesPopular?> getPopularSeries() async {
    try {
      Response response = await dio.get('/trending/tv/day');
      if (response.statusCode == 200) {
        var jsonResponse = json.encode(response.data);
        return seriesPopularFromJson(jsonResponse);
      }
    } catch (e) {
      print('an error occured in getpopularseries : $e');
    }
    return null;
  }

  Future<SeriesTrending?> getSeriesTrending() async {
    try {
      Response response = await dio.get('/tv/popular');
      if (response.statusCode == 200) {
        var jsonResponse = json.encode(response.data);
        return seriesTrendingFromJson(jsonResponse);
      }
    } catch (e) {
      print('an error occured in getseriestrending : $e');
    }
    return null;
  }

  Future<Seriestoprated?> getTopRated() async {
    try {
      Response response = await dio.get('/tv/on_the_air');
      if (response.statusCode == 200) {
        var jsonResponse = json.encode(response.data);
        return seriestopratedFromJson(jsonResponse);
      }
    } catch (e) {
      print('An error occure in seriestoprated :$e');
      rethrow;
    }
    return null;
  }
}

final apiProvider = Provider<ApiServices>((ref) {
  return ApiServices();
});
