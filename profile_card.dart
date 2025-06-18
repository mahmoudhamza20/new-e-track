import 'package:etrack/components/custom_network_image.dart';
import 'package:etrack/routes/routes.dart';
import 'package:etrack/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ScreenNames.profileDetailsScreen);
      },
      child: Card(
        color: const Color(0xff0C3D64),
        surfaceTintColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(200.r),
            side: const BorderSide(color: Colors.white)),
        child: Container(
          padding: EdgeInsets.all(15.sm),
          child: Row(
            children: [
              Container(
                height: 50.h,
                width: 50.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Container(
                    width: 90.h,
                    height: 90.h,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(250.r),
                      color: AppColors.mainColor,
                    ),
                    child: const CustomNetworkImage(
                      link: 'userProfileImage',
                    )),
              ),
              SizedBox(
                width: 10.w,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'محمد فهد الدوسري',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'حارس',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 12.sp,
                        color: Colors.white,
                        height: 2),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
