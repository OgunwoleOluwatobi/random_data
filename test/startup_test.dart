
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:random_data/core/data_sources/remote_data_source/remote_data_source.dart';
import 'package:random_data/core/models/client_transactions.dart';
import 'package:random_data/core/models/transactions.dart';
import 'package:random_data/core/utils/exports.dart';

import 'startup_test.mocks.dart';

@GenerateMocks([RemoteDataSource, Transactions, ClientTransactions])
void main() {
  test('Setup is working', () async{
    TestWidgetsFlutterBinding.ensureInitialized();

    locator.allowReassignment = true;
    setupLogger(test: true);

    locator.registerLazySingleton<RemoteDataSource>(() => MockRemoteDataSource());

    await setupLocator(test: true);

    await locator.allReady();
  });
}