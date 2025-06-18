import 'dart:async';
import 'dart:io';

import 'package:etrack/utility/app_colors.dart';
import 'package:etrack/utility/app_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutCompany extends StatelessWidget {
  const AboutCompany(
      {Key? key,
     
      required this.mapController,
      required this.markers})
      : super(key: key);
  // final WorkOfferModelData? data;
  final Completer<GoogleMapController> mapController;
  final Map<MarkerId, Marker> markers;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15.h,
          ),
          Text(
            'عن الشركة',
            style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.blackColor,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5.h,
          ),
          ReadMoreText(
            'هذا النص هو مثال لنص يمكن أن يستبدل في نفس',
            trimLines: 2,
            trimMode: TrimMode.Length,
            trimCollapsedText: 'المزيد',
            trimExpandedText: 'أقل',
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.blackColor,
            ),
            lessStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black),
            moreStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          SizedBox(
            height: 5.h,
          ),
          Divider(
            thickness: 1.5.sm,
            color: const Color(0xffE6E6EC),
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            'الموقع',
            style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.blackColor,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10.h,
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
                target: LatLng(double.parse('lat'),
                    double.parse('lng')),
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
                            'open map with ',
                            style: TextStyle(color: AppColors.mainColor),
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
                                        Navigator.pop(context);
                                        final String googleMapsUrl =
                                            "https://www.google.com/maps/search/?api=1&query=${latLng.latitude},${latLng.longitude}";
                                        if (!await launchUrl(
                                            Uri.parse(googleMapsUrl))) {
                                          throw 'Could not launch ${Uri.parse(googleMapsUrl)}';
                                        }
                                      },
                                      child: Text(
                                        'Google Maps',
                                        style: TextStyle(
                                            fontSize: 13.sp,
                                            color: AppColors.mainColor),
                                      )),
                                  CupertinoButton(
                                      padding: EdgeInsets.zero,
                                      child: Text(
                                        'Apple Maps',
                                        style: TextStyle(
                                            fontSize: 13.sp,
                                            color: AppColors.mainColor),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);

                                        MapsLauncher.launchCoordinates(
                                            latLng.latitude, latLng.longitude);
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
                    width: .73.sw,
                    child: Text(
                      'شارع صاري الرياض',
                      maxLines: 1,
                      style: TextStyle(
                          color: AppColors.subTitleColor,
                          fontFamily: AppFonts.mainfont,
                          fontSize: 12.sp),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 10.r,
                    child: Icon(
                      Icons.explore,
                      size: 15.sp,
                      color: AppColors.boldMainColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
