import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery/views/favorite_screen.dart';
import 'package:grocery/views/home_screen.dart';
import 'package:grocery/themes/theme.dart';
import 'package:grocery/views/main_screen.dart';
import 'package:grocery/views/mycart_screen.dart';
import 'package:grocery/views/profile_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: '/main',
      routes: {
        '/main': (context) => const MainScreen(),
        '/home': (context) => const HomeScreen(),
        '/mycart': (context) => const MycartScreen(),
        '/favorite': (context) => const FavoriteScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    ),
  );
}
