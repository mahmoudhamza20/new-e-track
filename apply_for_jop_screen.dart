import 'dart:developer';

import 'package:dotted_border/dotted_border.dart';
import 'package:etrack/components/Text/text_custom.dart';
import 'package:etrack/components/back_button.dart';
import 'package:etrack/components/button/button.dart';
import 'package:etrack/data/user_data.dart';
import 'package:etrack/helper/file_picker_manager.dart';
import 'package:etrack/helper/validation.dart';
import 'package:etrack/model/general_model/look_up.dart';
import 'package:etrack/routes/routes.dart';
import 'package:etrack/screens/shared_components/text_edit_container/text_edit_container.dart';
import 'package:etrack/utility/app_colors.dart';
import 'package:etrack/utility/app_fonts.dart';
import 'package:etrack/utility/image_path.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ApplyForJop extends StatelessWidget {
  ApplyForJop({Key? key}) : super(key: key);

  TextEditingController phone =
      TextEditingController(text: Data.userData!.appUser!.userName);

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  bool isCoverage = false;

  List<LookUp> timeTypeCubitTest = [
    LookUp(id: '1', name: 'Full Time'),
    LookUp(id: '2', name: 'Part Time'),
    LookUp(id: '3', name: 'Freelance'),
  ];

  List<int> attachmentsTest = [];
  GlobalKey<FormState> applyForJopFormKey = GlobalKey();
  String selectedTimeTypeId = '';
  TextEditingController notesController = TextEditingController();

  String? attachmentName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: applyForJopFormKey,
          child: Container(
            margin: EdgeInsets.only(right: .05.sw, left: .05.sw),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    const BackButtonCustom(isDark: false),
                    const Spacer(),
                    TxtN(
                      text: isCoverage
                          ? 'التقديم علي التغطية'
                          : 'تقديم على الوظيفة',
                      fontSize: 20.sp,
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                SizedBox(
                  height: 5.sp,
                ),
                TxtN(
                  text: 'ارسال التفاصيل الخاصة بك',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal,
                  color: AppColors.blackColor,
                ),
                SizedBox(
                  height: 20.sp,
                ),
                SizedBox(
                  height: 50.h,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: timeTypeCubitTest.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.only(
                                top: 5.h, bottom: 5.h, left: 15.w, right: 15.w),
                            margin: EdgeInsets.only(right: 5.w, left: 5.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(200.sp),
                              color: selectedTimeTypeId ==
                                      timeTypeCubitTest[index].id.toString()
                                  ? AppColors.skyColor
                                  : const Color(0xffF5F5F8),
                            ),
                            child: Center(
                              child: Text(
                                timeTypeCubitTest[index].name.toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    color: selectedTimeTypeId ==
                                            timeTypeCubitTest[index]
                                                .id
                                                .toString()
                                        ? Colors.white
                                        : AppColors.subTitleColor,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: AppFonts.mainfont),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  padding:
                      EdgeInsets.only(top: 15.sp, right: 15.sp, left: 15.sp),
                  decoration: BoxDecoration(
                      color: AppColors.mainColor.withOpacity(.04),
                      borderRadius: BorderRadius.circular(15.sp)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TxtN(
                        text: 'رقم الجوال',
                        fontSize: 13.sp,
                        fontWeight: FontWeight.normal,
                        color: AppColors.blackColor,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 5.sp,
                          ),
                          TxtN(
                            text: '98765 43210',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.blackColor,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.sp,
                ),
                MainRichTextField(
                  titleFontSize: 13.sp,
                  controller: notesController,
                  title: 'معلومات اضافية',
                  hintText: " ",
                  inputType: TextInputType.text,
                  labelText: 'معلومات اضافية',
                  textFieldValidType: TextFieldvalidatorType.NormalText,
                ),
                SizedBox(
                  height: 20.sp,
                ),
                attachmentsTest.isEmpty
                    ? GestureDetector(
                        onTap: () {
                          FilePickerManager.pickFile(toDo: (String img64,
                              String imageName, PlatformFile file) {
                            // uploadFile(
                            //     imageName: imageName,
                            //     img64: img64,
                            //     afterUpload: (list) {
                            //       attachmentsTest = list;

                            //     });
                            log('pickFile now');
                          });
                        },
                        child: DottedBorder(
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(12),
                          dashPattern: const [3, 5],
                          strokeWidth: 0.8,
                          color: AppColors.skyColor.withOpacity(0.8),
                          padding: const EdgeInsets.all(0),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                            child: Container(
                              height: 0.20.sh,
                              width: 1.sw,
                              color: AppColors.skyColor.withOpacity(0.15),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      AppImages.uploadCv,
                                      width: 25.w,
                                      color: AppColors.skyColor,
                                    ),
                                    SizedBox(
                                      height: 15.sp,
                                    ),
                                    TxtN(
                                      text: 'رفع السيرة الذاتية',
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.normal,
                                      color: AppColors.skyColor,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    : DottedBorder(
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(12),
                        strokeWidth: 0.8,
                        color: AppColors.skyColor.withOpacity(0.5),
                        padding: const EdgeInsets.all(0),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                          child: Container(
                            height: 0.10.sh,
                            width: 1.sw,
                            color: AppColors.skyColor.withOpacity(0.1),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 10.sp,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color:
                                          AppColors.skyColor.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Padding(
                                      padding: const EdgeInsets.all(4),
                                      child: SvgPicture.asset(
                                        AppImages.document,
                                        width: 15,
                                        color:
                                            AppColors.skyColor.withOpacity(0.9),
                                      )),
                                ),
                                SizedBox(
                                  width: 5.sp,
                                ),
                                SizedBox(
                                  width: .7.sw,
                                  child: TxtN(
                                    text: attachmentName ?? 'تم الرفع',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.normal,
                                    maxLines: 1,
                                    color: AppColors.skyColor,
                                  ),
                                ),
                                const Spacer(),
                                GestureDetector(
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: AppColors.skyColor
                                              .withOpacity(0.2),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(3),
                                        child: Icon(
                                          Icons.close,
                                          size: 15.w,
                                          color: AppColors.skyColor
                                              .withOpacity(0.9),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  height: 20.sp,
                ),
                Button(
                  color: AppColors.mainColor,
                  height: 40.h,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp,
                  onPressed: () {
                    Navigator.pushNamed(context, ScreenNames.applyJopSuccess,
                        arguments: [isCoverage]);
                  },
                  // isCanApply
                  //     ? applyForJob
                  //     : () {
                  //         CustomAlert.showAlertMessage(
                  //             txt: AppWords
                  //                 .ifYouHaveAScheduleForTheSameDateYyouCannotApplyForThisCoverage
                  //                 .tr,
                  //             alertType: '');
                  //       },
                  text: 'ارسال',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
