import 'package:etrack/model/leave/get_all_leaves.dart';
import 'package:etrack/routes/routes.dart';
import 'package:etrack/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LeavesItem extends StatelessWidget {
  const LeavesItem({Key? key, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
         Navigator.pushNamed(context, ScreenNames.leaveDetailsScreen);
        // goToScreen(
        //     screenNames: ScreenNames.leaveDetailsScreen,
        //     arguments: getAllLeavesModel);
      },
      child: Card(
        color: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 2,
        shadowColor: Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Container(
          padding: EdgeInsets.only(bottom: 15.h, top: 15.h),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.r)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 15.w,
                  ),
                  Text(
                    'نصف يوم',
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.normal,
                        color: AppColors.subTitleColor,
                        height: 1),
                  ),
                  const Spacer(),
                  Container(
                    padding: EdgeInsets.only(
                        top: 7.h, bottom: 7.h, right: 25.w, left: 25.w),
                    decoration: BoxDecoration(
                        // color: Color(
                        //   int.parse(
                        //     '0xff${getAllLeavesModel.approvedStatus!.color!.substring(1)}')),
                        color: AppColors.secondaryColor,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.r),
                            bottomRight: Radius.circular(10.r))),
                    child: Text('انتظار',
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            height: 1)),
                  )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                margin: EdgeInsets.only(left: 15.w, right: 15.w),
                width: .78.sw,
                child: Row(
                  children: [
                    Text(
                      // formatDate(getAllLeavesModel.requestDate.toString()),

                      '2025/08/11 ',
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.mainTitleColor,
                          height: 1),
                    ),
                    // if (getAllLeavesModel.requestEndDate.toString() !=
                    //     '01-01-0001 00:00')
                    //   SizedBox(
                    //     width: 10.w,
                    //   ),
                    // if (getAllLeavesModel.requestEndDate.toString() !=
                    //     '01-01-0001 00:00')
                    Text(
                      'to',
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.mainTitleColor,
                          height: 1),
                    ),
                    // if (getAllLeavesModel.requestEndDate.toString() !=
                    //     '01-01-0001 00:00')
                    //   SizedBox(
                    //     width: 10.w,
                    //   ),
                    // if (getAllLeavesModel.requestEndDate.toString() !=
                    //     '01-01-0001 00:00')
                    Text(
                      // formatDate(getAllLeavesModel.requestEndDate.toString()),
                      '  2025/08/11 ',
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.mainTitleColor,
                          height: 1),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                margin: EdgeInsets.only(right: 15.w, left: 15.w),
                padding: EdgeInsets.only(
                    top: 7.h, bottom: 5.h, right: 20.w, left: 20.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: AppColors.skyColor.withValues(alpha: .2)
                    // color: Color(int.parse(
                    //         '0xff${getAllLeavesModel.leaveType!.color!.substring(1)}'))
                    //     .withOpacity(.1),
                    ),
                child: Text(
                  'مغادرة عادية',
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal,
                      color: AppColors.skyColor.withValues(alpha: .9),
                      // color: Color(int.parse(
                      //     '0xff${getAllLeavesModel.leaveType!.color!.substring(1)}')),
                      height: 1),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                margin: EdgeInsets.only(left: 15.w, right: 15.w),
                width: .78.sw,
                child: Text(
                  'لا اشعر بصحة جيدة!!!',
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.normal,
                      color: const Color(0xffA2A2B7)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
