import 'package:etrack/components/bottom_nav_bar.dart';
import 'package:etrack/model/gid_item_model.dart';
import 'package:etrack/routes/routes.dart';
import 'package:etrack/screens/user_screens/home_screen_worked_guard/components/main_screen_item.dart';
import 'package:etrack/screens/user_screens/user_profile_screen/components/profile_card.dart';
import 'package:etrack/screens/user_screens/user_profile_screen/components/qr_container.dart';
import 'package:etrack/utility/app_colors.dart';
import 'package:etrack/utility/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class UserMainScreen extends StatefulWidget {
  const UserMainScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<UserMainScreen> createState() => _UserMainScreenState();
}

class _UserMainScreenState extends State<UserMainScreen> {
  List<GridItemModel> items = [
    GridItemModel(
        title: 'الجدول',
        icon: 'assets/images/schedule.svg',
        goTo: ScreenNames.myScheduleScreen),
    GridItemModel(
        title: 'عرض الوظائف',
        icon: 'assets/images/jobs.svg',
        goTo: ScreenNames.homeScreen),
    GridItemModel(
        title: 'المغادرات',
        icon: 'assets/images/leaves.svg',
        goTo: ScreenNames.leavesScreen),
    GridItemModel(
        title: 'الملاحظات اليومية',
        icon: 'assets/images/accidents.svg',
        goTo: ScreenNames.accedentsReportsScreen),
    GridItemModel(
        title: 'العقود',
        icon: 'assets/images/contracts.svg',
        goTo: ScreenNames.contractsScreen),
    GridItemModel(
        title: 'جولة في الموقع',
        icon: 'assets/images/directions.svg',
        goTo: ScreenNames.siteTourScreen),
    GridItemModel(
        title: 'الحضور',
        icon: 'assets/images/attendance.svg',
        goTo: ScreenNames.attendanceScreen),
    GridItemModel(
        title: 'المهام',
        icon: 'assets/images/tasks.svg',
        goTo: ScreenNames.tasksScreen),
    GridItemModel(
        title: 'الزوار',
        icon: 'assets/images/visitors.svg',
        goTo: ScreenNames.visitorsScreen),
    GridItemModel(
        title: 'المعدات',
        icon: 'assets/images/guard.svg',
        goTo: ScreenNames.equipmentsScreen),
    GridItemModel(
        title: "طلبات تبديل المناوبة",
        icon: 'assets/images/swap_update.svg',
        goTo: ScreenNames.swapShiftRequestsScreen),
    GridItemModel(
        title: "طلبات الوقت الإضافي",
        icon: 'assets/images/clock.svg',
        goTo: ScreenNames.overTimeScreen),
    // if (Data.isTakidModon)
    GridItemModel(
        title: "تقرير المركبة",
        icon: 'assets/images/car.svg',
        goTo: ScreenNames.vehicleReportScreen),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const BottomNavBarCutom(currentIndex: 2),
        backgroundColor: AppColors.mainColor,
        body: CustomScrollView(slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  height: .68.sh,
                  width: 1.sw,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25.r),
                            topRight: Radius.circular(25.r))),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: .025.sw, right: .025.sw, top: 5.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          ZoomDrawer.of(context)?.toggle.call();
                        },
                        child: Container(
                          padding: EdgeInsets.all(7.sp),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: Colors.white.withOpacity(.1)),
                          child: SvgPicture.asset('assets/images/square.svg',
                              color: Colors.white, height: 20.h),
                        ),
                      ),
                      const ProfileCard(),
                      SizedBox(
                        height: 5.h,
                      ),
                      const QrContainer(),
                      SizedBox(
                        height: 20.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          // Data.isSuperVisior ?? false
                          //     ? goToWithRemoveRoute(
                          //         screenName:
                          //             ScreenNames.supervisiorProfileScreen,
                          //         context: context)
                          //     : goToWithRemoveRoute(
                          //         screenName:
                          //             ScreenNames.homeEmployeedGuardScreen,
                          //         context: context);
                        },
                        child: Container(
                          padding: EdgeInsets.all(8.sm),
                          decoration: BoxDecoration(
                              color: AppColors.mainColor,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(12.r),
                                  topLeft: Radius.circular(12.r))),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                'أبرز الخدمات',
                                style: TextStyle(
                                    fontFamily: AppFonts.mainfont,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    height: 1.5),
                              ),
                              const Spacer(),
                              Text(
                                'عرض الكل',
                                style: TextStyle(
                                    fontFamily: AppFonts.mainfont,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    height: 1.5),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size: 20.sp,
                              )
                            ],
                          ),
                        ),
                      ),
                      Card(
                        elevation: 5,
                        color: Colors.white,
                        surfaceTintColor: Colors.white,
                        margin: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10.r),
                                bottomRight: Radius.circular(10.r))),
                        child: SizedBox(
                          height: .3.sh,
                          width: .95.sw,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: GridView.builder(
                                    itemCount: items.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            crossAxisSpacing: 10.w,
                                            mainAxisSpacing: 5.h),
                                    itemBuilder: (context, index) {
                                      return MainScreenItem(
                                        item: items[index],
                                      );
                                    }),
                              )
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 10.h,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ]));
  }
}
