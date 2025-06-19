import 'package:etrack/components/back_button.dart';
import 'package:etrack/screens/about_us/components/question_item.dart';
import 'package:etrack/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({Key? key}) : super(key: key);

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
              children: [
                const BackButtonCustom(isDark: false),
                const Spacer(),
                Text(
                  'الأسئله الشائعه',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackColor,
                    fontSize: 20.sp,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25.h,
            ),
            const QuestionItem(
                title: 'ما هو العائد على الشركات من استخدام منصة تاكيد ؟',
                description:
                    'الربط \n تقوم منصة تأكيد بالربط بين المنشآت الأمنية الخاصة والمنشآت المدنية الراغبة في التعاقد وبين الكوادر الوطنية عبر نظام سحابي آمن وسهل الإستخدام'),
            const QuestionItem(
                title: 'اهمية تأكيد للأفراد ؟',
                description:
                    'تحسين العائد \n يكون من خلال رفع كفاءة الكوادر الوطنية وتحسين بيئة العمل لتكون بيئة منتجة وجاذبة')
          ],
        ),
      ),
    );
  }
}
