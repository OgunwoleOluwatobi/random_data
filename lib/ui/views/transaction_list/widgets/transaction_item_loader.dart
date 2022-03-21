import 'package:random_data/core/utils/exports.dart';

class TransactionItemLoader extends StatelessWidget {
  const TransactionItemLoader({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 13.w),
      decoration: BoxDecoration(
        color: const Color(0xFFFAF9FF),
        borderRadius: BorderRadius.circular(8.r)
      ),
      child: Shimmer.fromColors(
        period: Duration(milliseconds: 1200),
        baseColor: Colors.grey[200]!,
        highlightColor: BrandColors.darkPurple.withOpacity(.1),
        child: Container(
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 17.5.r,
              ),
              SizedBox(width: 8.w,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 150.w,
                      height: 10.h,
                      decoration: 
                      BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50.r)
                      ),
                    ),
                    SizedBox(height: 8.h,),
                    Container(
                      width: 80.w,
                      height: 8.h,
                      decoration: 
                      BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50.r)
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: 60.w,
                height: 10.h,
                decoration: 
                BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50.r)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}