import 'package:etrack/components/back_button.dart';
import 'package:etrack/components/button/button.dart';
import 'package:etrack/components/pick_date.dart';
import 'package:etrack/helper/validation.dart' show TextFieldvalidatorType;
import 'package:etrack/routes/routes.dart';
import 'package:etrack/screens/auth/complete_signup_screen/components/main_text_field.dart';
import 'package:etrack/screens/shared_components/text_edit_container/text_edit_container.dart';
import 'package:etrack/screens/user_screens/leaves/leaves_screen/components/filter_item_option_set.dart';
import 'package:etrack/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class AddLeaveScreen extends StatefulWidget {
  const AddLeaveScreen({Key? key}) : super(key: key);

  @override
  State<AddLeaveScreen> createState() => _AddLeaveScreenState();
}

class _AddLeaveScreenState extends State<AddLeaveScreen> {
  TextEditingController reasonController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  DateTime? endDate;
  DateTime? startDate;
  DateTime? halfDayDate;
  String? selectedPeriod;
  int selectedLeaveTypeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Container(
        width: 1.sw,
        height: 1.sh,
        padding: EdgeInsets.only(left: .05.sw, right: .05.sw),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const BackButtonCustom(isDark: false),
                    Text(
                      'add Leave',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                        color: AppColors.mainTitleColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25.h),
                SizedBox(
                  height: 60.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final items = [
                        {'id': '1', 'title': 'Annual Leave'},
                        {'id': '2', 'title': 'Sick Leave'},
                      ];
                      return FilterItemOption(
                        title: items[index]['title']!,
                        onSelect: () {
                          setState(() {
                            selectedLeaveTypeIndex = index;
                          });
                        },
                        isSelected: selectedLeaveTypeIndex == index,
                      );
                    },
                    itemCount: 2,
                  ),
                ),
                SizedBox(height: 15.h),
                MainTextField(
                  controller: reasonController,
                  inputType: TextInputType.streetAddress,
                  labelText: 'السبب*',
                  hintText: '',
                  isDisable: false,
                  obscureText: false,
                  title: 'reason',
                  titleFontSize: 15,
                  titleColor: AppColors.subTitleColor,
                  textFieldValidType: TextFieldvalidatorType.FirstVisit,
                ),
                SizedBox(height: 15.h),

                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Period',
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
                    'Select Period',
                    style: TextStyle(fontSize: 14.sp),
                  ),
                  items: const [
                    DropdownMenuItem(
                      value: 'half_day',
                      child: Text('Half Day'),
                    ),
                    DropdownMenuItem(
                      value: 'full_day',
                      child: Text('Full Day'),
                    ),
                  ],
                  onChanged: (String? value) {
                    setState(() {
                      selectedPeriod = value;
                    });
                  },
                ),
                SizedBox(height: 15.h),

                // Date Selection based on period type
                if (selectedPeriod == 'half_day')
                  DatePickerCustom(
                    title: 'Select Date',
                    date: halfDayDate != null
                        ? DateFormat('MM-dd-yyyy').format(halfDayDate!)
                        : '',
                    pickDate: (DateTime dateTime) {
                      setState(() {
                        halfDayDate = dateTime;
                      });
                    },
                  )
                else if (selectedPeriod == 'full_day')
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: DatePickerCustom(
                              title: 'Start Date',
                              date: startDate != null
                                  ? DateFormat('MM-dd-yyyy').format(startDate!)
                                  : '',
                              pickDate: (DateTime dateTime) {
                                if (endDate != null) {
                                  if (dateTime.isBefore(endDate!)) {
                                    setState(() {
                                      startDate = dateTime;
                                    });
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            backgroundColor:
                                                AppColors.secondaryColor,
                                            content: Text(
                                              "please , select date before end date",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )));
                                  }
                                } else {
                                  setState(() {
                                    startDate = dateTime;
                                  });
                                }
                              },
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: DatePickerCustom(
                              title: 'End Date',
                              date: endDate != null
                                  ? DateFormat('MM-dd-yyyy').format(endDate!)
                                  : '',
                              pickDate: (DateTime dateTime) {
                                if (startDate != null) {
                                  if (dateTime.isAfter(startDate!)) {
                                    setState(() {
                                      endDate = dateTime;
                                    });
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            backgroundColor:
                                                AppColors.secondaryColor,
                                            content: Text(
                                              "please , select date after start date",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )));
                                  }
                                } else {
                                  setState(() {
                                    endDate = dateTime;
                                  });
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                SizedBox(height: 10.h),
                MainRichTextField(
                  titleFontSize: 13.sp,
                  controller: descriptionController,
                  title: 'description',
                  hintText: " ",
                  inputType: TextInputType.text,
                  labelText: ' additional Details',
                  textFieldValidType: TextFieldvalidatorType.FirstVisit,
                ),
                SizedBox(height: 15.h),
                Button(
                  onPressed: () {
                    goToScreenpopAndPushNamed(
                        screenNames: ScreenNames.addLeaveSuccessScreen);
                  },
                  color: AppColors.mainColor,
                  text: 'apply',
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp,
                  height: 50.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'cancel',
                        style: TextStyle(
                          color: AppColors.subTitleColor,
                          fontSize: 14.sp,
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
