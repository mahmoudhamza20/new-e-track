import 'package:etrack/components/back_button.dart';
import 'package:etrack/routes/routes.dart';
import 'package:etrack/screens/user_screens/leaves/leaves_screen/components/leaves_item.dart';
import 'package:etrack/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'components/leave_count_item.dart';

class LeavesScreen extends StatefulWidget {
  const LeavesScreen({Key? key}) : super(key: key);

  @override
  State<LeavesScreen> createState() => _LeavesScreenState();
}

class _LeavesScreenState extends State<LeavesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: AppColors.mainColor,
      body: SizedBox(
        height: 1.sh,
        width: 1.sw,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SafeArea(
                  child: Container(
                    height: 70.h,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: GestureDetector(
                        onTap: () {},
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 10.w,
                            ),
                            const BackButtonCustom(isDark: true),
                            SizedBox(
                              width: 10.w,
                            ),
                            const Spacer(),
                            Container(
                              padding: EdgeInsets.only(
                                  top: 5.h,
                                  bottom: 5.h,
                                  right: 10.w,
                                  left: 10.w),
                              decoration: BoxDecoration(
                                  color: AppColors.boldMainColor,
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: Row(
                                children: [
                                  SvgPicture.asset('assets/images/company.svg',
                                      color: Colors.white, height: 10.h),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5.w),
                                    child: SizedBox(
                                      width: .4.sw,
                                      child: Text(
                                        'securityCompany!.name',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.sp),
                                      ),
                                    ),
                                  ),
                                  SvgPicture.asset('assets/images/more.svg',
                                      color: Colors.white, height: 5.h),
                                ],
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  ScreenNames.addLeaveScreen,
                                );
                                // goToScreen(
                                //     screenNames: ScreenNames.addLeaveScreen,
                                //     arguments: initData);
                              },
                              child: Container(
                                padding: EdgeInsets.all(7.sp),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: AppColors.skyColor),
                                child: Icon(Icons.add,
                                    color: Colors.white, size: 20.sp),
                              ),
                            ),
                            SizedBox(
                              width: 15.w,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: .025.sw, right: .025.sw),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        'leaves',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        children: [
                          const Expanded(
                              child: LeaveCountItem(
                                  leaveType: LeaveType.normal, count: '3')),
                          SizedBox(
                            width: 10.w,
                          ),
                          const Expanded(
                              child: LeaveCountItem(
                                  leaveType: LeaveType.sick,
                                  backgroundColor: AppColors.skyColor,
                                  count: '4')),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: .05.sw, right: .05.sw),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.r),
                            topRight: Radius.circular(15.r))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          children: [
                            Text(
                              'the Leaves Requests',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.mainTitleColor,
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Expanded(
                            child: ListView.builder(
                                itemCount: 3,
                                itemBuilder: (context, index) {
                                  return const LeavesItem();
                                })),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
