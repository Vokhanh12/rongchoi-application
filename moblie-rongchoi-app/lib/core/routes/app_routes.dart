import 'package:flutter/material.dart';
import 'package:rongchoi_application/features/presentation/screen/splash.dart';

sealed class AppRouter {
  static const String splash = '/';
  static const String login = '/login';
  static const String root = '/root';
  static const String goodsDocumentRule = '/goods-document-rule';
  static const String goodsDocumentScreen = '/goods-document-screen';
  static const String inventoryDetails = '/inventory-details';
  static const String inventoryShow = "/inventory-show";

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      default:
        throw const RouteException('Route not found!');
    }
  }
}