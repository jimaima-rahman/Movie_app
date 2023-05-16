import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie/models/Movie_model.dart';

class NotifierController extends StateNotifier<List<MoViModel>> {
  NotifierController() : super([]) {
    state = [
      MoViModel(
        image: 'assets/images/venom.jpg',
        name: 'Venom',
        describtion:
            'While trying to take down Carlton, the CEO of Life Foundation, Eddie, a journalist, investigates experiments of human trials. Unwittingly, he gets merged with a symbiotic alien with lethal abilities.',
      ),
      MoViModel(
        image: 'assets/images/pathaan.jpeg',
        name: 'Pathaan',
        describtion:
            'An Indian spy battles against the leader of a gang of mercenaries who have a heinous plot for his homeland.',
      ),
      MoViModel(
        image: 'assets/images/spiderman.jpeg',
        name: 'Spider Man',
        describtion:
            'Spider-Man is a superhero appearing in American comic books published by Marvel Comics. Created by writer-editor Stan Lee and artist Steve Ditko, he first appeared in the anthology comic book Amazing Fantasy #15 in the Silver Age of Comic Books.',
      )
    ];
  }
}

final recommentedProvider =
    StateNotifierProvider<NotifierController, List<MoViModel>>((ref) {
  return NotifierController();
});

class AlsoLikeMvieContoller extends StateNotifier<List<AlsoLiked>> {
  AlsoLikeMvieContoller() : super([]) {
    state = [
      AlsoLiked(
          name: 'Da vinci code',
          image: 'assets/images/davinci.jpeg',
          type: 'Mystery/Thriller'),
      AlsoLiked(
          name: 'Kilometers and Kilometers',
          image: 'assets/images/kilometer.jpeg',
          type: 'Adventure/Drama '),
      AlsoLiked(
          name: 'Enola Holmes',
          image: 'assets/images/enola.jpeg',
          type: 'Mystery/Crime'),
      AlsoLiked(
          name: 'Jab hari met sejal',
          image: 'assets/images/harimet.jpeg',
          type: 'Rom-com/Comedy drama'),
    ];
  }
}

class MoreMovieController extends StateNotifier<List<MoreMovies>> {
  MoreMovieController() : super([]) {
    state = [
      MoreMovies(image: 'assets/images/adams.jpeg', name: 'The Adam Project'),
      MoreMovies(image: 'assets/images/agamaly.jpeg', name: 'Angamaly Diaries'),
      MoreMovies(image: 'assets/images/fitoor.jpeg', name: 'Fitoor'),
      MoreMovies(
          image: 'assets/images/huntsman.jpeg',
          name: 'The Huntsman: Winter\'s War'),
    ];
  }
}
