

class AssetPath {


  static const String _iconBasePath = "assets/icons/";
  static const String _imagesBasePath = "assets/images/";
  static const String _animationBasePath = "assets/animation/";

  static String _iconPath(String fileName) => _iconBasePath + fileName;
  static String _imagesPath(String fileName) => _imagesBasePath + fileName;
  static String _animationPath(String fileName) => _animationBasePath + fileName;




  //TODO: FOR ICONS(SVG FILE)
  static final home = _iconPath("home.svg");
  static final arrowNext = _iconPath("home.svg");



  //TODO: FOR IMAGE(PNG FILE)
  static final homePng = _imagesPath("logo.png");


  //TODO: FOR ANIMATION(JSON FILE)
  static final homeAnimation = _animationPath("logo.png");
}