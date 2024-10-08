import 'package:flutter/material.dart';
import 'package:flutter_listin/authentication/models/mock_user.dart';
import 'package:flutter_listin/authentication/screens/auth_screen.dart';
import 'package:flutter_listin/categories/screens/categories_screen.dart';
import 'package:flutter_listin/listins/models/listin.dart';
import 'package:flutter_listin/listins/screens/home_screen.dart';
import 'package:flutter_listin/products/screens/products_screen.dart';

class ListinRoutes {
  static const String auth = "auth";
  static const String home = "home";
  static const String products = "products";
  static const String categories="catergories";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case auth:
        return MaterialPageRoute(builder: (_) => const AuthScreen());
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen(user: MockUser()));
      case products:
        Listin listin = settings.arguments as Listin;
        return MaterialPageRoute(
            builder: (_) => ProductsScreen(listin: listin));
      case categories:
        return MaterialPageRoute(
            builder: (_) => const CategoriesScreen());
      default:
        return MaterialPageRoute(builder: (_) => const AuthScreen());
    }
  }
}
