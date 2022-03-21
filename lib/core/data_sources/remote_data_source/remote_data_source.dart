import 'package:dartz/dartz.dart';
import 'package:random_data/core/models/client_transactions.dart';
import 'package:random_data/core/utils/exports.dart';

abstract class RemoteDataSource {
  Future<Either<AppError, List<ClientTransactions>>> fetchTransactions();
}
