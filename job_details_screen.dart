import 'dart:async';
import 'dart:math' as math;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:etrack/components/button/button.dart';
import 'package:etrack/components/screen.dart';
import 'package:etrack/components/tab_bar_custom.dart';
import 'package:etrack/screens/jobs_screen/job_details_screen/components/about_company.dart';
import 'package:etrack/screens/jobs_screen/job_details_screen/components/about_job.dart';
import 'package:etrack/screens/jobs_screen/job_details_screen/job_details_data.dart';
import 'package:etrack/utility/app_colors.dart';
import 'package:etrack/utility/app_fonts.dart';
import 'package:etrack/utility/app_setting.dart';
import 'package:etrack/utility/image_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class JobDetailsScreen extends StatelessWidget {
   JobDetailsScreen({Key? key}) : super(key: key);

  @override
  // void initState() {
  //  marker = Marker(
  //     markerId: MarkerId(data!.locationName.toString()),
  //     position: LatLng(double.parse(data!.locationLat.toString()),
  //         double.parse(data!.locationLng.toString())),
  //   );
  //   markers[MarkerId(data!.locationName.toString())] = marker;
  //   super.initState();
  // }

  final Completer<GoogleMapController> controller = Completer();

   late Marker marker;

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Positioned(
              top: 15.h,
              right: isArabic ? 20.w : .86.sw,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 30.h,
                  width: 30.h,
                  decoration: BoxDecoration(
                      color: AppColors.boldMainColor,
                      borderRadius: BorderRadius.circular(7.r)),
                  child: Center(
                    child: Transform(
                        alignment: Alignment.center,
                        transform: isArabic
                            ? Matrix4.rotationX(0)
                            : Matrix4.rotationY(math.pi),
                        child: SvgPicture.asset(
                          AppImages.arrow,
                          width: 13.w,
                          fit: BoxFit.fitWidth,
                          color: Colors.white,
                        )),
                  ),
                ),
              )),
          Positioned(
              top: 15.h,
              right: !isArabic ? 20.w : .86.sw,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 30.h,
                  width: 30.h,
                  decoration: BoxDecoration(
                      color: AppColors.boldMainColor,
                      borderRadius: BorderRadius.circular(7.r)),
                  child: Center(
                    child: Transform(
                        alignment: Alignment.center,
                        transform: isArabic
                            ? Matrix4.rotationX(0)
                            : Matrix4.rotationY(math.pi),
                        child: SvgPicture.asset(
                          'assets/images/share.svg',
                          width: 13.w,
                          fit: BoxFit.fitWidth,
                          color: Colors.white,
                        )),
                  ),
                ),
              )),
          Positioned(
              top: .16.sh,
              child: Container(
                width: 1.sw,
                height: .82.sh,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.r),
                        topRight: Radius.circular(15.r))),
                child: Column(
                  children: [
                    SizedBox(
                      height: 52.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 15.w,
                        ),
                        Text(
                          'مندوبي المبيعات',
                          style: TextStyle(
                              fontFamily: AppFonts.mainfont,
                              color: AppColors.blackColor,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        Container(
                          decoration: BoxDecoration(
                              color: AppColors.skyColor,
                              borderRadius: BorderRadius.circular(250)
                              // borderRadius: BorderRadius.only(
                              //     bottomLeft:
                              //         Radius.circular(isArabic ? 0.r : 10),
                              //     topLeft: Radius.circular(isArabic ? 0.r : 10),
                              //     topRight:
                              //         Radius.circular(isArabic ? 10.r : 0),
                              //     bottomRight:
                              //         Radius.circular(isArabic ? 10.r : 0)),
                              ),
                          padding: EdgeInsets.only(
                              top: 10.h,
                              bottom: 5.h,
                              right: 15.w,
                              left: 15.w),
                          child: Text(
                            'الشواغر: 22',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 15.w,
                        ),
                        SizedBox(
                          width: .4.sw,
                          child: Text(
                            'برايم للحماية ',
                            maxLines: 2,
                            style: TextStyle(
                                color: AppColors.subTitleColor,
                                fontSize: 12.sp,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Container(
                          color: Colors.grey,
                          width: 1,
                          height: 12.h,
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Icon(
                          Icons.location_on,
                          color: Colors.grey,
                          size: 15.sp,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        SizedBox(
                          width: .45.sw,
                          child: Text(
                            'شارع صاري الرياض',
                            style: TextStyle(
                                color: AppColors.subTitleColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 15.w, left: 15.w),
                          padding: EdgeInsets.only(
                              top: 5.h, bottom: 5.h, right: 10.w, left: 10.w),
                          decoration: BoxDecoration(
                              color: AppColors.skyColor.withOpacity(.2),
                              borderRadius: BorderRadius.circular(200.r)),
                          child: Text(
                            'دوام دائم',
                            style: TextStyle(
                              color: AppColors.mainColor,
                              fontWeight: FontWeight.normal,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 15.w, left: 15.w),
                          padding: EdgeInsets.only(
                              top: 5.h, bottom: 5.h, right: 10.w, left: 10.w),
                          decoration: BoxDecoration(
                              color:
                                  AppColors.borderColor.withValues(alpha: .2),
                              borderRadius: BorderRadius.circular(200.r)),
                          child: Text(
                            'فترة مسائية',
                            style: TextStyle(
                              color: AppColors.borderColor,
                              fontWeight: FontWeight.normal,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                        // Container(
                        //   margin: EdgeInsets.only(right: 10.w),
                        //   padding: EdgeInsets.only(
                        //       top: 5.h, bottom: 5.h, right: 10.w, left: 10.w),
                        //   decoration: BoxDecoration(
                        //       color: Colors.orange.withOpacity(.2),
                        //       borderRadius: BorderRadius.circular(8.r)),
                        //   child: Text(
                        //     'فترة مسائية',
                        //     style: TextStyle(
                        //         color: Colors.orange,
                        //         fontWeight: FontWeight.normal,
                        //         fontSize: 13.sp,
                        //         fontFamily: AppFonts.mainfont),
                        //   ),
                        // ),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Expanded(
                      child: SizedBox(
                        width: .9.sw,
                        child: TabBarCustom(
                          tabNames: const ['عن الوظيفة', 'الشركة'],
                          children: [
                            AboutJob(),
                            AboutCompany(
                             
                              mapController: controller,
                              markers: markers,
                            )
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        data!.isSavedJop!
                            ? Icon(
                                Icons.bookmark,
                                size: 25.sp,
                              )
                            : GestureDetector(
                                onTap: () async {
                                  // if (data!.isSavedJop!) {
                                  //   CustomAlert.showAlertMessage(
                                  //     txt: AppWords.savedBefore.tr,
                                  //     alertType: AlertType.confirm,
                                  //   );
                                  // } else {
                                  //   loading.show;
                                  //   if (Data.userData != null) {
                                  //     await JobController.saveJob(
                                  //             companyJobId:
                                  //                 data!.id.toString(),
                                  //             securityGuardId: Data
                                  //                 .userData!.id
                                  //                 .toString())
                                  //         .then((value) {
                                  //       if (!value) {
                                  //         CustomAlert.showAlertMessage(
                                  //           txt: AppWords.savedJobSuccess.tr,
                                  //           alertType: AlertType.confirm,
                                  //         );
                                  //         setState(() {
                                  //           data!.isSavedJop = true;
                                  //         });
                                  //       }
                                  //     });
                                  //   } else {
                                  //     CustomAlert.showAlertMessage(
                                  //         txt: AppWords.mustLoginFirst.tr,
                                  //         alertType: AlertType.confirm,
                                  //         onClick: () {
                                  //           goToScreen(
                                  //               screenNames:
                                  //                   ScreenNames.loginScreen);
                                  //         });
                                  //   }
                                  //   loading.hide;
                                  // }
                                },
                                child: Container(
                                  width: 25.h,
                                  height: 25.h,
                                  padding: EdgeInsets.all(5.sm),
                                  child: Icon(
                                    Icons.bookmark,
                                    size: 25.sp,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                        if (!data!.isApplayedJop!)
                          SizedBox(
                            width: .75.sw,
                            child: Button(
                              color: AppColors.mainColor,
                              fontWeight: FontWeight.bold,
                              onPressed: () {
                                // if (Data.userData != null) {
                                //   Navigator.pushNamed(
                                //       context, ScreenNames.applyForJop,
                                //       arguments: [data!.id, false]);
                                // } else {
                                //   CustomAlert.showAlertMessage(
                                //       txt: 'يجب تسجيل الدخول أولاً',
                                //       alertType: 'تأكيد',
                                //       onClick: () {
                                //         Navigator.pushNamed(
                                //             context, ScreenNames.loginScreen);
                                //       });
                                // }
                              },
                              text: 'التقديم على الوظيفة',
                              height: 45.h,
                              fontSize: 13.sp,
                            ),
                          ),
                      ],
                    ),
                    SizedBox(
                      height: 70.h,
                    ),
                  ],
                ),
              )),
          Positioned(
            top: .1.sh,
            right: isArabic ? 15.w : .65.sw,
            child: Container(
              height: 80.h,
              width: 80.h,
              margin: EdgeInsets.only(right: 12.w, left: 12.w),
              clipBehavior: Clip.antiAlias,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
              child: CachedNetworkImage(
                imageUrl: '' ?? "",
                height: 60.h,
                fit: BoxFit.fitHeight,
                progressIndicatorBuilder: (context, string, progress) {
                  return Center(
                    child: Image.asset('assets/images/loader.gif'),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
