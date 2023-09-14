import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_profile/model/user_model.dart';
import 'package:my_profile/service/service_locator.dart';
import 'package:my_profile/utils/colors.dart';
import 'package:my_profile/view/app_routes.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'firebase_options.dart';

void main() async {
  setupLocator();

  WidgetsFlutterBinding.ensureInitialized();


    await Hive.initFlutter();
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(UserModelAdapter());
    }

    // open a box
    await Hive.openBox('users');


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
