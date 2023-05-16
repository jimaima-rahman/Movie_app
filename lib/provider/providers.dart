import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie/models/home_models/AlsoLiked.dart';
import 'package:movie/models/series_mode.dart';
import 'package:movie/models/home_models/trending_movie.dart';
import 'package:movie/service/api_services.dart';

import '../controller/home_controller.dart';
import '../controller/series_controller.dart';
import '../models/Movie_model.dart';
import '../models/home_models/popular.dart';
import '../models/series_models/series_popular.dart';
import '../models/series_models/series_top_rated.dart';
import '../models/series_models/series_trending.dart';

//api providers
final apiFutureProvider = FutureProvider<TrendingMovies?>((ref) async {
  return await ref.watch(apiProvider).getTrending();
});

final alsoLikedProvider = FutureProvider<AlsoLikedMovies?>((ref) async {
  return await ref.watch(apiProvider).getLiked();
});

final popularprovider = FutureProvider<PopularMovies?>((ref) async {
  return await ref.watch(apiProvider).getPopular();
});

final seriespopularprovider = FutureProvider<SeriesPopular?>((ref) async {
  return await ref.watch(apiProvider).getPopularSeries();
});

final seriestrendingprovider = FutureProvider<SeriesTrending?>((ref) async {
  return await ref.watch(apiProvider).getSeriesTrending();
});

final Seriestopprovider = FutureProvider<Seriestoprated?>((ref) async {
  return await ref.watch(apiProvider).getTopRated();
});
//upto
final homeCarouselIndexProvider = StateProvider<int>((ref) {
  return 0;
});

final movieProvider = StateProvider<int>((ref) {
  return 0;
});

final indexprovider = StateProvider<PageController>((ref) {
  return PageController();
});

final seriesprovider =
    StateNotifierProvider<SeriesNotifiercontoller, List<SeriesModel>>((ref) {
  return SeriesNotifiercontoller();
});

final trendingNowProvider =
    StateNotifierProvider<TrendingNowController, List<TrendingNowModel>>((ref) {
  return TrendingNowController();
});

final moreprovider =
    StateNotifierProvider<MoreMovieController, List<MoreMovies>>((ref) {
  return MoreMovieController();
});

final likedprovider =
    StateNotifierProvider<AlsoLikeMvieContoller, List<AlsoLiked>>((ref) {
  return AlsoLikeMvieContoller();
});

final koreanProvider =
    StateNotifierProvider<koreanController, List<koreanmodel>>((ref) {
  return koreanController();
});
