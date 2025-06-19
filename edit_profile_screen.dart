import 'package:etrack/components/alert_select_item_list.dart';
import 'package:etrack/components/back_button.dart';
import 'package:etrack/components/button/button.dart';
import 'package:etrack/components/custom_items_cubits/selectitems_cubit/selectitems_cubit.dart';
import 'package:etrack/components/custom_style.dart';
import 'package:etrack/components/text/text_custom.dart';
import 'package:etrack/helper/validation.dart';
import 'package:etrack/model/general_model/item.dart';
import 'package:etrack/model/general_model/look_up.dart';
import 'package:etrack/model/job/job_type_model.dart';
import 'package:etrack/screens/auth/complete_signup_screen/components/main_text_field.dart';
import 'package:etrack/utility/all_app_words.dart';
import 'package:etrack/utility/app_colors.dart';
import 'package:etrack/utility/app_setting.dart';
import 'package:etrack/utility/image_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({Key? key}) : super(key: key);
  List<LookUp> city = [];
  List<LookUp> jobType = [];
  List<JobTypeModel> allJobType = [];
  List<LookUp> gender = [];
  List<LookUp> nationality = [];
  List<LookUp> bloodType = [];
  GlobalKey<FormState> validationKey = GlobalKey<FormState>();
  TextEditingController fName = TextEditingController();
  TextEditingController mName = TextEditingController();
  TextEditingController lName = TextEditingController();
  TextEditingController fNameEn = TextEditingController();
  TextEditingController mNameEn = TextEditingController();
  TextEditingController lNameEn = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController guardCode = TextEditingController();
  String date = '';
  SelectitemsCubit jobTypeCubit =
      SelectitemsCubit(errorText: AppWords.required.tr);
  SelectitemsCubit genderCubit =
      SelectitemsCubit(errorText: AppWords.required.tr);
  SelectitemsCubit bloodTypeCubit =
      SelectitemsCubit(errorText: AppWords.required.tr);
  SelectitemsCubit nationalityCubit =
      SelectitemsCubit(errorText: AppWords.required.tr);
  SelectitemsCubit cityCubit =
      SelectitemsCubit(errorText: AppWords.required.tr);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.only(left: .05.sw, right: .05.sw, top: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60.h,
            ),
            Row(
              children: [
                const BackButtonCustom(isDark: false),
                const Spacer(),
                Text('تعديل ملفي الشخصي',
                    style: TextStyle(
                        color: AppColors.blackColor,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700)),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: validationKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Text('معلومات الاسم باللغة العربية',
                          style: TextStyle(
                              color: AppColors.blackColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500)),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: MainTextField(
                              titleFontSize: 12.sp,
                              titleColor: AppColors.subTitleColor,
                              confirmPasswordController: null,
                              firstPasswordToConfirm: null,
                              onTap: () {},
                              controller: fName,
                              title: 'الاسم الاول',
                              hintText: "",
                              inputType: TextInputType.text,
                              isDisable: false,
                              labelText: "*الإسم الاول",
                              textFieldValidType: TextFieldvalidatorType.Name,
                              obscureText: false,
                            ),
                          ),
                          SizedBox(
                            width: 5.sp,
                          ),
                          Expanded(
                            child: MainTextField(
                              titleFontSize: 12.sp,
                              titleColor: AppColors.subTitleColor,
                              confirmPasswordController: null,
                              firstPasswordToConfirm: null,
                              onTap: () {},
                              controller: mName,
                              title: 'الاسم الثاني',
                              hintText: "",
                              inputType: TextInputType.text,
                              isDisable: false,
                              labelText: 'الاسم الثاني',
                              textFieldValidType: TextFieldvalidatorType.Name,
                              obscureText: false,
                            ),
                          ),
                          SizedBox(
                            width: 5.sp,
                          ),
                          Expanded(
                            child: MainTextField(
                              titleFontSize: 12.sp,
                              titleColor: AppColors.subTitleColor,
                              confirmPasswordController: null,
                              firstPasswordToConfirm: null,
                              onTap: () {},
                              controller: lName,
                              title: 'إسم العائلة',
                              hintText: "",
                              inputType: TextInputType.text,
                              isDisable: false,
                              labelText: 'إسم العائلة',
                              textFieldValidType: TextFieldvalidatorType.Name,
                              obscureText: false,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text('معلومات الاسم باللغة الانجليزية',
                          style: TextStyle(
                              color: AppColors.blackColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500)),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: MainTextField(
                              titleFontSize: 12.sp,
                              titleColor: AppColors.subTitleColor,
                              confirmPasswordController: null,
                              firstPasswordToConfirm: null,
                              onTap: () {},
                              controller: fNameEn,
                              title: "*الإسم الاول",
                              hintText: "",
                              inputType: TextInputType.text,
                              isDisable: false,
                              labelText: "*الإسم الاول",
                              textFieldValidType: TextFieldvalidatorType.Name,
                              obscureText: false,
                            ),
                          ),
                          SizedBox(
                            width: 5.sp,
                          ),
                          Expanded(
                            child: MainTextField(
                              titleFontSize: 12.sp,
                              titleColor: AppColors.subTitleColor,
                              confirmPasswordController: null,
                              firstPasswordToConfirm: null,
                              onTap: () {},
                              controller: mNameEn,
                              title: "*الإسم الثاني",
                              hintText: "",
                              inputType: TextInputType.text,
                              isDisable: false,
                              labelText: "*الإسم الثاني",
                              textFieldValidType: TextFieldvalidatorType.Name,
                              obscureText: false,
                            ),
                          ),
                          SizedBox(
                            width: 5.sp,
                          ),
                          Expanded(
                            child: MainTextField(
                              titleFontSize: 12.sp,
                              titleColor: AppColors.subTitleColor,
                              confirmPasswordController: null,
                              firstPasswordToConfirm: null,
                              onTap: () {},
                              controller: lNameEn,
                              title: 'إسم العائلة',
                              hintText: "",
                              inputType: TextInputType.text,
                              isDisable: false,
                              labelText: 'إسم العائلة',
                              textFieldValidType: TextFieldvalidatorType.Name,
                              obscureText: false,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      MainTextField(
                        titleFontSize: 12.sp,
                        titleColor: AppColors.subTitleColor,
                        //  maxLength: 1,
                        onTap: () {},
                        controller: email,
                        title: "*البريد الالكتروني",
                        hintText: "a@example.com",
                        inputType: TextInputType.text,
                        isDisable: false,
                        labelText: "*البريد الالكتروني",
                        textFieldValidType: TextFieldvalidatorType.Email,
                        obscureText: false,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      MainTextField(
                        titleFontSize: 12.sp,
                        titleColor: AppColors.subTitleColor,
                        confirmPasswordController: null,
                        firstPasswordToConfirm: null,
                        onTap: () {},
                        controller: mobileNumberController,
                        title: 'رقم الجوال',
                        hintText: "",
                        inputType: TextInputType.text,
                        isDisable: true,
                        labelText: "رقم الجوال",
                        textFieldValidType: TextFieldvalidatorType.PhoneNumber,
                        obscureText: false,
                      ),
                      // PhoneCodePicker(
                      //     phoneController: phoneController,
                      //     width: double.infinity,
                      //     textAlign: TextAlign.center,
                      //     loading: loading),
                      SizedBox(
                        height: 5.h,
                      ),
                      MainTextField(
                          controller: idController,
                          titleColor: AppColors.subTitleColor,
                          inputType: TextInputType.number,
                          labelText: 'رقم الهوية الوطنية',
                          hintText: '',
                          textFieldValidType: TextFieldvalidatorType.Number,
                          isDisable: true,
                          obscureText: false,
                          title: 'رقم الهوية الوطنية',
                          titleFontSize: 12.sp),
                      SizedBox(
                        height: 5.h,
                      ),
                      MainTextField(
                          controller: guardCode,
                          titleColor: AppColors.subTitleColor,
                          inputType: TextInputType.number,
                          labelText: 'كود الموظف',
                          hintText: '',
                          textFieldValidType: TextFieldvalidatorType.FirstVisit,
                          isDisable: true,
                          obscureText: false,
                          title: 'كود الموظف',
                          titleFontSize: 12.sp),
                      SizedBox(
                        height: 5.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          // pickDateDialog();
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                              top: 15.sp, right: 15.sp, left: 15.sp),
                          width: 1.sw,
                          decoration: BoxDecoration(
                              color: AppColors.unselectedColor,
                              borderRadius: BorderRadius.circular(15.sp)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TxtN(
                                text: 'تاريخ الميلاد',
                                fontSize: 12.sp,
                                color: AppColors.subTitleColor,
                                fontWeight: FontWeight.normal,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: TxtN(
                                      text: 'pickedDate',
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.mainTitleColor,
                                      height: 2,
                                    ),
                                  ),
                                  SvgPicture.asset(
                                    AppImages.calendar,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 5.h,
                              )
                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 5.sp,
                      ),
                      SelectItemList(
                        onTap: (name) {
                          jobTypeCubit.loadData(jobType
                              .map((e) => Item(
                                    key: e.id!,
                                    value: e.name!,
                                  ))
                              .toList());
                          CustomItems.customSelectItems(
                              afterSelectItem: (Item item) {},
                              displayName: name,
                              selectitemsCubit: jobTypeCubit);
                        },
                        name: AppWords.jobTitle.tr,
                        selectitemsCubitTemp: jobTypeCubit,
                      ),
                      SizedBox(
                        height: 5.sp,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: SelectItemList(
                              onTap: (name) {
                                genderCubit.loadData(gender
                                    .map((e) => Item(
                                          key: e.id!,
                                          value: e.name!,
                                        ))
                                    .toList());
                                CustomItems.customSelectItems(
                                    afterSelectItem: (Item item) {
                                      jobType.clear();
                                      for (var element in allJobType) {
                                        jobType.add(LookUp(
                                            id: element.id.toString(),
                                            name: item.key == '1'
                                                ? isArabic
                                                    ? element.name
                                                    : element.nameEn
                                                : isArabic
                                                    ? element.fName
                                                    : element.fNameEn));
                                      }
                                    },
                                    displayName: name,
                                    selectitemsCubit: genderCubit);
                              },
                              name: 'النوع',
                              selectitemsCubitTemp: genderCubit,
                            ),
                          ),
                          SizedBox(
                            width: 5.sp,
                          ),
                          Expanded(
                            child: SelectItemList(
                              onTap: (name) {
                                bloodTypeCubit.loadData(bloodType
                                    .map((e) => Item(
                                          key: e.id!,
                                          value: e.name!,
                                        ))
                                    .toList());
                                CustomItems.customSelectItems(
                                    afterSelectItem: (Item item) {},
                                    displayName: name,
                                    selectitemsCubit: bloodTypeCubit);
                              },
                              name: 'فصيلة الدم',
                              selectitemsCubitTemp: bloodTypeCubit,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.sp,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: SelectItemList(
                              onTap: (name) {
                                cityCubit.loadData(city
                                    .map((e) => Item(
                                          key: e.id!,
                                          value: e.name!,
                                        ))
                                    .toList());
                                CustomItems.customSelectItems(
                                    afterSelectItem: (Item item) {},
                                    displayName: name,
                                    selectitemsCubit: cityCubit);
                              },
                              name: 'المدينة',
                              selectitemsCubitTemp: cityCubit,
                            ),
                          ),
                          SizedBox(
                            width: 5.h,
                          ),
                          Expanded(
                            child: SelectItemList(
                              onTap: (name) {
                                nationalityCubit.loadData(nationality
                                    .map((e) => Item(
                                          key: e.id!,
                                          value: e.name!,
                                        ))
                                    .toList());
                                CustomItems.customSelectItems(
                                    afterSelectItem: (Item item) {},
                                    displayName: name,
                                    selectitemsCubit: nationalityCubit);
                              },
                              name: 'الجنسية',
                              selectitemsCubitTemp: nationalityCubit,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Button(
              fontWeight: FontWeight.bold,
              color: AppColors.mainColor,
              onPressed: () {
                // Call the updateProfile function here
              },
              text: 'تحديث',
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
