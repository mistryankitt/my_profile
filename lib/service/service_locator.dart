
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_profile/view/home/cubit.dart';
import 'package:my_profile/view/splash/cubit.dart';

final locator = GetIt.instance;
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void setupLocator() {
  locator.registerLazySingleton<SplashCubit>(() => SplashCubit());
  locator.registerLazySingleton<HomeCubit>(() => HomeCubit());
}
