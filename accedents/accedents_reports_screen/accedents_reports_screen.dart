import 'package:etrack/components/back_button.dart';
import 'package:etrack/routes/routes.dart';
import 'package:etrack/screens/user_screens/accedents/accedents_reports_screen/components/accedent_item.dart';
import 'package:etrack/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccedentsReportsScreen extends StatefulWidget {
  const AccedentsReportsScreen({Key? key}) : super(key: key);

  @override
  State<AccedentsReportsScreen> createState() => _AccedentsReportsScreenState();
}

class _AccedentsReportsScreenState extends State<AccedentsReportsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: AppColors.mainColor,
      body: SizedBox(
        height: 1.sh,
        width: 1.sw,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              height: 1.sh,
              width: 1.sw,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 60.h,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 10.w,
                          ),
                          const BackButtonCustom(isDark: true),
                          SizedBox(
                            width: 10.w,
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, ScreenNames.addAccedentsScreen);
                            },
                            child: Container(
                              padding: EdgeInsets.all(7.sp),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: AppColors.skyColor),
                              child: Icon(Icons.add,
                                  color: Colors.white, size: 20.sp),
                            ),
                          ),
                          SizedBox(
                            width: 15.w,
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: .025.sw, right: .025.sw),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15.h,
                        ),
                        Text(
                          'Daily Notes',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 19.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              width: 1.sw,
              child: Container(
                width: double.infinity,
                height: .8.sh,
                padding: EdgeInsets.only(left: .05.sw, right: .05.sw),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.r),
                        topRight: Radius.circular(15.r))),
                child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return const AccedentItem();
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
