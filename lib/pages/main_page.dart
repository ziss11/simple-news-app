import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/pages/home_page.dart';
import 'package:news_app/pages/setting_page.dart';
import 'package:news_app/widgets/platform_widget.dart';

class MainPage extends StatefulWidget {
  static const routeName = '/';

  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int navbarCurrentIdx = 0;

  final _pageList = const [
    HomePage(),
    SettingPage(),
  ];

  final _navbarList = [
    BottomNavigationBarItem(
      icon: Icon(defaultTargetPlatform == TargetPlatform.iOS
          ? CupertinoIcons.news
          : Icons.public),
      label: 'Headline',
    ),
    BottomNavigationBarItem(
      icon: Icon(defaultTargetPlatform == TargetPlatform.iOS
          ? CupertinoIcons.settings
          : Icons.settings),
      label: 'Settings',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIOS,
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navbarCurrentIdx,
        onTap: (idx) {
          setState(() {
            navbarCurrentIdx = idx;
          });
        },
        items: _navbarList,
      ),
      body: _pageList[navbarCurrentIdx],
    );
  }

  Widget _buildIOS(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: _navbarList,
      ),
      tabBuilder: (BuildContext context, int index) {
        return _pageList[navbarCurrentIdx];
      },
    );
  }
}
