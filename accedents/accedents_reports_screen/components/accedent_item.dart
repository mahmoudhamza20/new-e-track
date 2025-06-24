import 'package:etrack/components/custom_network_image.dart';
import 'package:etrack/routes/routes.dart';
import 'package:etrack/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccedentItem extends StatelessWidget {
  const AccedentItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ScreenNames.accedentsDetailsScreen,
        );
        // goToScreen(
        //     screenNames: ScreenNames.accedentsDetailsScreen,
        //     arguments: accedentModel);
      },
      child: Card(
        shadowColor: Colors.grey,
        color: Colors.white,
        surfaceTintColor: Colors.white,
        clipBehavior: Clip.antiAlias,
        elevation: 3,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(10.sp),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                // formatDateAsTimeAndDate(accedentModel.created.toString()),
                '2025/08/11',
                style: TextStyle(
                    color: AppColors.subTitleColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp),
              ),
              Text(
                // accedentModel.reason.toString(),
                'الملاحظة',
                style: TextStyle(
                    color: AppColors.mainTitleColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                    height: 2),
              ),
              Text(
                // accedentModel.description.toString(),
                'إنة في الساعة العاشرة صباحاً نشب حريق بسبب',
                style: TextStyle(
                    color: AppColors.subTitleColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp),
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: 60.h,
                child: ListView(scrollDirection: Axis.horizontal, children: [
                  Container(
                    margin: EdgeInsets.only(left: 5.w, right: 5.w),
                    width: 60.h,
                    height: 60.h,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: AppColors.unselectedColor),
                    child: const CustomNetworkImage(
                      link:
                          'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
                    ),
                  ),
                ]
                    //  accedentModel.incidentAttachments!
                    //     .map((e) => Container(
                    //           margin: EdgeInsets.only(left: 5.w, right: 5.w),
                    //           width: 60.h,
                    //           height: 60.h,
                    //           clipBehavior: Clip.antiAlias,
                    //           decoration: BoxDecoration(
                    //               borderRadius: BorderRadius.circular(10.r),
                    //               color: AppColors.unselectedColor),
                    //           child: e!.attachment!.fullLink!.endsWith('mp4')
                    //               ? DisplayVideoComponents(
                    //                   path: e.attachment!.fullLink.toString(),
                    //                 )
                    //               : CustomNetworkImage(
                    //                   link: e.attachment!.fullLink.toString(),
                    //                 ),
                    //         ))
                    //     .toList(),
                    ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    size: 15.sp,
                    color: AppColors.subTitleColor,
                  ),
                  // if (accedentModel.siteLocation != null)
                  Text(
                    // accedentModel.siteLocation!.name.toString(),
                    'الطابق الاول',
                    style: TextStyle(
                        color: AppColors.subTitleColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                padding: EdgeInsets.all(10.sp),
                decoration: BoxDecoration(
                  color: const Color(0xffF7F7FA),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Row(
                  children: [
                    Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r)),
                      width: 30.w,
                      height: 30.w,
                      child: const CustomNetworkImage(
                        link:
                            'https://images.unsplash.com/photo-1499714608240-22fc6ad53fb2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ابلاغ بواسطة',
                          style: TextStyle(
                              color: AppColors.greyColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp),
                        ),
                        Text(
                          'security Guard name',
                          style: TextStyle(
                              color: AppColors.mainColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
