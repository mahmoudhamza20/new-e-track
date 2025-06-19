import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:etrack/components/bottom_nav_bar.dart';
import 'package:etrack/components/custom_network_image.dart';
import 'package:etrack/routes/routes.dart';
import 'package:etrack/utility/app_colors.dart';
import 'package:etrack/utility/app_fonts.dart';
import 'package:etrack/utility/app_setting.dart';
import 'package:etrack/utility/image_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';

class MyCompany extends StatefulWidget {
  const MyCompany({Key? key}) : super(key: key);

  @override
  State<MyCompany> createState() => _MyCompanyState();
}

class _MyCompanyState extends State<MyCompany> {
  final Completer<GoogleMapController> mapController = Completer();
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  @override
  void initState() {
    Marker marker = Marker(
      markerId: const MarkerId('id'),
      position: LatLng(
          double.parse('userCompaniesModel!.securityCompany!.locationLat'),
          double.parse('userCompaniesModel!.securityCompany!.locationLng')),
    );
    markers[const MarkerId('id')] = marker;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // goToWithRemoveRoute(screenName: Data.home, context: context);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 3,
          backgroundColor: Colors.transparent,
        ),
        bottomNavigationBar: const BottomNavBarCutom(currentIndex: 3),
        backgroundColor: AppColors.mainColor,
        body: SizedBox(
          width: 1.sw,
          height: 1.sh,
          child: Stack(
            children: [
              Positioned(
                  top: .2.sh,
                  width: 1.sw,
                  height: .8.sh,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.r)),
                  )),
              Container(
                padding: EdgeInsets.only(right: .05.sw, left: .05.sw),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // goToWithRemoveRoute(
                            //     screenName: Data.home, context: context);
                          },
                          child: Container(
                            height: 35.h,
                            width: 35.h,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(.1),
                                borderRadius: BorderRadius.circular(7.r)),
                            child: Center(
                              child: Transform(
                                  alignment: Alignment.center,
                                  transform: isArabic
                                      ? Matrix4.rotationX(0)
                                      : Matrix4.rotationY(pi),
                                  child: SvgPicture.asset(
                                    AppImages.arrow,
                                    width: 15.w,
                                    fit: BoxFit.fitWidth,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, ScreenNames.emergencyContactScreen);
                          },
                          child: Container(
                            height: 35.h,
                            width: 35.h,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(.1),
                                borderRadius: BorderRadius.circular(7.r)),
                            child: Center(
                              child: SvgPicture.asset(
                                'assets/images/contact.svg',
                                width: 20.w,
                                fit: BoxFit.fitWidth,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: .07.sh,
                    ),
                    Container(
                      height: 80.h,
                      width: 80.h,
                      margin: EdgeInsets.only(right: 12.w, left: 12.w),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.r)),
                      child: const CustomNetworkImage(
                        link: '',
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'companyName',
                      style: TextStyle(
                        color: AppColors.blackColor,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      children: [
                        Icon(Icons.place,
                            color: AppColors.subTitleColor, size: 15.sp),
                        SizedBox(
                          width: .85.sw,
                          child: Text(
                            'address',
                            style: TextStyle(
                              color: AppColors.subTitleColor,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      'عن الشركة',
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.mainTitleColor,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    ReadMoreText(
                      "لا يوجد وصف",
                      trimLines: 2,
                      trimMode: TrimMode.Length,
                      trimCollapsedText: 'المزيد',
                      trimExpandedText: 'أقل',
                      style: TextStyle(
                        fontSize: 12.sp,
                        height: 1.5,
                        fontWeight: FontWeight.w500,
                        color: AppColors.borderColor,
                      ),
                      lessStyle: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.mainTitleColor,
                      ),
                      moreStyle: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.mainTitleColor,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Divider(
                      thickness: 1.5.sm,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      'الموقع',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: AppFonts.mainfont,
                        color: AppColors.mainTitleColor,
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Container(
                      width: .9.sw,
                      height: .15.sh,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15.r),
                              topRight: Radius.circular(15.r))),
                      child: GoogleMap(
                        mapType: MapType.normal,
                        buildingsEnabled: true,
                        zoomControlsEnabled: false,
                        initialCameraPosition: CameraPosition(
                          target: LatLng(
                            double.parse(
                                'userCompaniesModel!.securityCompany!.locationLat'),
                            double.parse(
                                'userCompaniesModel!.securityCompany!.locationLng'),
                          ),
                          zoom: 10.151926040649414,
                        ),
                        onMapCreated: (GoogleMapController controller) {
                          mapController.complete(controller);
                        },
                        mapToolbarEnabled: true,
                        markers: Set<Marker>.of(markers.values),
                        onTap: (latLng) async {
                          if (Platform.isAndroid) {
                            MapsLauncher.launchCoordinates(
                                latLng.latitude, latLng.longitude);
                          } else if (Platform.isIOS) {
                            showCupertinoDialog(
                                context: context,
                                builder: (context) {
                                  return CupertinoAlertDialog(
                                    title: Text(
                                      'open with',
                                      style: TextStyle(
                                          fontFamily: AppFonts.mainfont,
                                          color: AppColors.mainColor),
                                    ),
                                    content: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            CupertinoButton(
                                                padding: EdgeInsets.zero,
                                                onPressed: () async {
                                                  goBack();
                                                  final String googleMapsUrl =
                                                      "https://www.google.com/maps/search/?api=1&query=${latLng.latitude},${latLng.longitude}";
                                                  if (!await launchUrl(
                                                      Uri.parse(
                                                          googleMapsUrl))) {
                                                    throw 'Could not launch ${Uri.parse(googleMapsUrl)}';
                                                  }
                                                },
                                                child: Text(
                                                  'Google Maps',
                                                  style: TextStyle(
                                                      fontSize: 13.sp,
                                                      fontFamily: "Poppins",
                                                      color:
                                                          AppColors.mainColor),
                                                )),
                                            CupertinoButton(
                                                padding: EdgeInsets.zero,
                                                child: Text(
                                                  'Apple Maps',
                                                  style: TextStyle(
                                                      fontSize: 13.sp,
                                                      fontFamily: "Poppins",
                                                      color:
                                                          AppColors.mainColor),
                                                ),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  MapsLauncher
                                                      .launchCoordinates(
                                                          latLng.latitude,
                                                          latLng.longitude);
                                                }),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          }
                        },
                      ),
                    ),
                    Container(
                      width: .9.sw,
                      height: .05.sh,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15.r),
                              bottomRight: Radius.circular(15.r)),
                          color: Colors.grey.withOpacity(.15)),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 15.sp,
                              color: AppColors.subTitleColor,
                            ),
                            SizedBox(
                              width: .75.sw,
                              child: Text(
                                'address',
                                maxLines: 1,
                                style: TextStyle(
                                    color: AppColors.subTitleColor,
                                    fontSize: 12.sp),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
