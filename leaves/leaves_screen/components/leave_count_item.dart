import 'package:etrack/utility/app_colors.dart';
import 'package:etrack/utility/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum LeaveType { normal, sick }

class LeaveCountItem extends StatelessWidget {
  const LeaveCountItem(
      {Key? key,
      required this.leaveType,
      required this.count,
      this.backgroundColor})
      : super(key: key);
  final LeaveType leaveType;
  final String count;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
          color: backgroundColor ?? Colors.white.withOpacity(.1),
          borderRadius: BorderRadius.circular(7.r)),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10.sp),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.r),
                color: leaveType == LeaveType.normal
                    ? Colors.white
                    : Colors.white),
            child: Column(
              children: [
                Text(
                  int.parse(count) <= 9 ? "0$count" : count,
                  style: TextStyle(
                      color: leaveType == LeaveType.normal
                          ? AppColors.mainColor
                          : AppColors.skyColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 19.sp,
                      height: 1),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 5.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                leaveType == LeaveType.normal ? 'casual' : 'sick',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp,
                    fontFamily: AppFonts.mainfont),
              ),
              SizedBox(
                width: .26.sw,
                child: Text(
                  int.parse(count) <= 9
                      ? "0$count leavesRequests"
                      : '$count leavesRequests',
                  style: TextStyle(
                      color: const Color(0xffE8E8E8),
                      fontWeight: FontWeight.normal,
                      fontSize: 12.sp,
                      fontFamily: AppFonts.mainfont),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
