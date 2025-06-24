import 'package:etrack/components/back_button.dart';
import 'package:etrack/components/button/button.dart';
import 'package:etrack/helper/validation.dart';
import 'package:etrack/screens/auth/complete_signup_screen/components/main_text_field.dart';
import 'package:etrack/screens/shared_components/text_edit_container/text_edit_container.dart';
import 'package:etrack/screens/user_screens/accedents/add_accedent_report_screen/components/filter_item_option.dart';
import 'package:etrack/screens/user_screens/accedents/add_accedent_report_screen/components/uploadImage.dart';
import 'package:etrack/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddAccedentReportScreen extends StatefulWidget {
  const AddAccedentReportScreen({Key? key}) : super(key: key);

  @override
  State<AddAccedentReportScreen> createState() =>
      _AddAccedentReportScreenState();
}

class _AddAccedentReportScreenState extends State<AddAccedentReportScreen> {
  TextEditingController otherIssueController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController actionController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool showOtherIssue = false;
  int selectedAccidentTypeIndex = 0;
  String? selectedPeriod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Container(
        margin: EdgeInsets.only(left: .05.sw, right: .05.sw),
        height: 10.sh,
        width: 1.sw,
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const BackButtonCustom(isDark: false),
                    Text(
                      'Add Accident',
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: AppColors.mainTitleColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),

                SizedBox(height: 5.h),
                SizedBox(
                  height: 50.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final accidentTypes = [
                        'Minor Injury',
                        'Major Injury',
                        'Property Damage',
                        'Near Miss'
                      ];
                      return Container(
                        margin: EdgeInsets.only(right: 10.w),
                        child: FilterItemOption(
                          title: accidentTypes[index],
                          onSelect: () {
                            setState(() {
                              selectedAccidentTypeIndex = index;
                              showOtherIssue = false;
                            });
                          },
                          isSelected: selectedAccidentTypeIndex == index,
                        ),
                      );
                    },
                    itemCount: 4,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      showOtherIssue = true;
                      selectedAccidentTypeIndex = -1;
                    });
                  },
                  child: Text(
                    'Other Issue',
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: AppColors.secondaryColor,
                    ),
                  ),
                ),
                if (showOtherIssue)
                  Column(
                    children: [
                      MainTextField(
                        controller: otherIssueController,
                        inputType: TextInputType.text,
                        labelText: 'Issue Type',
                        hintText: '',
                        isDisable: false,
                        obscureText: false,
                        title: 'Issue Type',
                        titleColor: AppColors.subTitleColor,
                        titleFontSize: 13.sp,
                        textFieldValidType: TextFieldvalidatorType.FirstVisit,
                      ),
                      SizedBox(height: 15.h),
                    ],
                  ),
                // Location Selection (Static UI)
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'location',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(200.r),
                      borderSide: BorderSide(color: AppColors.borderColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(200.r),
                      borderSide: BorderSide(color: AppColors.borderColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(200.r),
                      borderSide: BorderSide(color: AppColors.mainColor),
                    ),
                    contentPadding: EdgeInsets.all(12.w),
                  ),
                  value: selectedPeriod,
                  hint: Text(
                    'Select location',
                    style: TextStyle(fontSize: 14.sp),
                  ),
                  items: const [
                    DropdownMenuItem(
                      value: 'dammam',
                      child: Text('الدامام'),
                    ),
                    DropdownMenuItem(
                      value: 'riyadh',
                      child: Text('الرياض'),
                    ),
                  ],
                  onChanged: (String? value) {
                    setState(() {
                      selectedPeriod = value;
                    });
                  },
                ),
                SizedBox(height: 15.h),
                MainRichTextField(
                  controller: descController,
                  inputType: TextInputType.text,
                  labelText: 'Description',
                  hintText: '',
                  title: 'Description',
                  textFieldValidType: TextFieldvalidatorType.FirstVisit,
                  titleFontSize: 13.sp,
                ),
                SizedBox(height: 15.h),
                MainTextField(
                  controller: actionController,
                  inputType: TextInputType.text,
                  labelText: 'Action Taken',
                  hintText: '',
                  isDisable: false,
                  obscureText: false,
                  title: 'Action Taken',
                  titleColor: AppColors.subTitleColor,
                  titleFontSize: 13.sp,
                  textFieldValidType: TextFieldvalidatorType.FirstVisit,
                ),
                SizedBox(height: 15.h),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    // Static image container (you can replace with actual images)
                    SizedBox(
                      height: 70.h,
                      width: 120.w,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Center(
                          child: Text(
                            'No images',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: UploadImage(
                        isfromGallery: false,
                        afterUpload: (String img64, file) async {},
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25.h),
                Button(
                  onPressed: () {},
                  color: AppColors.mainColor,
                  height: 45.h,
                  fontWeight: FontWeight.bold,
                  text: 'send',
                  fontSize: 15.sp,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'cancel',
                        style: TextStyle(
                          color: AppColors.subTitleColor,
                          fontSize: 13.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
