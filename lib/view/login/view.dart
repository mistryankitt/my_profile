import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_profile/generated/assets.dart';
import 'package:my_profile/utils/size.dart';
import 'package:my_profile/utils/ui_const.dart';
import 'package:my_profile/widgets/custom_button_widget.dart';
import 'package:my_profile/widgets/custom_textfield_widget.dart';
import 'package:rive/rive.dart';

import 'cubit.dart';
import 'state.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final cubit = BlocProvider.of<LoginCubit>(context);

    return Scaffold(
      body: Stack(
        children: [
          const RiveAnimation.asset(
            Assets.riveBack,
            fit: BoxFit.cover,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(
                sigmaX: 50, sigmaY: 50, tileMode: TileMode.mirror),
            child: Center(
                child: Padding(
              padding: const EdgeInsets.all(30.0).r,
              child: Container(
                width: 500.w,
                padding: const EdgeInsets.all(20),
                decoration: UiConstant.frostedGlassDecoration(),
                child: Form(
                  key: cubit.formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      UiConstant.normalText("Welcome", 20),
                      gapHeightSize15,
                      CTextFieldWidget(
                        hintText: "Username",
                        myControllers: cubit.emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "username can't be empty";
                          }
                        },
                      ),
                      gapHeightSize15,
                      CTextFieldWidget(
                        hintText: "Password",
                        textSecure: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "password can't be empty";
                          }
                        },
                        myControllers: cubit.passwordController,
                      ),
                      gapHeightSize15,
                      CustomButtonWidget(
                          text: "Sign in",
                          onTap: () {
                            cubit.loginUserM();
                          }),
                      gapHeightSize15,
                      CustomButtonWidget(
                          text: "Sign in with google ",
                          isIcon: true,
                          iconWidget: SvgPicture.asset(
                            Assets.iconsGoogle,
                            fit: BoxFit.contain,
                            height: MediaQuery.sizeOf(context).height * 0.02,
                            width: MediaQuery.sizeOf(context).width * 0.02,
                          ),
                          onTap: () {
                            cubit.googleSignInM();
                          })
                    ],
                  ),
                ),
              ),
            )),
          )
        ],
      ),
    );
  }
}
