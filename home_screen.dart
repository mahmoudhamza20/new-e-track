import 'package:etrack/components/button/button.dart';
import 'package:etrack/components/drawer_custom.dart';
import 'package:etrack/data/user_data.dart';
import 'package:etrack/model/general_model/item.dart';
import 'package:etrack/model/work_offer_model.dart';
import 'package:etrack/screens/home_screen/components/filter_item.dart';
import 'package:etrack/screens/home_screen/components/main_screen.dart';
import 'package:etrack/screens/home_screen/components/menu_drawer.dart';
import 'package:etrack/screens/user_screens/user_profile_screen/components/menu_drawer_logedin.dart';
import 'package:etrack/utility/app_colors.dart';
import 'package:etrack/utility/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final _drawerController = ZoomDrawerController();

  @override
  showFilter(
      PagingController<int, WorkOfferModelData> paging, BuildContext context) {
    List<Item> companyType = [
      Item(key: '0', value: 'دوام كامل'),
      Item(key: '1', value: 'فترة مسائية'),
      Item(key: '2', value: 'فترة صباحية'),
    ];
    List<Item> date = [
      Item(key: '1', value: 'اليوم الماضي'),
      Item(key: '3', value: 'قبل 3 ايام'),
      Item(key: '7', value: 'الأسبوع الماضي')
    ];
    List<Item> sort = [
      Item(key: '1', value: 'من القديم للجديد'),
      Item(key: '0', value: 'من الجديد للقديم'),
    ];
    List<Item> shift = [
      Item(key: '0', value: 'المبيعات والتجزئة'),
      Item(key: '1', value: 'المالية'),
      Item(key: '2', value: 'التصنيع'),
    ];
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.white,
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.r),
                topLeft: Radius.circular(10.r))),
        builder: (context) {
          return Container(
            margin: EdgeInsets.only(right: .05.sw, left: .05.sw),
            width: 1.sw,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 5.h,
                ),
                SizedBox(
                  width: .2.sw,
                  child: const Divider(
                    thickness: 5,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    Text(
                      'تصفية حسب',
                      style: TextStyle(
                          fontFamily: AppFonts.mainfont,
                          fontSize: 20.sp,
                          color: const Color(0xff006996),
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                            width: 36.w,
                            height: 36.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              color: Colors.grey.withOpacity(.1),
                            ),
                            child: Icon(
                              Icons.close,
                              color: const Color(0xff006996),
                              size: 18.sp,
                            ))),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Text(
                      'فترة المناوبة',
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: const Color(0xff12123C),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50.h,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: shift
                        .map((e) => FilterItem(
                              data: e,
                              isSelected: e.key == '' ? true : false,
                              onSelect: (Item selectedItem) {},
                            ))
                        .toList(),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    Text(
                      'نوع الشركة',
                      style: TextStyle(
                          fontFamily: AppFonts.mainfont,
                          fontSize: 14.sp,
                          color: const Color(0xff12123C),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50.h,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: companyType
                        .map((e) => FilterItem(
                              data: e,
                              isSelected: e.key == '' ? true : false,
                              onSelect: (Item selectedItem) {},
                            ))
                        .toList(),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    Text(
                      'تاريخ النشر',
                      style: TextStyle(
                          fontFamily: AppFonts.mainfont,
                          fontSize: 14.sp,
                          color: const Color(0xff12123C),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50.h,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: date
                        .map((e) => FilterItem(
                              data: e,
                              isSelected: e.key == '' ? true : false,
                              onSelect: (Item selectedItem) {},
                            ))
                        .toList(),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    Text(
                      'ترتيب حسب',
                      style: TextStyle(
                          fontFamily: AppFonts.mainfont,
                          fontSize: 14.sp,
                          color: const Color(0xff12123C),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50.h,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: sort
                        .map((e) => FilterItem(
                              data: e,
                              isSelected: e.key == '' ? true : false,
                              onSelect: (Item selectedItem) {},
                            ))
                        .toList(),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Button(
                    height: 45.h,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    text: 'تطبيق',
                    color: AppColors.mainColor,
                    onPressed: () async {}),
                SizedBox(
                  height: 20.h,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'امسح الكل',
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return DrawerCustomScreen(
      zoomDrawerController: _drawerController,
      menu: Data.userData == null
          ? const MenuDrawer()
          : const MenuDrawerLoggedIn(),
      screen: MainScreen(
        showFilter: showFilter,
      ),
    );
  }
}
