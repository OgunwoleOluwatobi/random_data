import 'package:flutter/scheduler.dart';
import 'package:random_data/core/models/client_transactions.dart';
import 'package:random_data/core/utils/exports.dart';
import 'package:random_data/ui/views/transaction_list/transaction_list_viewmodel.dart';
import 'package:random_data/ui/views/transaction_list/widgets/transaction_item.dart';
import 'package:random_data/ui/views/transaction_list/widgets/transaction_item_loader.dart';
import 'package:random_data/ui/widgets/back_wrapper.dart';

class TransactionListView extends StatelessWidget {
  const TransactionListView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TransactionListViewModel>.reactive(
      onModelReady: (model) => SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
        model.init();
      }),
      viewModelBuilder: () => TransactionListViewModel(),
      builder: (context, model, child) => BackWrapper(
        title: 'All Transactions',
        showIcon: false,
        iconColor: BrandColors.dark3B,
        titleColor: BrandColors.purple,
        child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 20.h),
          itemCount: (model.busy(transactionsKey) || model.transactions == null) ? 10 : model.transactions!.length,
          separatorBuilder: (c, i) => SizedBox(height: 15.h,),
          itemBuilder: (c, i) {
            if(model.busy(transactionsKey) || model.transactions == null) {
              return const TransactionItemLoader();
            } else {
              ClientTransactions transaction = model.transactions![i];
              List temp = (transaction.comment ?? '').split(' ');
              temp.removeLast();
              return TransactionItem(
                transaction: transaction,
                title: transaction.type == 'TRANSFER' ? temp.join(' ') : transaction.comment ?? 'Transaction',
                onTap: () => model.navigateToDetails(transaction),
              );
            }
          },
        ),
      ),
    );
  }
}