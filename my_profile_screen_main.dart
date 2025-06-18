import 'dart:math' as math;
import 'dart:math';

import 'package:etrack/components/bottom_nav_bar.dart';
import 'package:etrack/data/user_data.dart';
import 'package:etrack/screens/id_not_working_page/components/bottom_nav_not_working.dart';
import 'package:etrack/screens/user_screens/my_profile/components/others_card.dart';
import 'package:etrack/screens/user_screens/my_profile/components/profile_card.dart';
import 'package:etrack/screens/user_screens/my_profile/components/setting_card.dart';
import 'package:etrack/utility/app_fonts.dart';
import 'package:etrack/utility/app_setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class MyProfileScreenMain extends StatelessWidget {
  const MyProfileScreenMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff0C3D64),
        bottomNavigationBar: Data.isSuperVisior == null
            ? const BottomNavNotWorking(currentIndex: 2)
            : const BottomNavBarCutom(currentIndex: 0),
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: Colors.transparent,
        ),
        body: CustomScrollView(slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Stack(
              children: [
                Positioned(
                  top: .2.sh,
                  child: Container(
                    width: 1.sw,
                    height: .8.sh,
                    decoration: BoxDecoration(
                        color: const Color(0xffF7F7FA),
                        borderRadius: BorderRadius.circular(12.r)),
                  ),
                ),
                //getPositioned(),
                Container(
                  padding: EdgeInsets.only(right: .05.sw, left: .05.sw),
                  width: 1.sw,
                  //height: 1.sh,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              ZoomDrawer.of(context)?.toggle.call();
                            },
                            child: Container(
                              height: 30.h,
                              width: 30.h,
                              padding: EdgeInsets.all(7.sm),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: Colors.white.withOpacity(.2)),
                              child:
                                  SvgPicture.asset('assets/images/square.svg'),
                            ),
                          ),
                          const Spacer(),
                          // if(!Data.isLoggedInAttendance)
                          GestureDetector(
                            onTap: () {
                              //deleteAccount;
                            },
                            child: Container(
                              padding: EdgeInsets.all(10.sm),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: Colors.white.withOpacity(.2)),
                              child: Row(
                                children: [
                                  const Text('إزالة الحساب',
                                      style: TextStyle(color: Colors.white)),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Transform(
                                      alignment: Alignment.center,
                                      transform: isArabic
                                          ? Matrix4.rotationX(0)
                                          : Matrix4.rotationY(math.pi),
                                      child: Icon(Icons.delete,
                                          color: Colors.white, size: 18.sp)),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        'حسابي',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      const ProfileCard(),
                      SizedBox(
                        height: 5.h,
                      ),
                      const SettingCard(),
                      SizedBox(
                        height: 5.h,
                      ),
                      const OtherCard(),
                      SizedBox(
                        height: 5.h,
                      ),
                      if (Data.showDeleteButton)
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {
                                // logOut();
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.red),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.r)))),
                              child: Row(
                                children: [
                                  Text(
                                    'تسجيل الخروج',
                                    style: TextStyle(
                                        fontFamily: AppFonts.mainfont,
                                        fontSize: 14.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        height: 3),
                                  ),
                                  const Spacer(),
                                  Transform.rotate(
                                    angle: isArabic ? pi : 0,
                                    child: SvgPicture.asset(
                                      'assets/images/logout.svg',
                                      color: Colors.white,
                                      width: 20.r,
                                    ),
                                  )
                                ],
                              )),
                        ),
                      SizedBox(
                        height: 15.h,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ]));
  }
}
