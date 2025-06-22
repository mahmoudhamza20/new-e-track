import 'package:dotted_border/dotted_border.dart';
import 'package:etrack/cubits/generic_cubit/generic_cubit.dart';
import 'package:etrack/data/user_data.dart';
import 'package:etrack/utility/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrContainer extends StatefulWidget {
  const QrContainer({Key? key}) : super(key: key);

  @override
  State<QrContainer> createState() => _QrContainerState();
}

class _QrContainerState extends State<QrContainer>
    with SingleTickerProviderStateMixin {
  bool isActive = Data.isLoggedInAttendance;
  late Image image;
  GenericCubit<bool> qrImageCubit = GenericCubit<bool>();
  late AnimationController animationController;
  late Animation<double> curve;
  late Animation<double> animation;
  bool showQr = true; // Added definition for showQr

  @override
  void initState() {
    // getQrCode();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));
    curve =
        CurvedAnimation(parent: animationController, curve: Curves.easeInCirc);
    animation = Tween(begin: .9, end: 1.0).animate(animationController);
    animationController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(12.r),
      strokeWidth: 1.7,
      strokeCap: StrokeCap.butt,
      color: AppColors.mainColor,
      padding: EdgeInsets.zero,
      dashPattern: const [5],
      child: Container(
        width: .95.sw,
        margin: const EdgeInsets.all(5),
        padding: EdgeInsets.all(10.sp),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r), color: Colors.white),
        child: Column(
          children: [
            Row(
              children: [
                const Spacer(),
                GestureDetector(
                    // onTap: getQrCode,
                    onTap: () {},
                    child: Icon(
                      Icons.autorenew,
                      size: 25.sp,
                      color: AppColors.mainColor,
                    )),
                SizedBox(
                  width: 10.w,
                )
              ],
            ),
            SizedBox(
              width: 120.h,
              height: 120.h,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  AnimatedBuilder(
                      animation: animation,
                      builder: (context, _) {
                        return ScaleTransition(
                          scale: animation,
                          child: Container(
                            width: 120.h,
                            height: 120.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.r),
                              color: Data.isLoggedInAttendance
                                  ? Colors.green
                                  : Colors.red,
                            ),
                          ),
                        );
                      }),
                  AnimatedBuilder(
                      animation: animation,
                      builder: (context, _) {
                        return ScaleTransition(
                          scale: animation,
                          child: Container(
                            width: 70.h,
                            height: 120.h,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                          ),
                        );
                      }),
                  AnimatedBuilder(
                      animation: animation,
                      builder: (context, _) {
                        return ScaleTransition(
                          scale: animation,
                          child: Container(
                            width: 120.h,
                            height: 70.h,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                          ),
                        );
                      }),
                  AnimatedBuilder(
                      animation: animation,
                      builder: (context, _) {
                        return ScaleTransition(
                          scale: animation,
                          child: Container(
                            width: 110.h,
                            height: 110.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: Colors.white,
                            ),
                          ),
                        );
                      }),
                  Positioned(
                    right: 5.h,
                    top: 5.h,
                    child: SizedBox(
                        width: 110.h,
                        height: 110.h,
                        child: showQr
                            ? SizedBox(
                                child: QrImageView(
                                  size: 120.h,
                                  data: Data.userData!.appUser!.id.toString(),
                                  version: QrVersions.auto,
                                  foregroundColor: AppColors.mainColor,
                                  gapless: true,
                                ),
                              )
                            : const Center(
                                child: CupertinoActivityIndicator())),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: 5.h, bottom: 5.h, right: 5.w, left: 5.w),
                  decoration: BoxDecoration(
                      color: AppColors.unselectedColor,
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SvgPicture.asset(
                          'assets/images/clock.svg',
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          'أخر تحديث: ${DateFormat.MMMMEEEEd('ar').format(DateTime.now())} ، ${DateFormat.Hm().format(DateTime.now())} ',
                          style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.mainTitleColor,
                              height: 2),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            Container(
              padding:
                  EdgeInsets.only(top: 5.h, bottom: 5.h, right: 7.w, left: 7.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(
                      color:
                          Data.isLoggedInAttendance ? Colors.green : Colors.red,
                      width: 2)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
               
                children: [
                  CircleAvatar(
                    radius: 5,
                    backgroundColor:
                        Data.isLoggedInAttendance ? Colors.green : Colors.red,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    Data.isLoggedInAttendance ? 'مشرف غير نشط' : 'مشرف نشط',
                    style: TextStyle(
                        color: AppColors.mainColor,
                        height: 1.2,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // getQrCode() async {
  //   try {
  //     qrImageCubit.update(data: false);
  //     var res = await UserController.qrCode();
  //     image = imageFromBase64String(res);
  //     qrImageCubit.update(data: true);
  //   } catch (error) {
  //     log(error.toString());
  //   }
  // }

  // Image imageFromBase64String(String base64String) {
  //   return Image.memory(
  //     base64Decode(
  //       base64String.split(',')[1],
  //     ),
  //   );
  // }
}
