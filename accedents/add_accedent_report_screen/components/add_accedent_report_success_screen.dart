import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:etrack/components/button/button.dart';
import 'package:etrack/controller/accedent_controller.dart';
import 'package:etrack/data/user_data.dart';
import 'package:etrack/routes/routes.dart';
import 'package:etrack/screens/intro_screens/splash/splash_data.dart';
import 'package:etrack/screens/user_screens/accedents/accedents_reports_screen/accedents_reports_data.dart';
import 'package:etrack/utility/all_app_words.dart';
import 'package:etrack/utility/app_colors.dart';
import 'package:etrack/utility/app_fonts.dart';
import 'package:etrack/utility/image_path.dart';

class AddAccedentReportSuccessScreen extends StatelessWidget {
  const AddAccedentReportSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SizedBox(
        width: 1.sw,
        child: Column(
          children: [
            SizedBox(height: .3.sh),
            Image.asset(AppImages.success, width: .3.sw, fit: BoxFit.fitWidth),
            SizedBox(height: 20.h),
            Text(
              AppWords.sendReportSuccess.tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: AppFonts.mainfont,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const Spacer(),
            SizedBox(
                width: .85.sw,
                child: Button(
                  fontSize: 14.sp,
                  height: 45.h,
                  color: Colors.white.withOpacity(.2),
                  text: AppWords.ok.tr,
                  onPressed: () async {
                    AccedentController.getAllAccedents(
                            clientSiteId: Data.clientSiteId)
                        .then((value) {
                      accedentsGlobalCubit.update(data: value);
                    });
                    syncDataRealTime();
                    goBack();
                  },
                )),
            SizedBox(
              height: 40.h,
            )
          ],
        ),
      ),
    );
  }

  syncDataRealTime() async {
    SplashData.appHub
        .invoke('AddToGroup', args: ['${Data.siteSupervisorShiftId}-accedent']);
    SplashData.appHub.invoke('SendMessageToGroup',
        args: ['${Data.siteSupervisorShiftId}-accedent', '', '']);
    SplashData.appHub.invoke('RemoveFromGroup',
        args: ['${Data.siteSupervisorShiftId}-accedent']);
    SplashData.appHub.invoke('AddToGroup',
        args: ['${Data.userCompaniesModel!.securityCompany!.id}-incident']);
    SplashData.appHub.invoke('SendMessageToGroup', args: [
      '${Data.userCompaniesModel!.securityCompany!.id}-incident',
      '',
      ''
    ]);
    SplashData.appHub.invoke('RemoveFromGroup',
        args: ['${Data.userCompaniesModel!.securityCompany!.id}-incident']);
  }
}
