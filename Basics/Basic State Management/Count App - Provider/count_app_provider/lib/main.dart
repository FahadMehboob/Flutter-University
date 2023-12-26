import 'package:count_app_provider/provider/favourite_provider.dart';
import 'package:count_app_provider/provider/screen_two_provider.dart';
import 'package:count_app_provider/provider/theme_changer_provider.dart';
import 'package:count_app_provider/screens/dark_theme_screen.dart';
import 'package:count_app_provider/screens/favourite/favourite_screen.dart';
import 'package:count_app_provider/screens/home_screen.dart';
import 'package:count_app_provider/screens/screen_two.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:count_app_provider/provider/homescreen_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => HomeScreenPorvider()),
          ChangeNotifierProvider(create: (_) => ScreenTwoProvider()),
          ChangeNotifierProvider(create: (_) => FavouriteItemProvider()),
          ChangeNotifierProvider(
            create: (_) => ThemeChangerProvider(),
          )
        ],
        child: Builder(
          builder: (BuildContext context) {
            final themeChanger = Provider.of<ThemeChangerProvider>(context);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              themeMode: themeChanger.themeMode,
              theme: ThemeData(
                brightness: Brightness.light,
                primarySwatch: Colors.deepPurple,
              ),
              darkTheme: ThemeData(
                brightness: Brightness.dark,
                primarySwatch: Colors.orange,
                appBarTheme: const AppBarTheme(color: Colors.amber),
              ),
              home: const DarkThemeScreen(),
            );
          },
        ));
  }
}
