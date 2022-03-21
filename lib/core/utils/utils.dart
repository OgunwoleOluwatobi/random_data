import 'package:intl/intl.dart';
import 'package:random_data/core/utils/exports.dart';
import 'package:stacked_services/stacked_services.dart';

class Utils{
  static double statusBarPadding = MediaQuery.of(StackedService.navigatorKey!.currentContext!).padding.top;

  static final currencyFormatter2 = NumberFormat.simpleCurrency(name: 'NGN', decimalDigits: 2);
  static final currencyFormatter0 = NumberFormat.simpleCurrency(name: 'NGN', decimalDigits: 0);
  static final normalFormatter = NumberFormat("#,###.##");

  static NumberFormat currenyFormat(String name, [int? decimalDigits]) {
    return NumberFormat.simpleCurrency(name: name, decimalDigits: decimalDigits ?? 2);
  }
  static final SystemUiOverlayStyle darkWhiteNav = Platform.isIOS ? const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.light
  ) : const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark
  );

}