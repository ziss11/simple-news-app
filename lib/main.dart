import 'package:flutter/material.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/pages/detail_page.dart';
import 'package:news_app/pages/detail_web.dart';
import 'package:news_app/pages/home_page.dart';
import 'package:news_app/pages/main_page.dart';
import 'package:news_app/pages/setting_page.dart';
import 'package:news_app/provider/news_notifier.dart';
import 'package:news_app/service/api_service.dart';
import 'package:news_app/utils/styles.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NewsNotifier(
        service: ApiService(),
      ),
      builder: (context, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'News App',
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              elevation: 0,
            ),
            textTheme: myTextTheme,
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              selectedItemColor: secondaryColor,
              unselectedItemColor: Colors.grey,
            ),
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: primaryColor,
                  onPrimary: Colors.black,
                  secondary: secondaryColor,
                ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                primary: secondaryColor,
                onPrimary: primaryColor,
                textStyle: const TextStyle(),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
            ),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          initialRoute: MainPage.routeName,
          routes: {
            MainPage.routeName: (context) => const MainPage(),
            HomePage.routeName: (context) => const HomePage(),
            DetailPage.routeName: (context) => DetailPage(
                article: ModalRoute.of(context)?.settings.arguments as Article),
            DetailWeb.routeName: (context) => DetailWeb(
                url: ModalRoute.of(context)?.settings.arguments as String),
            SettingPage.routeName: (context) => const SettingPage(),
          },
        );
      },
    );
  }
}
