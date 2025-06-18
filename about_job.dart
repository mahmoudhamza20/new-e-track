import 'package:etrack/utility/app_colors.dart';
import 'package:etrack/utility/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

class AboutJob extends StatelessWidget {
  const AboutJob({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15.h,
          ),
          Text(
            'وصف الوظيفة',
            style: TextStyle(
                fontSize: 14.sp,
                fontFamily: AppFonts.mainfont,
                color: AppColors.blackColor,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5.h,
          ),
          ReadMoreText(
            'إنَّ طبيعة عمل عامل النظافة ميدانية وقد يعمل في البنايات',
            trimLines: 2,
            trimMode: TrimMode.Length,
            trimCollapsedText: 'المزيد',
            trimExpandedText: 'أقل',
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.blackColor,
            ),
            lessStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black),
            moreStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          SizedBox(
            height: 5.h,
          ),
          Divider(
            thickness: 1.5.sm,
            color: const Color(0xffE6E6EC),
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            'متطلبات الوظيفة',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.blackColor,
            ),
          ),
          ReadMoreText(
            'القدرة على العمل في جميع الظروف الجوية وصحة جسدية',
            trimLines: 2,
            trimMode: TrimMode.Length,
            trimCollapsedText: 'المزيد',
            trimExpandedText: 'أقل',
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.blackColor,
            ),
            lessStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black),
            moreStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              const CircleAvatar(
                radius: 3,
                backgroundColor: AppColors.subTitleColor,
              ),
              SizedBox(
                width: 15.w,
              ),
              Text(
                'الجنس : ',
                style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                ' ذكر',
                style: TextStyle(
                    fontFamily: AppFonts.mainfont,
                    fontSize: 14.sp,
                    color: AppColors.subTitleColor,
                    fontWeight: FontWeight.normal),
              )
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              const CircleAvatar(
                radius: 3,
                backgroundColor: AppColors.subTitleColor,
              ),
              SizedBox(
                width: 15.w,
              ),
              Text(
                'تم نشر الوظيفة  : ',
                style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '2025/08/11',
                style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.subTitleColor,
                    fontWeight: FontWeight.normal),
              )
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              const CircleAvatar(
                radius: 3,
                backgroundColor: AppColors.subTitleColor,
              ),
              SizedBox(
                width: 15.w,
              ),
              Text(
                'الخبرة  : ',
                style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                ' سنتين',
                style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.subTitleColor,
                    fontWeight: FontWeight.normal),
              )
            ],
          )
        ],
      ),
    );
  }
}
