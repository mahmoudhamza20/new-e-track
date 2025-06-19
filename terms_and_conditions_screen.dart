import 'package:etrack/components/back_button.dart';
import 'package:etrack/utility/app_colors.dart';
import 'package:etrack/utility/app_setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Container(
        margin: EdgeInsets.all(20.sm),
        width: 1.sw,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const BackButtonCustom(isDark: false),
                  Text(
                    'الشروط والأحكام',
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
              Text(
                ' عزيزي مستخدم التطبيق أهلاً بك على منصة تأكيد للحلول عزيزي مستخدم التطبيق أهلاً بك على منصة تأكيد للحلول عزيزي مستخدم التطبيق أهلاً بك على منصة تأكيد للحلول عزيزي مستخدم التطبيق أهلاً بك على منصة تأكيد للحلول',
                style: TextStyle(
                  height: 2,
                  fontWeight: FontWeight.normal,
                  fontSize: 12.sp,
                  color: AppColors.blackColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
