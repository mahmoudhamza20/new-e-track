import 'package:etrack/components/back_button.dart';
import 'package:etrack/utility/app_colors.dart';
import 'package:etrack/utility/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KnowUsScreen extends StatelessWidget {
  const KnowUsScreen({Key? key}) : super(key: key);

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
                    'تعرف علينا',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                        color: AppColors.blackColor),
                  ),
                ],
              ),
              SizedBox(
                height: 25.h,
              ),
              Text(
                'منصة تأكيد رواد في التطبيقات الذكية منصة تأكيد تتبع شركة وطنية نشأت من قبل كوادر وخبرات ورواد محليين وعالميين وفقاً لأعلى المعايير المهنية، وتأتي منصة تأكيد الإلكترونية لتكون حلقة الوصل مع المنشآت سواء كانت تجارية أو خدمية، والأفراد وذلك لتلبية جميع احتياجاتهم عبر الخدمات الإلكترونية بسهولة ويسر، وتعد منصة تأكيد مصدراً لكل من يبحث عن كافة الخدمات التي تتعلق بقطاع الحراسات .الأمنية الخاصة والدعم اللوجستي',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                    height: 1.5,
                    fontFamily: AppFonts.mainfont),
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                width: .9.sw,
                child: Text(
                  "الرؤية والرسالة",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      height: 1.5,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                      color: AppColors.blackColor),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                elevation: 2,
                clipBehavior: Clip.antiAlias,
                child: Container(
                  padding: EdgeInsets.all(10.sp),
                  color: AppColors.unselectedColor,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 60.w,
                        height: 60.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: AppColors.roseColor.withOpacity(.2)),
                        child: Icon(Icons.remove_red_eye,
                            size: 40.h, color: AppColors.roseColor),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 4.h),
                                child: const CircleAvatar(
                                  radius: 3,
                                  backgroundColor: AppColors.roseColor,
                                ),
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              SizedBox(
                                width: .6.sw,
                                child: Text(
                                  'أن نكون الخيار الأول للمنشآت سواءً التجارية منها أو الخدمية وكذلك الأفراد.',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      height: 1.3,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11.sp,
                                      color: AppColors.blackColor),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.w,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 4.h),
                                child: const CircleAvatar(
                                  radius: 3,
                                  backgroundColor: AppColors.roseColor,
                                ),
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              SizedBox(
                                width: .6.sw,
                                child: Text(
                                  'تضع المنصة العميل في قلب الحدث.',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      height: 1.3,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11.sp,
                                      color: AppColors.blackColor),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.w,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 4.h),
                                child: const CircleAvatar(
                                  radius: 3,
                                  backgroundColor: AppColors.roseColor,
                                ),
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              SizedBox(
                                width: .6.sw,
                                child: Text(
                                  'نعمل على تطوير المنتجات التي تلبي احتياجات العمل.',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      height: 1.3,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11.sp,
                                      color: AppColors.blackColor),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.w,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 4.h),
                                child: const CircleAvatar(
                                  radius: 3,
                                  backgroundColor: AppColors.roseColor,
                                ),
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              SizedBox(
                                width: .6.sw,
                                child: Text(
                                  'أن نساهم في تحقيق التكامل الاجتماعي والاقتصادي.',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      height: 1.3,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11.sp,
                                      color: AppColors.blackColor),
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                elevation: 2,
                clipBehavior: Clip.antiAlias,
                child: Container(
                  padding: EdgeInsets.all(10.sp),
                  color: AppColors.unselectedColor,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 60.w,
                        height: 60.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: AppColors.roseColor.withOpacity(.2)),
                        child: Icon(Icons.flag_circle,
                            size: 40.h, color: AppColors.roseColor),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 4.h),
                                child: const CircleAvatar(
                                  radius: 3,
                                  backgroundColor: AppColors.roseColor,
                                ),
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              SizedBox(
                                width: .6.sw,
                                child: Text(
                                  'أن نلتزم بمعايير فنية عالية الجودة، ونقدم خدمات رقمية قيمة ذات مصداقية وأمانة وفق منظومة رقمية في منصة تأكيد تعطي نتائج واقعية',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      height: 1.3,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11.sp,
                                      color: AppColors.blackColor),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
