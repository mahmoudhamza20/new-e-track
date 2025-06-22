import 'package:etrack/components/appbar.dart';
import 'package:etrack/components/calendar_custom.dart';
import 'package:etrack/model/scheduling/security_guard_schedule_model.dart';
import 'package:etrack/model/swap_shifts/get_all_my_guards_requests.dart';
import 'package:etrack/screens/user_screens/my_schedule/components/schedule_item.dart';
import 'package:etrack/utility/app_colors.dart';
import 'package:etrack/utility/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class MyScheduleScreen extends StatelessWidget {
  MyScheduleScreen({
    Key? key,
  }) : super(key: key);
  DateTime selectedDate = DateTime.now();
  List<SecurityGuardScheduleModel>? scheduels = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: SizedBox(
        width: 1.sw,
        height: 1.sh,
        child: Stack(
          children: [
            CustomAppBar(isBack: true, showNotification: false),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: .13.sh,
                ),
                Container(
                  padding: EdgeInsets.only(right: .05.sw, left: .05.sw),
                  child: Text(
                    'جدولي',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: AppFonts.mainfont,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                CalendarCustom(
                  selectedDate: selectedDate,
                  isFriday: true,
                  isMonday: true,
                  selectDate: (value) {
                    // No-op in stateless widget
                  },
                  isSaturday: true,
                  isSunday: true,
                  isThursday: true,
                  isTuesday: true,
                  isWednesday: true,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Expanded(
                  child: Container(
                    width: 1.sw,
                    padding: EdgeInsets.only(right: .05.sw, left: .05.sw),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.r),
                            topRight: Radius.circular(15.r))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15.w,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 6.h,
                              width: .25.sw,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: const Color(0xffC4C4D2)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          DateFormat.MMMEd(
                            'ar',
                          ).format(selectedDate),
                          style: TextStyle(
                              color: AppColors.subTitleColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        scheduels != null && scheduels!.isNotEmpty
                            ? Expanded(
                                child: ListView(
                                  padding: EdgeInsets.zero,
                                  children: scheduels!
                                      .map((e) => ScheduelItem(
                                            excuteAfterUpdateSwapShift:
                                                (List<GetAllMyGuardsRequests?>?
                                                    swapRequests) {},
                                            securityGuardScheduleModel: e,
                                            itemDate: selectedDate,
                                          ))
                                      .toList(),
                                ),
                              )
                            : Center(
                                child: Text("لا توجد مناوبات في هذا التاريخ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15.sp)),
                              ),
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
