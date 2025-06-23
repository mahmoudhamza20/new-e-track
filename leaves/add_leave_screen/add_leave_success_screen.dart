import 'package:etrack/components/button/button.dart';
import 'package:etrack/utility/app_colors.dart';
import 'package:etrack/utility/app_fonts.dart';
import 'package:etrack/utility/image_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddLeaveSuccessScreen extends StatelessWidget {
  const AddLeaveSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SizedBox(
        width: 1.sw,
        child: Column(
          children: [
            SizedBox(height: .3.sh),
            Image.asset(AppImages.success, width: .3.sw, fit: BoxFit.fitWidth),
            SizedBox(height: 20.h),
            Text(
              'add Leave Success',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: AppFonts.mainfont,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const Spacer(),
            SizedBox(
                width: .85.sw,
                child: Button(
                  fontSize: 14.sp,
                  height: 45.h,
                  color: Colors.white.withOpacity(.2),
                  text: 'ok',
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                )),
            SizedBox(
              height: 40.h,
            )
          ],
        ),
      ),
    );
  }
}
