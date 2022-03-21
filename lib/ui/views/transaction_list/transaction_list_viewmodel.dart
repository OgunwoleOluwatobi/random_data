import 'package:random_data/core/data_sources/remote_data_source/remote_data_source.dart';
import 'package:random_data/core/models/client_transactions.dart';
import 'package:random_data/core/utils/exports.dart';
import 'package:stacked_services/stacked_services.dart';

const String transactionsKey = 'transactions-key';
class TransactionListViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final RemoteDataSource _remoteDataSource = locator<RemoteDataSource>();

  List<ClientTransactions>? transactions;

  Future init() async{
    Future.delayed(
      Duration(seconds: 3),
      () async{
        await runBusyFuture(fetchTransactions(), busyObject: transactionsKey);
      }
    );
  }

  Future fetchTransactions() async{
    final data = await _remoteDataSource.fetchTransactions();

    data.fold(
      (l) {
        flusher(l.message, type: FlusherColorType.error);
      },
      (r) async{
        transactions = r;
        notifyListeners();
      }
    );
  }

  void navigateToDetails(ClientTransactions val) {
    _navigationService.navigateTo(
      Routes.transactionDetails,
      arguments: val
    );
  }
}