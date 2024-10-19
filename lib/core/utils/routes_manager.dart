

import 'package:chat_mindest/auth_module/presentation/screens/login_screen/login_screen.dart';
import 'package:chat_mindest/auth_module/presentation/screens/register_screen/register_screen.dart';
import 'package:chat_mindest/chat_module/presentation/screens/chat_screen/chat_screen.dart';
import 'package:chat_mindest/core/utils/strings_manager.dart';
import 'package:flutter/material.dart';

import '../../auth_module/domain/entities/user.dart';
import '../../chat_module/presentation/screens/home_screen/home_screen.dart';





class Routes {
  static const String homeRoute = "/homeRoute";
  static const String login = "/loginRoute";
  static const String register = "/registerRoute";
  static const String chatRoute = "/chatRoute";
  static late  AppUser receiverUser ;

}

class RouteGenerator {

  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) =>   const HomeScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (_) =>   const LoginScreen());
      case Routes.register:
        return MaterialPageRoute(builder: (_) =>   const RegisterScreen());
      case Routes.chatRoute:
        return MaterialPageRoute(builder: (_) =>    ChatScreen(receiverUser: Routes.receiverUser));

      default:
        return unDefinedRoute();
    }
  }


  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(
            title: const Text(StringsManager.noRouteManager),
          ),
          body: const Center(
            child: Text(StringsManager.noRouteManager),
          ),
        ));
  }
}
