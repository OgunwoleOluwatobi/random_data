import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:random_data/core/utils/exports.dart';
import 'package:random_data/ui/views/splash/splash_view.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:random_data/styles/theme/theme.dart' as _theme;

Future main() async{
  await dotenv.load(fileName: '.env');
  setupLogger();
  await setupLocator();
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: () => MaterialApp(
        title: 'Test',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Routers().onGenerateRoute,
        navigatorKey: StackedService.navigatorKey,
        theme: _theme.lightTheme,
        builder: (context, child) {
          ScreenUtil.setContext(context);
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!,
          );
        },
        home: SplashView()
      ),
    );
  }
}