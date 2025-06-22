import 'package:cached_network_image/cached_network_image.dart';
import 'package:etrack/components/button/button.dart';
import 'package:etrack/utility/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScheduelItem extends StatelessWidget {
   ScheduelItem({Key? key}) : super(key: key);

  bool isRequestLoading = false;

  bool hasSwapRequest = false;

  bool isSwapped = false;

  // Fake data
  String shiftStartTime = "08:00";

  String shiftEndTime = "16:00";

  String shiftType = "نهاري";

  String companyName = "شركة الأمان للحراسة";

  String companyAddress = "الرياض، المملكة العربية السعودية";

  String companyImageUrl = "https://via.placeholder.com/150";

  String swapStatus = "في انتظار الموافقة";

  Color swapStatusColor = Colors.orange;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      surfaceTintColor: Colors.white,
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
          side: BorderSide(color: Colors.grey.withOpacity(.3))),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: .02.sw,
                  height: 25.h,
                  decoration: BoxDecoration(
                      color: const Color(0xFF2196F3),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5.r),
                          bottomLeft: Radius.circular(5.r))),
                ),
                SizedBox(
                  width: .025.sw,
                ),
                Text(
                  '$shiftStartTime إلى $shiftEndTime',
                  style: TextStyle(
                      color: const Color(0xFF333333),
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      fontFamily: 'Cairo'),
                ),
                const Spacer(),
                if (isSwapped)
                  Container(
                    padding: EdgeInsets.only(left: 10.w, right: 10.w),
                    height: 25.h,
                    decoration: BoxDecoration(
                      color: const Color(0xff0C6B99),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5.r),
                        bottomRight: Radius.circular(5.r),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'تم التبديل',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontFamily: 'Cairo'),
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: .05.sw,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffFCE8EC),
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  padding: EdgeInsets.only(
                      top: 7.h, bottom: 7.h, right: 10.w, left: 10.w),
                  child: Text(shiftType,
                      style: TextStyle(
                          fontSize: 13.sp,
                          color: Colors.red,
                          fontWeight: FontWeight.w500)),
                ),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: .05.sw,
                ),
                Container(
                  width: 40.h,
                  height: 40.h,
                  clipBehavior: Clip.antiAlias,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
                  child: CachedNetworkImage(
                    imageUrl: companyImageUrl,
                    fit: BoxFit.cover,
                    placeholder: (context, index) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) => Container(
                      color: Colors.grey[200],
                      child: const Icon(Icons.business, color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(companyName,
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: const Color(0xFF333333),
                              fontWeight: FontWeight.bold)),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.place,
                            size: 15.sp,
                            color: const Color(0xFF666666),
                          ),
                          Expanded(
                            child: Text(companyAddress,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    height: 1.7,
                                    fontSize: 15.sp,
                                    color: const Color(0xFF666666),
                                    fontWeight: FontWeight.w500)),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            if (!hasSwapRequest && !isSwapped)
              AnimatedContainer(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200.r),
                    color: const Color(0xFF2196F3),
                  ),
                  height: 40.h,
                  width: isRequestLoading ? 40.h : .8.sw,
                  duration: const Duration(milliseconds: 200),
                  margin: EdgeInsets.only(left: .05.sw, right: .05.sw),
                  child: isRequestLoading
                      ? const Center(
                          child: CupertinoActivityIndicator(
                          color: Colors.white,
                          animating: true,
                        ))
                      : ElevatedButton(
                          style: const ButtonStyle(
                              shadowColor:
                                  WidgetStatePropertyAll(Colors.transparent),
                              backgroundColor:
                                  WidgetStatePropertyAll(Colors.transparent)),
                          onPressed: _showSwapDialog (context),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.swap_horiz,
                                  color: Colors.white, size: 20.sp),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                'تبديل المناوبة',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.sp),
                              )
                            ],
                          ),
                        )),
            if (hasSwapRequest && !isSwapped)
              Container(
                margin: EdgeInsets.only(left: .05.sw, right: .05.sw),
                width: double.infinity,
                height: 40.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: const Color(0xFF2196F3).withOpacity(.1)),
                child: Center(
                  child: Text(
                    swapStatus,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: swapStatusColor),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }

  _showSwapDialog( BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.white,
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.r),
                topLeft: Radius.circular(10.r))),
        builder: (context) {
          return Container(
            margin: EdgeInsets.only(right: .05.sw, left: .05.sw),
            width: 1.sw,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 5.h,
                ),
                SizedBox(
                  width: .2.sw,
                  child: const Divider(
                    thickness: 5,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Icon(Icons.swap_horiz, color: Colors.red, size: 30.sp),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'هل أنت متأكد من أنك تريد تبديل هذا المناوبة؟',
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: const Color(0xFF333333),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Button(
                  height: 40.h,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  text: 'نعم',
                  textColor: Colors.white,
                  color: AppColors.mainColor,
                  onPressed: () {},
                ),
                SizedBox(
                  height: 10.h,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'لا',
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: const Color(0xFF666666),
                        fontWeight: FontWeight.normal),
                  ),
                )
              ],
            ),
          );
        });
  }
}
