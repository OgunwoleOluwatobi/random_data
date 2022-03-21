import 'package:random_data/core/models/client_transactions.dart';
import 'package:random_data/core/utils/exports.dart';
import 'package:random_data/ui/widgets/back_wrapper.dart';

class TransactionDetailsView extends StatelessWidget {
  final ClientTransactions transaction;
  
  const TransactionDetailsView({ Key? key, required this.transaction }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackWrapper(
      title: 'Transaction details',
      iconColor: Colors.white,
      titleColor: Colors.white,
      backgroundColor: BrandColors.darkPurple,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 22.w),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 36.h, horizontal: 16.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transaction.comment ?? 'Transaction',
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      fontSize: 14.sp,
                      color: BrandColors.purple,
                    ),
                  ),
                  SizedBox(height: 22.h,),
                  detailsItem(
                    context: context,
                    title: 'Amount',
                    value: Utils.currenyFormat(transaction.currencyCode ?? '', 0).format(transaction.amount)
                  ),
                  SizedBox(height: 30.h,),
                  detailsItem(
                    context: context,
                    title: 'Transaction date',
                    value: DateFormatUtil.format(DateTime.parse(transaction.entryDate ?? ''))
                  ),
                  SizedBox(height: 30.h,),
                  detailsItem(
                    context: context,
                    title: 'Reference',
                    value: '${transaction.transactionId}'
                  ),
                  SizedBox(height: 30.h,),
                  Padding(
                    padding: EdgeInsets.only(right: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Status',
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 14.sp,
                            color: BrandColors.dark70,
                          ),
                        ),
                        SizedBox(width: 15.w,),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              'dot'.svg
                            ),
                            SizedBox(width: 2.w,),
                            Text(
                              'Successful',
                              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                color: BrandColors.green,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget detailsItem({
    required BuildContext context,
    required String title,
    required String value
  }) {
    return Padding(
      padding: EdgeInsets.only(right: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
              fontSize: 14.sp,
              color: BrandColors.dark70,
            ),
          ),
          SizedBox(width: 15.w,),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
              fontSize: 15.sp,
              color: BrandColors.dark3B,
              fontWeight: FontWeight.bold
            ),
          )
        ],
      ),
    );
  }
}