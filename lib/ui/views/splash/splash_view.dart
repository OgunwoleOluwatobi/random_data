import 'package:liquid_swipe/liquid_swipe.dart' as liquid;
import 'package:random_data/core/utils/exports.dart';
import 'package:random_data/ui/views/transaction_list/transaction_list_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({ Key? key }) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late liquid.LiquidController liquidController;

  @override
  void initState() {
    super.initState();
    liquidController = liquid.LiquidController();
    Future.delayed(Duration(seconds: 2), () {
      liquidController.animateToPage(page: 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: liquid.LiquidSwipe(
        enableLoop: false,
        disableUserGesture: true,
        liquidController: liquidController,
        waveType: liquid.WaveType.circularReveal,
        pages: [
          Material(
            color: BrandColors.purple,
            child: Padding(
              padding: EdgeInsets.only(top: Utils.statusBarPadding, left: 30.2, right: 30.w),
              child: Center(
                child: Text(
                  'Flutter\nTest',
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                    fontSize: 60.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Container(child: const TransactionListView())
        ],
      ),
    );
  }
}