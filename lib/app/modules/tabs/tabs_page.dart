import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'pages/profile/profile_page.dart';
import 'pages/settings/settings_page.dart';
import 'submodules/home/home_module.dart';
import 'tabs_controller.dart';

class TabsPage extends StatefulWidget {
  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends ModularState<TabsPage, TabsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller.pageViewController,
        children: [
          RouterOutlet(module: HomeModule()),
          SettingsPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: AnimatedBuilder(
          animation: controller.pageViewController,
          builder: (context, snapshot) {
            return BottomNavigationBar(
              currentIndex: controller.pageViewController?.page?.round() ?? 0,
              onTap: (index) {
                controller.pageViewController.jumpToPage(index);
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), title: Text('Home')),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), title: Text('Settings')),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline), title: Text('Profile')),
              ],
            );
          }),
    );
  }
}
