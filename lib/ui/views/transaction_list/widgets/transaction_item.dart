import 'package:random_data/core/models/client_transactions.dart';
import 'package:random_data/core/utils/exports.dart';

class TransactionItem extends StatelessWidget {
  final ClientTransactions transaction;
  final String title;
  final VoidCallback onTap;
  
  const TransactionItem({ Key? key, required this.transaction, required this.title, required this.onTap }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 13.w),
        decoration: BoxDecoration(
          color: const Color(0xFFFAF9FF),
          borderRadius: BorderRadius.circular(8.r)
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: (transaction.type == 'WITHDRAWAL' ? BrandColors.red : transaction.type == 'DEPOSIT' ? BrandColors.green2 : BrandColors.purple).withOpacity(.1),
              radius: 17.5.r,
              child: SvgPicture.asset(
                (transaction.type == 'WITHDRAWAL' ? 'withdrawal' : transaction.type == 'DEPOSIT' ? 'arrow_down' : 'arrow_up').svg
              ),
            ),
            SizedBox(width: 8.w,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '$title ',
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 13.sp,
                            color: BrandColors.dark3B
                          ),
                        ),
                        TextSpan(
                          text: transaction.type == 'TRANSFER' ? (transaction.comment ?? '').split(' ').last : '',
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 13.sp,
                            color: BrandColors.purple,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ]
                    ),
                  ),
                  SizedBox(height: 8.h,),
                  Text(
                    DateFormatUtil.format(DateTime.parse(transaction.entryDate ?? '')),
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      fontSize: 11.sp,
                      color: BrandColors.dark70
                    ),
                  )
                ],
              ),
            ),
            SizedBox(width: 10.w,),
            Text(
              Utils.currenyFormat(transaction.currencyCode ?? '', 0).format(transaction.amount),
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontSize: 14.sp,
                color: transaction.type == 'DEPOSIT' ? BrandColors.green : BrandColors.red,
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
    );
  }
}