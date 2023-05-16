class MoViModel {
  String? image;
  String? name;
  String? describtion;

  MoViModel(
      {required this.image, required this.name, required this.describtion});
}

class AlsoLiked {
  String? image;
  String? name;
  String? type;
  AlsoLiked({required this.image, required this.name, required this.type});
}

class MoreMovies {
  String? image;
  String? name;
  MoreMovies({required this.image, required this.name});
}
