import 'package:etrack/components/back_button.dart';
import 'package:etrack/routes/routes.dart';
import 'package:etrack/utility/app_colors.dart';
import 'package:etrack/utility/app_fonts.dart';
import 'package:etrack/utility/image_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Container(
        margin: EdgeInsets.all(20.sm),
        width: 1.sw,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const BackButtonCustom(isDark: false),
                Text(
                  'عن التطبيق',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                    color: AppColors.blackColor,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25.h,
            ),
            SizedBox(
              height: 25.h,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, ScreenNames.knowUsScreen);
              },
              child: Row(
                children: [
                  Container(
                      padding: EdgeInsets.all(10.sm),
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(.2),
                          borderRadius: BorderRadius.circular(10.r)),
                      child: SvgPicture.asset(
                        'assets/images/contact.svg',
                        width: 15.w,
                        color: AppColors.mainColor,
                      )),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    'تعرف علينا ',
                    style: TextStyle(
                      fontFamily: AppFonts.mainfont,
                      fontSize: 14.sp,
                      color: const Color(0xff12123C),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            const Divider(
              thickness: 1,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, ScreenNames.termsScreen);
              },
              child: Row(
                children: [
                  Container(
                      padding: EdgeInsets.all(10.sm),
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(.2),
                          borderRadius: BorderRadius.circular(10.r)),
                      child: SvgPicture.asset(
                        AppImages.terms,
                        color: AppColors.boldMainColor,
                        width: 15.w,
                      )),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    'الشروط والأحكام',
                    style: TextStyle(
                      fontFamily: AppFonts.mainfont,
                      color: const Color(0xff12123C),
                      fontSize: 14.sp,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            const Divider(
              thickness: 1,
            ),
            SizedBox(
              height: 10.h,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, ScreenNames.policiesScreen);
              },
              child: Row(
                children: [
                  Container(
                      padding: EdgeInsets.all(10.sm),
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(.2),
                          borderRadius: BorderRadius.circular(10.r)),
                      child: SvgPicture.asset(
                        AppImages.policies,
                        color: AppColors.boldMainColor,
                        width: 15.w,
                      )),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    'سياسة خاصة',
                    style: TextStyle(
                      fontFamily: AppFonts.mainfont,
                      fontSize: 14.sp,
                      color: const Color(0xff12123C),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            const Divider(
              thickness: 1,
            ),
            SizedBox(
              height: 10.h,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, ScreenNames.appVersionScreen);
              },
              child: Row(
                children: [
                  Container(
                      padding: EdgeInsets.all(10.sm),
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(.2),
                          borderRadius: BorderRadius.circular(10.r)),
                      child: Image.asset(
                        AppImages.splashLogo,
                        width: 16.w,
                      )),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    'إصدار التطبيق',
                    style: TextStyle(
                      fontFamily: AppFonts.mainfont,
                      color: AppColors.mainTitleColor,
                      fontSize: 14.sp,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'الإصدار 14.4',
                    style: TextStyle(
                      fontFamily: AppFonts.mainfont,
                      fontSize: 12.sp,
                      color: AppColors.subTitleColor,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}
