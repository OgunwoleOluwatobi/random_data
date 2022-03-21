import 'package:random_data/core/utils/exports.dart';

ThemeData lightTheme = ThemeData(
  primarySwatch: createMaterialColor(BrandColors.purple),
  primaryColor: BrandColors.purple,
  brightness: Brightness.light,
  backgroundColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  appBarTheme: AppBarTheme(
    elevation: 0,
    systemOverlayStyle: Utils.darkWhiteNav,
    color: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.black),
  ),
  textTheme: TextTheme(
    headline1: const TextStyle().copyWith(color: BrandColors.dark3B),
    headline2: const TextStyle().copyWith(color: BrandColors.dark3B),
    headline3: const TextStyle().copyWith(color: BrandColors.dark3B),
    headline4: const TextStyle().copyWith(color: BrandColors.dark3B),
    headline5: const TextStyle().copyWith(color: BrandColors.dark3B),
  ),
  primaryTextTheme: TextTheme(
    headline6: TextStyle().copyWith(color: BrandColors.dark3B, fontWeight: FontWeight.w600,)
  ),
  iconTheme: IconThemeData(
    color: Colors.white
  ),
  fontFamily: 'ProductSans',
  dividerColor: Colors.black12,
  cardColor: Colors.white54
);

MaterialColor createMaterialColor(Color color) {
  final List<double> strengths = <double>[.05];
  final Map<int, Color> swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}