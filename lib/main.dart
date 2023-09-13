import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:my_profile/service/service_locator.dart';
import 'package:my_profile/utils/colors.dart';
import 'package:my_profile/view/app_routes.dart';

import 'firebase_options.dart';
import 'model/user_model.dart';

void main() async {
  setupLocator();
  await Hive.openBox('users');
  Hive.registerAdapter(UserModelAdapter());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(
          MediaQuery.sizeOf(context).width, MediaQuery.sizeOf(context).height),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      child: MaterialApp(
        title: 'My Profile',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoutes.onGenerateRoute,
        navigatorKey: navigatorKey,
        theme: ThemeData(
          primaryColor: ColorsConstants.primaryColor,
          scaffoldBackgroundColor: ColorsConstants.backgroundColor,
          colorScheme:
              ColorScheme.fromSeed(seedColor: ColorsConstants.primaryColor),
          useMaterial3: true,
        ),
      ),
    );
  }
}
