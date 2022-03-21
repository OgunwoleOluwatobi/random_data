import 'package:random_data/core/utils/exports.dart';
import 'package:stacked_services/stacked_services.dart';

class BackWrapper extends StatelessWidget {
  final String title;
  final Color titleColor;
  final Color iconColor;
  final bool showIcon;
  final Widget child;
  final Color? backgroundColor;

  const BackWrapper({
    Key? key,
    required this.title,
    required this.titleColor,
    required this.iconColor,
    this.showIcon = true,
    required this.child,
    this.backgroundColor,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: Utils.darkWhiteNav,
      child: Material(
        color: backgroundColor ?? Colors.white,
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Container(
            color: Colors.transparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: Utils.statusBarPadding+(showIcon ? 5.h : 30.h), bottom: 10.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      showIcon ? IconButton(
                        padding: EdgeInsets.all(20.h),
                        onPressed: () => locator<NavigationService>().back(),
                        icon: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: iconColor,
                          size: 20.h,
                        ),
                      ) : SizedBox(),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.w),
                        child: Text(
                          title,
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w700,
                            color: titleColor
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    color: Colors.transparent,
                    child: child
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}