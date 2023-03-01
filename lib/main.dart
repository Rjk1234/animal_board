import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'feature/animalBoard/application/animal_provider.dart';
import 'core/schema/application/schema_provider.dart';
import 'core/pages/dashboard_page.dart';
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
        ChangeNotifierProvider<SchemaProvider>(create: (_) => SchemaProvider()),
      ],
      child: MaterialApp(
        theme: themeData,
        home: const DashboardPage(),
      ),
    );
  }
}
