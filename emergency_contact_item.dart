import 'package:etrack/components/custom_network_image.dart';
import 'package:etrack/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyContactItem extends StatelessWidget {
  const EmergencyContactItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.grey,
      color: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      child: Container(
        padding: EdgeInsets.all(10.sp),
        child: Row(
          children: [
            Container(
              width: 35.h,
              height: 35.h,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: const CustomNetworkImage(
                link: '',
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'سارة الدوسري',
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.mainColor,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  '+966 98765 43210',
                  style: TextStyle(
                      fontSize: 12.sp,
                      height: 1.5,
                      color: AppColors.borderColor,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
            const Spacer(),
            GestureDetector(
              onTap: () async {
                String url = 'tel://+9669876543210';
                if (!await launchUrl(Uri.parse(url))) {
                  throw 'Could not launch ${Uri.parse(url)}';
                }
              },
              child: Container(
                width: 25.h,
                height: 25.h,
                decoration: BoxDecoration(
                    color: const Color(0xff449C50),
                    borderRadius: BorderRadius.circular(7.r)),
                child: Icon(Icons.phone, size: 17.sp, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
