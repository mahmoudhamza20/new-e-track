import 'package:etrack/components/drawer_custom.dart';
import 'package:etrack/screens/user_screens/user_profile_screen/components/menu_drawer_logedin.dart';
import 'package:etrack/screens/user_screens/user_profile_screen/components/user_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final _drawerController = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    return DrawerCustomScreen(
      zoomDrawerController: _drawerController,
      menu: const MenuDrawerLoggedIn(),
      screen: const UserMainScreen(),
    );
  }
}
