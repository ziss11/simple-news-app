import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/widgets/platform_widget.dart';

class SettingPage extends StatelessWidget {
  static const routeName = 'settings-page';

  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIOS,
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: _buildList(context),
    );
  }

  Widget _buildIOS(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Settings'),
      ),
      child: _buildList(context),
    );
  }

  Widget _buildList(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: [
        Material(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Dark theme',
              ),
              Switch.adaptive(
                value: false,
                onChanged: (isDark) {
                  defaultTargetPlatform == TargetPlatform.iOS
                      ? showCupertinoDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (context) {
                            return CupertinoAlertDialog(
                              title: const Text('Coming Soon!'),
                              content: const Text(
                                  'This feature will be coming soon!'),
                              actions: [
                                CupertinoDialogAction(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                          },
                        )
                      : showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Coming Soon!'),
                              content: const Text(
                                  'This feature will be coming soon!'),
                              actions: [
                                ElevatedButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
