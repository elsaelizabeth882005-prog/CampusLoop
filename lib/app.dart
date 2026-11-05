import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'core/routes/app_router.dart';
import 'core/theme/app_theme.dart';

class CampusLoopApp extends StatefulWidget {
  const CampusLoopApp({super.key});

  @override
  State<CampusLoopApp> createState() => _CampusLoopAppState();
}

class _CampusLoopAppState extends State<CampusLoopApp> {
  ThemeMode _themeMode = ThemeMode.system;

  void _toggleTheme(bool isDark) {
    setState(() => _themeMode = isDark ? ThemeMode.dark : ThemeMode.light);
  }

  @override
  Widget build(BuildContext context) {
    final GoRouter router = createRouter(onThemeChanged: _toggleTheme);

    return MaterialApp.router(
      title: 'CampusLoop',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: _themeMode,
      routerConfig: router,
    );
  }
}
