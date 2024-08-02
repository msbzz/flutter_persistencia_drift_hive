import 'package:flutter/material.dart';
import 'package:flutter_listin/_core/listin_routes.dart';
import 'package:flutter_listin/_core/listin_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Listin',
      debugShowCheckedModeBanner: false,
      theme: ListinTheme.mainTheme,
      initialRoute: ListinRoutes.auth,
      onGenerateRoute: ListinRoutes.generateRoute,
    );
  }
}
