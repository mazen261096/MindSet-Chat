

import 'package:chat_mindest/auth_module/presentation/screens/register_screen/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_module/presentation/controller/auth_bloc.dart';
import 'auth_module/presentation/controller/auth_states.dart';
import 'auth_module/presentation/screens/login_screen/login_screen.dart';
import 'bloc_observer.dart';
import 'chat_module/presentation/screens/home_screen/home_screen.dart';
import 'core/services/service_locator.dart';
import 'core/utils/routes_manager.dart';
import 'core/utils/strings_manager.dart';
import 'firebase_options.dart';
Future<void> main() async {
  Bloc.observer = MyBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  ServiceLocator.initSl();
  runApp(
    BlocProvider<AuthBloc>(
      create: (BuildContext context) => sl<AuthBloc>(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: StringsManager.appName,
      onGenerateRoute: RouteGenerator.getRoute,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}