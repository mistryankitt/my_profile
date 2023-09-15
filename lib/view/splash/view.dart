import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_profile/generated/assets.dart';
import 'package:rive/rive.dart';

import 'cubit.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SplashCubit(),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final cubit = BlocProvider.of<SplashCubit>(context);
    cubit.loadSplashScreen();
    return Scaffold(
      key: cubit.scaffoldKey,
      body: const RiveAnimation.asset(Assets.riveLoading,),
    );
  }
}


