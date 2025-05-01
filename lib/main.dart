import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:prokoders_login_task/core/util/service_locator.dart';
import 'package:prokoders_login_task/features/authentication/provider/auth_provider.dart';
import 'package:prokoders_login_task/features/items/data/repos/item_repository_implementation.dart';
import 'package:prokoders_login_task/features/items/provider/items_provider.dart';
import 'package:prokoders_login_task/firebase_options.dart';
import 'package:prokoders_login_task/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupServiceLocator();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(
          create:
              (_) => ItemProvider(getIt.get<ItemRepositoryImplementation>()),
          child: const MyApp(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(411.42857142857144, 866.2857142857143),
      child: MaterialApp(
        home: SplashScreen(),
      ),
    );
  }
}
