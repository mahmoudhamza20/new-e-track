import 'package:etrack/components/drawer_custom.dart';
import 'package:etrack/data/user_data.dart';
import 'package:etrack/screens/home_screen/components/menu_drawer.dart';
import 'package:etrack/screens/my_jobs/components/my_jobs_main.dart';
import 'package:etrack/screens/user_screens/user_profile_screen/components/menu_drawer_logedin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class MyJobsScreen extends StatelessWidget {
  MyJobsScreen({
    Key? key,
  }) : super(key: key);

  final _drawerController = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    return DrawerCustomScreen(
      zoomDrawerController: _drawerController,
      menu: Data.userData == null
          ? const MenuDrawer()
          : const MenuDrawerLoggedIn(),
      screen: const MyJobsMain(),
    );
  }
}
