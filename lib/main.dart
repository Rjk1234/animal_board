import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'feature/animalboard/application/controller.dart';
import 'feature/pages/home_page.dart';
import '../../config/app_constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AnimalProvider>(create: (_) => AnimalProvider()),
        ChangeNotifierProvider<UIThemeDataProvider>(
            create: (_) => UIThemeDataProvider()),
      ],
      child: MaterialApp(
        theme: themeData,
        home: const HomePage(),
      ),
    );
  }
}
