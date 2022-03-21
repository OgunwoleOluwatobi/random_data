import 'package:dartz/dartz.dart';
import 'package:random_data/core/data_sources/remote_data_source/remote_data_source.dart';
import 'package:random_data/core/models/client_transactions.dart';
import 'package:random_data/core/models/transactions.dart';
import 'package:random_data/core/utils/exports.dart';

class RemoteDataSourceImpl extends RemoteDataSource {
  final HttpService _httpService = locator<HttpService>();

  @override
  Future<Either<AppError, List<ClientTransactions>>> fetchTransactions() async {

    try {
      final raw = await _httpService.getHttp('/investment/3580016662/transactions');
      if (raw['status'] == 'Successful') {
        Transactions transactions = Transactions.fromJson(raw['data']);
        return Right(transactions.clientTransactions ?? []);
      } else {
        return Left(AppError(
            errorType: AppErrorType.network,
            message: raw['message'] ?? 'An Error Occured'));
      }
    } on NetworkException catch (e) {
      return Left(
          AppError(errorType: AppErrorType.network, message: e.message));
    } on SocketException catch (e) {
      return Left(
          AppError(errorType: AppErrorType.network, message: e.message));
    } on AuthException catch (e) {
      return Left(AppError(errorType: AppErrorType.api, message: e.message));
    } on Exception catch (e) {
      return Left(AppError(errorType: AppErrorType.api, message: '$e'));
    }
  }
}
