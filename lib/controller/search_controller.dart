import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie/models/search_model.dart';

class CategoryController extends StateNotifier<List<Categories>> {
  CategoryController() : super([]) {
    state = [
      Categories(buttonName: 'Movies'),
      Categories(buttonName: 'Genres'),
      Categories(buttonName: 'Series'),
      Categories(buttonName: 'korean Dramas'),
      Categories(buttonName: "countries"),
      Categories(buttonName: 'critiques')
    ];
  }
}

final categoryProvider =
    StateNotifierProvider<CategoryController, List<Categories>>((ref) {
  return CategoryController();
});
