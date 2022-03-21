
import 'package:another_flushbar/flushbar.dart';
import 'package:random_data/core/utils/exports.dart';
import 'package:stacked_services/stacked_services.dart';

/// A Customize flushbar widget to be use across development for quick message.
/// String [message]
/// BuildContext [context]
/// Position argument for the duration, only use when you want longer message time.
/// Duration [sec]
flusher(String message, {int sec = 5, Color? color, String? title, bool network = false, bool info = true, FlusherColorType? type}) {
  return Flushbar(
    flushbarPosition: FlushbarPosition.TOP,
    flushbarStyle: FlushbarStyle.GROUNDED,
    backgroundColor: type == null ? color ?? BrandColors.purple : type == FlusherColorType.success ? Colors.green : Colors.red,
    duration: Duration(seconds: sec),
    title: title ?? null,
    messageText: Text(
      message,
      style: Theme.of(StackedService.navigatorKey!.currentContext!).textTheme.headline5!.copyWith(
        fontSize: 14.sp,
        // fontFamily: 'Roboto',
        color: Colors.white,
        fontWeight: FontWeight.w600
      ),
    ),
    // icon: Icon(
    //   info ? Icons.info_outline : network ? Icons.signal_cellular_connected_no_internet_4_bar_rounded : Icons.storage_rounded,
    //   size: 24.h,
    //   color: BrandColors.primary
    // ),
    leftBarIndicatorColor: type == null ? color ?? BrandColors.purple : type == FlusherColorType.success ? Colors.green : Colors.red,
  ).show(StackedService.navigatorKey!.currentContext!);
}

/// The type of Flusher color to show
enum FlusherColorType { success, error} 