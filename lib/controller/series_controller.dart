import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/series_mode.dart';

class SeriesNotifiercontoller extends StateNotifier<List<SeriesModel>> {
  SeriesNotifiercontoller() : super([]) {
    state = [
      // SeriesModel(,''),
      // SeriesModel(),
      // SeriesModel(),
      // SeriesModel()
      SeriesModel('assets/images/movie_assets/moneyheist.jpg', 'Money Heist'),
      SeriesModel('assets/images/movie_assets/lucifer.jpeg', 'Lucifer'),
      SeriesModel('assets/images/movie_assets/bridgton.jpeg', 'Bridgeton'),
      SeriesModel('assets/images/movie_assets/dark.jpeg', 'Dark')
    ];
  }
}

class TrendingNowController extends StateNotifier<List<TrendingNowModel>> {
  TrendingNowController() : super([]) {
    state = [
      TrendingNowModel('assets/images/movie_assets/wednesday.jpeg'),
      TrendingNowModel('assets/images/movie_assets/narcos.jpeg'),
      TrendingNowModel('assets/images/movie_assets/littlethings.jpeg'),
      TrendingNowModel('assets/images/movie_assets/peaky.jpeg')
    ];
  }
}

class koreanController extends StateNotifier<List<koreanmodel>> {
  koreanController() : super([]) {
    state = [
      koreanmodel('assets/images/movie_assets/k2.jpeg'),
      koreanmodel('assets/images/movie_assets/squid.jpeg'),
      koreanmodel('assets/images/movie_assets/all of us.jpeg'),
      koreanmodel('assets/images/movie_assets/healer.jpeg')
    ];
  }
}
