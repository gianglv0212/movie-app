class ListImageMovie {
  String? imageUrl;
  String? nameMovie;
  String? nameicon;

  ListImageMovie([this.imageUrl, this.nameMovie, this.nameicon]);
}

List<ListImageMovie> listimage = [
  ListImageMovie('https://statics.vincom.com.vn/xu-huong/the-marvel-2023.jpg',
      'Captain Marvel', 'IMBd 8,5'),
  ListImageMovie(
      'https://toquoc.mediacdn.vn/280518851207290880/2023/2/20/800417-1676867192131686197924.jpg',
      'QuanTuMania',
      'IMBd 8,5'),
  ListImageMovie(
      'https://baodongnai.com.vn/dataimages/202205/original/images2451041_18e.jpg',
      'Doctor Strange',
      'IMBd 8,5'),
  ListImageMovie(
      'https://vtv1.mediacdn.vn/thumb_w/640/562122370168008704/2023/4/10/100423-ant-man-16811148589681138415771.jpg',
      'ant man',
      'IMBd 8,5'),
];

class ListCategory {
  String? imageCategory;
  String? nameCategory;

  ListCategory(this.imageCategory, this.nameCategory);
}

List<ListCategory> category = [
  ListCategory('assets/icon/Vector.png', 'Genres'),
  ListCategory('assets/icon/tv series icon.png', 'TV Series'),
  ListCategory('assets/icon/Movie Roll.png', 'Movie'),
  ListCategory('assets/icon/Cinema.png', 'In Theatre')
];

class Performer {
  String? imagePerformer;
  String? namePerformer;
  String? movieActorName;

  Performer(this.imagePerformer, this.namePerformer, this.movieActorName);
}

List<Performer> performer = [
  Performer('assets/icon/chris.png', 'Chris Hemsworth', 'Thor'),
  Performer('assets/icon/portman.png', 'Natalie Portman', 'Jane Foster'),
  Performer('assets/icon/loki.png', 'Tom Hidd leston', 'Loki'),
  Performer('assets/icon/dennings.png', 'Kat Dennings', 'Darcy Lewis'),
  Performer('assets/icon/odin.png', 'Anthony Hopkins', 'Odin')
];

class ImageBottomBar {
  String? imageBottom;
  String? imageCircle;

  ImageBottomBar(this.imageBottom, this.imageCircle);
}

List<ImageBottomBar> image = [
  ImageBottomBar(
      'assets/iconnavigator/home.png', 'assets/iconnavigator/ellipse.png'),
  ImageBottomBar(
      'assets/iconnavigator/Favorite.png', 'assets/iconnavigator/ellipse.png'),
  ImageBottomBar(
      'assets/iconnavigator/ticket.png', 'assets/iconnavigator/ellipse.png'),
  ImageBottomBar(
      'assets/iconnavigator/accout.png', 'assets/iconnavigator/ellipse.png'),
  ImageBottomBar(
      'assets/iconnavigator/shuffle.png', 'assets/iconnavigator/ellipse.png'),
];
