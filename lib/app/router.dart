import 'package:flutter/cupertino.dart';
import 'package:random_data/core/models/client_transactions.dart';
import 'package:random_data/ui/views/splash/splash_view.dart';
import 'package:random_data/ui/views/transaction_list/transaction_details/transaction_details_view.dart';
import '../core/utils/exports.dart';

abstract class Routes {
  static const splash = '/splash';
  static const transactionDetails = '/transactionDetails';
}

class Routers {

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.splash:
        return CupertinoPageRoute<dynamic>(
          builder: (context) => SplashView(),
          settings: settings
        );
      case Routes.transactionDetails:
        return CupertinoPageRoute<dynamic>(
          builder: (context) => TransactionDetailsView(
            transaction: args as ClientTransactions,
          ),
          settings: settings
        );
      default:
        return unknownRoutePage(settings.name!);
    }
  }
}

// borrowed from auto_route:
// returns an error page routes with a helper message.
PageRoute unknownRoutePage(String routeName) => CupertinoPageRoute(
  builder: (ctx) => Scaffold(
    body: Container(
      color: Colors.white,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
            child: Text(
              routeName == "/"
                  ? 'Initial route not found! \n did you forget to annotate your home page with @initial or @MaterialRoute(initial:true)?'
                  : 'Route name $routeName is not found!',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          OutlinedButton.icon(
            label: const Text('Back'),
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(ctx).pop(),
          )
        ],
      ),
    ),
  ),
);