class MenuDrawerLoggedIn extends StatelessWidget {
  const MenuDrawerLoggedIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.mainColor,
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(right: .05.sw, left: .05.sw, top: .05.sh),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      ZoomDrawer.of(context)?.toggle.call();
                    },
                    child: Container(
                      width: 30.sm,
                      height: 30.sm,
                      padding: EdgeInsets.all(10.sm),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: AppColors.unselectedColor.withOpacity(.2)),
                      child: SvgPicture.asset('assets/images/cancel.svg'),
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Image.asset(
                    AppImages.splashLogo,
                    width: 70.w,
                    height: 70.h,
                    color: Colors.white,
                  ),
                  SizedBox(height: 50.h),
                  DrawerItem(
                      title: 'الرئيسية',
                      image: 'assets/images/home.svg',
                      action: () {
                        ZoomDrawer.of(context)?.toggle.call();
                        // goToWithRemoveRoute(
                        //     screenName: Data.home, context: context);
                      }),
                  SizedBox(height: 10.h),

                  DrawerItem(
                      title: 'وظائفي',
                      image: 'assets/images/job.svg',
                      action: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            ScreenNames.myJobsScreen,
                            (Route<dynamic> route) => false);

                        ZoomDrawer.of(context)?.toggle.call();
                      }),
                  SizedBox(height: 10.h),

                  // SizedBox(height: 10.h),
                  // if(Data.isSuperVisior!=null)
                  // DrawerItem(
                  //     title: AppWords.swapShiftRequests.tr,
                  //     image: 'assets/images/swap.svg',
                  //     action: () {
                  //       ZoomDrawer.of(context)?.toggle.call();
                  //       if (Data.isSuperVisior != null && Data.isSuperVisior!) {
                  //         goToScreen(
                  //             screenNames: ScreenNames.exchangeLeadMainScreen);
                  //       } else {
                  //         goToScreen(
                  //             screenNames: ScreenNames.swapShiftRequestsScreen);
                  //       }
                  //     }),
                  // SizedBox(height: 10.h),
                  // if (Data.isSuperVisior != null)
                  //   GestureDetector(
                  //     onTap: () {
                  //       goToScreen(screenNames: ScreenNames.userProfileScreen);
                  //       ZoomDrawer.of(context)?.toggle.call();
                  //     },
                  //     child: Container(
                  //       color: Colors.transparent,
                  //       padding: EdgeInsets.zero,
                  //       child: Row(
                  //         crossAxisAlignment: CrossAxisAlignment.center,
                  //         children: [
                  //           Icon(Icons.contact_mail,
                  //               color: Colors.white, size: 25.w),
                  //           SizedBox(width: 13.w),
                  //           Text(
                  //             AppWords.idScreen.tr,
                  //             style: TextStyle(
                  //                 color: Colors.white,
                  //                 fontWeight: FontWeight.normal,
                  //                 fontFamily: AppFonts.mainfont,
                  //                 fontSize: 16.sp,
                  //                 height: 2),
                  //           )
                  //         ],
                  //       ),
                  //     ),
                  //   ),

                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, ScreenNames.scannerScreen);

                      ZoomDrawer.of(context)?.toggle.call();
                    },
                    child: Container(
                      padding: EdgeInsets.zero,
                      color: Colors.transparent,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.qr_code_scanner,
                              color: Colors.white,
                              size: 25.w), // TODO change icon
                          SizedBox(width: 13.w),
                          Text(
                            'الماسح الضوئي',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 15.sp,
                                height: 2),
                          )
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 10.h),
                  DrawerItem(
                      title: 'عن التطبيق',
                      image: 'assets/images/contact.svg', // TODO change icon
                      action: () {
                        Navigator.pushNamed(context, ScreenNames.aboutUs);

                        ZoomDrawer.of(context)?.toggle.call();
                      }),
                  SizedBox(height: 10.h),

                  GestureDetector(
                    onTap: () {
                      CustomAlert.helpDialog();
                    },
                    child: Container(
                      padding: EdgeInsets.zero,
                      color: Colors.transparent,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.help,
                              color: Colors.white,
                              size: 25.w), // TODO change icon
                          SizedBox(width: 13.w),
                          Text(
                            'المساعدة',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 15.sp,
                                height: 2),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  GestureDetector(
                    onTap: () {
                      Share.share(
                          'join us with takid platform https://onelink.to/47nmrz');
                    },
                    child: Container(
                      padding: EdgeInsets.zero,
                      color: Colors.transparent,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.share,
                              color: Colors.white,
                              size: 25.w), // TODO change icon
                          SizedBox(width: 13.w),
                          Text(
                            'مشاركة مع اصدقائك',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 15.sp,
                                height: 2),
                          )
                        ],
                      ),
                    ),
                  ),

                  const Spacer(),
                  Text(
                    'الإصدار 14.4',
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white.withOpacity(.5)),
                  ),
                  SizedBox(
                    height: .05.sh,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
