import 'package:etrack/routes/routes.dart';
import 'package:etrack/screens/user_screens/my_profile/components/card_item.dart';
import 'package:etrack/screens/user_screens/my_profile/my_profile_data.dart';
import 'package:etrack/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingCard extends StatelessWidget with MyProfileData {
  const SettingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xffF7F7FA),
      surfaceTintColor: const Color(0xffF7F7FA),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      child: Container(
        width: 10.sw,
        padding: EdgeInsets.all(25.sm),
        decoration: BoxDecoration(
          color: const Color(0xffF7F7FA),
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: const Color(0xff164D73), width: .3.w),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'الإعدادات',
              style: TextStyle(color: AppColors.blackColor, fontSize: 13.sp),
            ),
            SizedBox(
              height: 15.h,
            ),
            CardItem(
              image: 'assets/images/lang_color.svg',
              title: 'اللغة',
              showHint: true,
              action: () {
                Navigator.pushNamed(context, ScreenNames.languageScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}
