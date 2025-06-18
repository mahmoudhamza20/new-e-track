import 'package:etrack/components/drawer_Item.dart';
import 'package:etrack/routes/routes.dart';
import 'package:etrack/utility/all_app_words.dart';
import 'package:etrack/utility/app_colors.dart';
import 'package:etrack/utility/image_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.mainColor,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(right: .05.sw, left: .05.sw, top: .05.sh),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    ZoomDrawer.of(context)?.toggle.call();
                  },
                  child: Container(
                    width: 30.h,
                    height: 30.h,
                    padding: EdgeInsets.all(10.sm),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: AppColors.unselectedColor.withOpacity(.2)),
                    child: Center(
                        child: SvgPicture.asset(
                      'assets/images/cancel.svg',
                      width: 10.w,
                      fit: BoxFit.cover,
                    )),
                  ),
                ),
                SizedBox(height: 50.h),
                Image.asset(
                  AppImages.splashLogo,
                  width: 60.w,
                ),
                SizedBox(height: 50.h),
                DrawerItem(
                    image: 'assets/images/home.svg',
                    title: AppWords.main.tr,
                    action: () {
                      ZoomDrawer.of(context)?.toggle.call();
                    }),
                SizedBox(height: 10.h),
                DrawerItem(
                  title: 'عن التطبيق',
                  action: () {
                    Navigator.pushNamed(context, ScreenNames.aboutUs);
                    ZoomDrawer.of(context)?.toggle.call();
                  },
                  image: 'assets/images/contact.svg', // TODO change icon
                ),
                SizedBox(
                  height: 10.h,
                ),
                DrawerItem(
                    title: 'اللغة',
                    image: 'assets/images/language.svg',
                    action: () {
                      Navigator.pushNamed(context, ScreenNames.languageScreen);
                    }),
                SizedBox(height: .4.sh),
                Material(
                  color: Colors.transparent,
                  child: Text(
                    'الإصدار 14.4',
                    style: TextStyle(
                        fontSize: 14.sp, color: const Color(0xffE8E8E8)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
