import 'package:etrack/components/back_button.dart';
import 'package:etrack/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LeaveDetailsScreen extends StatefulWidget {
  const LeaveDetailsScreen({Key? key}) : super(key: key);

  @override
  State<LeaveDetailsScreen> createState() => _LeaveDetailsScreenState();
}

class _LeaveDetailsScreenState extends State<LeaveDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: SizedBox(
          width: 1.sw,
          height: 1.sh,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: .05.sw, right: .05.sw),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const BackButtonCustom(isDark: false),
                        Text(
                          'leave Details',
                          style: TextStyle(
                            color: AppColors.mainTitleColor,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: .05.sw,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Type',
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.mainTitleColor,
                            height: 1.5),
                      ),
                      Text(
                        'مغادرة عادية',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.normal,
                            color: AppColors.subTitleColor,
                            height: 2),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    padding: EdgeInsets.only(
                        top: 5.h, bottom: 5.h, right: 25.w, left: 25.w),
                    decoration: BoxDecoration(
                        // color: Color(int.parse(
                        //     '0xff${leave.approvedStatus!.color!.substring(1)}')),
                        color: AppColors.secondaryColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.r),
                          bottomRight: Radius.circular(10.r),
                        )),
                    child: Text('موافق',
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            height: 2)),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: .05.sw, right: .05.sw),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15.w,
                    ),
                    Text(
                      'reason',
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.mainTitleColor,
                          height: 1.5),
                    ),
                    Text(
                      'لا اشعر بصحة جيدة!!!',
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.normal,
                          color: AppColors.subTitleColor,
                          height: 2),
                    ),
                    SizedBox(
                      height: 15.w,
                    ),
                    Text(
                      'period',
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.mainTitleColor,
                          height: 1.5),
                    ),
                    Text(
                      'طول اليوم',
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.normal,
                          color: AppColors.subTitleColor,
                          height: 2),
                    ),
                    SizedBox(
                      height: 15.w,
                    ),
                    Text(
                      'date',
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.mainTitleColor,
                          height: 1.5),
                    ),
                    SizedBox(
                      height: 15.w,
                    ),
                    Row(
                      children: [
                        Text(
                          // formatDate(leave.requestDate.toString()),
                          '  2025/08/02 ',
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.subTitleColor,
                              height: 1),
                        ),
                        // if (leave.requestEndDate.toString() !=
                        //     '01-01-0001 00:00')
                        //   SizedBox(
                        //     width: 10.w,
                        //   ),
                        // if (leave.requestEndDate.toString() !=
                        //     '01-01-0001 00:00')
                        Text(
                          'to',
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.subTitleColor,
                              height: 1),
                        ),
                        // if (leave.requestEndDate.toString() !=
                        //     '01-01-0001 00:00')
                        //   SizedBox(
                        //     width: 10.w,
                        //   ),
                        // if (leave.requestEndDate.toString() !=
                        //     '01-01-0001 00:00')
                        Text(
                          // formatDate(leave.requestEndDate.toString()),
                          '  2025/08/02',
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.subTitleColor,
                              height: 1),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.w,
                    ),
                    Text(
                      'description',
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.mainTitleColor,
                          height: 1.5),
                    ),
                    Text(
                      'هذا النص هو مثال لنص يمكن أن يستبدل في نفس',
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.normal,
                          color: AppColors.subTitleColor,
                          height: 1.5),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'guard',
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.mainTitleColor,
                          height: 1.5),
                    ),
                    SizedBox(
                      height: 5.w,
                    ),
                    Text(
                      'security Guard name',
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.normal,
                          color: AppColors.subTitleColor,
                          height: 2),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              // if (Data.isSuperVisior! && leave.approvedStatus!.value == '1')
              //   Container(
              //       padding: EdgeInsets.only(left: .05.sw, right: .05.sw),
              //       child: Button(
              //         onPressed: approveLeaveRequest,
              //         textColor: Colors.white,
              //         color: AppColors.mainColor,
              //         text: AppWords.approveLeaveRequest.tr,
              //       )),
              // SizedBox(
              //   height: 5.h,
              // ),
              // if (Data.isSuperVisior! && leave.approvedStatus!.value == '1')
              //   Container(
              //       padding: EdgeInsets.only(left: .15.sw, right: .15.sw),
              //       child: Button(
              //         height: 40.h,
              //         onPressed: rejectLeaveRequest,
              //         textColor: Colors.white,
              //         color: Colors.red,
              //         text: AppWords.rejectLeaveReauest.tr,
              //       ))
            ],
          )),
    );
  }
}
