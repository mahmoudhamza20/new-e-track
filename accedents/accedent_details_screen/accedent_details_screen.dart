import 'package:etrack/components/back_button.dart';
import 'package:etrack/components/custom_network_image.dart';
import 'package:etrack/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccedentDetailsScreen extends StatelessWidget {
  const AccedentDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: SizedBox(
          width: 1.sw,
          height: 1.sh,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: .05.sw, right: .05.sw),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const BackButtonCustom(isDark: false),
                        Text(
                          'incident Detail',
                          style: TextStyle(
                            color: AppColors.mainTitleColor,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30.h,
                        ),
                        Text(
                          // formatDateAsTimeAndDate(
                          //     accedentModel.created.toString()),
                          '2025/08/11',
                          style: TextStyle(
                              color: AppColors.subTitleColor, fontSize: 13.sp),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Text(
                          // accedentModel.reason.toString(),
                          'accident reason',
                          style: TextStyle(
                              color: AppColors.mainTitleColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 17.sp,
                              height: 2),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          // accedentModel.description.toString(),
                          'accident description',
                          style: TextStyle(
                              color: AppColors.subTitleColor, fontSize: 13.sp),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 15.sp,
                              color: AppColors.subTitleColor,
                            ),
                            Text(
                              // accedentModel.siteLocation != null
                              //     ? accedentModel.siteLocation!.name.toString()
                              //     : '',
                              'accident location',
                              style: TextStyle(
                                  color: AppColors.subTitleColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.sp),
                            ),
                          ],
                        ),
                        const Divider(thickness: 1.5),
                        Text(
                          'images',
                          style: TextStyle(
                              color: AppColors.mainTitleColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.sp,
                              height: 2),
                        ),
                        SizedBox(
                          height: 60.h,
                          child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                Container(
                                  margin:
                                      EdgeInsets.only(left: 5.w, right: 5.w),
                                  width: 60.h,
                                  height: 60.h,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      color: AppColors.unselectedColor),
                                  child: const CustomNetworkImage(
                                    link:
                                        'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
                                  ),
                                ),
                              ]
                              //  accedentModel.incidentAttachments!
                              //     .map((e) => Container(
                              //           margin: EdgeInsets.only(
                              //               left: 5.w, right: 5.w),
                              //           width: 60.h,
                              //           clipBehavior: Clip.antiAlias,
                              //           decoration: BoxDecoration(
                              //               borderRadius:
                              //                   BorderRadius.circular(10.r),
                              //               color: AppColors.unselectedColor),
                              //           child: e!.attachment!.fullLink!
                              //                   .endsWith('mp4')
                              //               ? DisplayVideoComponents(
                              //                   path: e.attachment!.fullLink
                              //                       .toString(),
                              //                 )
                              //               : CustomNetworkImage(
                              //                   link: e.attachment!.fullLink
                              //                       .toString(),
                              //                 ),
                              //         ))
                              //     .toList(),
                              ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        const Divider(thickness: 1.5),
                        Text(
                          'action Taken',
                          style: TextStyle(
                              color: AppColors.mainTitleColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.sp,
                              height: 2),
                        ),
                        Text(
                          // accedentModel.actionToken.toString(),
                          'action taken',
                          style: TextStyle(
                              color: AppColors.subTitleColor, fontSize: 13.sp),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
