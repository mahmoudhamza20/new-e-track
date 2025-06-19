import 'package:etrack/components/back_button.dart';
import 'package:etrack/components/no_result_found.dart';
import 'package:etrack/model/emergency_contact_model.dart';
import 'package:etrack/screens/user_screens/Emergency_contacts_screen/components/emergency_contact_item.dart';
import 'package:etrack/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmergencyContactsScreen extends StatelessWidget {
   EmergencyContactsScreen({Key? key}) : super(key: key);

  List<EmergencyContactModel?> emergencyContacts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 0,
      ),
      body: SizedBox(
        height: 1.sh,
        width: 1.sw,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: .05.sw, right: .05.sw),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const BackButtonCustom(isDark: true),
                          Text(
                            'جهات اتصال الطوارئ',
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                                fontSize: 20.sp),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(right: .05.sw, left: .05.sw),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15.r),
                            topLeft: Radius.circular(15.r))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          '05جهات اتصال',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              height: 1.5,
                              color: Colors.black,
                              fontSize: 14.sp),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Expanded(
                          child: emergencyContacts.isNotEmpty
                              ? ListView.builder(
                                  itemCount: emergencyContacts.length,
                                  itemBuilder: (context, index) {
                                    return EmergencyContactItem(
                                      emergencyContact:
                                          emergencyContacts[index]!,
                                    );
                                  })
                              : const Center(
                                  child: NoResultFound(
                                  title: 'لا توجد جهات اتصال طوارئ',
                                )),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
