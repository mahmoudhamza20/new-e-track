import 'package:etrack/components/back_button.dart';
import 'package:etrack/components/custom_network_image.dart';
import 'package:etrack/components/generic_bind.dart';
import 'package:etrack/data/user_data.dart';
import 'package:etrack/routes/routes.dart';
import 'package:etrack/screens/user_screens/profile_details_screen/components/detail_item.dart';
import 'package:etrack/screens/user_screens/profile_details_screen/profile_details_data.dart';
import 'package:etrack/utility/app_colors.dart';
import 'package:etrack/utility/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileDetailsScreen extends StatelessWidget {
  const ProfileDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.mainColor,
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: Colors.transparent,
        ),
        body: CustomScrollView(slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Stack(
              children: [
                Column(
                  children: [
                    SizedBox(
                        height: .27.sh,
                        width: 1.sw,
                        child: const Opacity(
                            opacity: .3,
                            child: CustomNetworkImage(
                              link: '',
                            ))),
                    Expanded(
                        child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15.r),
                              topRight: Radius.circular(15.r)),
                          color: Colors.white),
                    ))
                  ],
                ),
                Container(
                  width: 1.sw,
                  padding: EdgeInsets.only(left: .05.sw, right: .05.sw),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15.h,
                      ),
                      const BackButtonCustom(isDark: true),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'ملفي الشخصي',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: AppFonts.mainfont,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 60.h,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          GenericBuilder(
                              builder: (profilePic) {
                                return Data.userData!.photo == null
                                    ? Stack(
                                        children: [
                                          Container(
                                            width: 80.h,
                                            padding: EdgeInsets.all(10.sm),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15.r),
                                              color: AppColors.skyColor,
                                            ),
                                            child: Image.asset(
                                              'assets/images/sec.png',
                                              color: AppColors.mainColor,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 0,
                                            left: 0,
                                            child: GestureDetector(
                                              onTap: () {
                                                //   selectCameraOrGallery();
                                              },
                                              child: Container(
                                                width: 25.h,
                                                height: 25.h,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10.r)),
                                                  color:
                                                      AppColors.secondaryColor,
                                                ),
                                                child: Center(
                                                  child: Icon(Icons.camera_alt,
                                                      color: Colors.white,
                                                      size: 15.sp),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    : Stack(
                                        children: [
                                          Container(
                                              width: 80.h,
                                              height: 80.h,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15.r),
                                                color: AppColors.mainColor,
                                              ),
                                              child: const CustomNetworkImage(
                                                link: '',
                                              )),
                                          Positioned(
                                            bottom: 0,
                                            left: 0,
                                            child: GestureDetector(
                                              onTap: () {
                                                // selectCameraOrGallery();
                                              },
                                              child: Container(
                                                width: 25.h,
                                                height: 25.h,
                                                decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topRight:
                                                              Radius.circular(
                                                                  20),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10)),
                                                  color: AppColors.skyColor,
                                                ),
                                                child: Center(
                                                  child: Icon(Icons.camera_alt,
                                                      color: Colors.white,
                                                      size: 15.sp),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      );
                              },
                              genericCubit: profilePicCubit),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, ScreenNames.editProfileScreen);
                            },
                            child: SvgPicture.asset(
                              'assets/images/edit.svg',
                              width: 25.w,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'خالد فهد',
                        style: TextStyle(
                          color: AppColors.mainTitleColor,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'عميل',
                        style: TextStyle(
                          color: AppColors.subTitleColor,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Divider(
                        thickness: 1.5.h,
                        color: const Color(0xffE6E6EC),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      const DetailItem(
                        title: 'رقم الجوال',
                        detail: '+966 9876543210',
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      const DetailItem(
                        title: 'رقم الهوية الوطنية',
                        detail: '12345678',
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      const DetailItem(
                        title: 'كود الحارس',
                        detail: '1234',
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      const DetailItem(
                          title: 'تاريخ الميلاد', detail: '10/01/1995'
                          // formatDateHijry(Data.userData!.birthDate!),
                          ),
                      SizedBox(
                        height: 15.h,
                      ),
                      const Row(
                        children: [
                          Expanded(
                            child: DetailItem(title: 'النوع', detail: 'ذكر'),
                          ),
                          Expanded(
                            child: DetailItem(
                              title: 'فصيلة الدم',
                              detail: 'A ايجابي',
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      const Row(
                        children: [
                          Expanded(
                            child: DetailItem(
                              title: 'الجنسية',
                              detail: 'السعودية',
                            ),
                          ),
                          Expanded(
                            child: DetailItem(
                              title: 'المدينة',
                              detail: 'الرياض',
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      const Row(
                        children: [
                          Expanded(
                            child: DetailItem(
                              title: 'الوظيفة',
                              detail: 'مراقب أمن',
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ]));
  }
}
