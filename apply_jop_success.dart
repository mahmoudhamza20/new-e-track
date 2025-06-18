import 'package:etrack/components/button/button.dart';
import 'package:etrack/routes/routes.dart';
import 'package:etrack/utility/app_colors.dart';
import 'package:etrack/utility/app_fonts.dart';
import 'package:etrack/utility/image_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApplyJopSuccess extends StatelessWidget {
  ApplyJopSuccess({Key? key}) : super(key: key);

  bool isCoverage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 0,
      ),
      backgroundColor: AppColors.mainColor,
      body: SizedBox(
        width: 1.sw,
        child: Column(
          children: [
            SizedBox(height: .3.sh),
            Image.asset(AppImages.success, width: .2.sw, fit: BoxFit.fitWidth),
            SizedBox(height: 25.h),
            Text(
              isCoverage
                  ? "تم التقدم للتغطية بنجاح"
                  : 'تم التقدم للوظيفة بنجاح',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            SizedBox(
              width: 0.4.sw,
              child: Text(
                "سنقوم باعلامك بالخطوة التالية يرجي الانتظار",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: AppFonts.mainfont,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
                width: .85.sw,
                child: Button(
                  color: Colors.white.withOpacity(.2),
                  text: 'ابحث عن وظائف اخرى',
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        ScreenNames.homeScreen, (route) => false);
                  },
                  fontSize: 14.sp,
                  height: 45.h,
                )),
            SizedBox(
              height: 15.h,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    ScreenNames.userProfileScreen, (route) => false);
              },
              child: Text(
                'اذهب للرئيسية',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
          ],
        ),
      ),
    );
  }
}
