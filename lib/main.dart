import 'package:flutter/material.dart';
import 'package:zhambyl_guide/utils/themes/app_theme.dart';
// import 'package:zhambyl_guide/controllers/panorama_explorer.dart';
import 'package:zhambyl_guide/views/main/main.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zhambyl Guide',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
