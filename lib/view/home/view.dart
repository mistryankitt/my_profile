import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_profile/generated/assets.dart';
import 'package:my_profile/model/user_model.dart';
import 'package:my_profile/utils/size.dart';
import 'package:my_profile/utils/ui_const.dart';
import 'package:my_profile/view/app_routes.dart';
import 'package:my_profile/widgets/custom_button_widget.dart';
import 'package:rive/rive.dart';

import 'cubit.dart';
import 'state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit(),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final cubit = BlocProvider.of<HomeCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ActionChip(
              label: Text("signout"),
              onPressed: () {
                cubit.signOut();
              },
            ),
          )
        ],
      ),
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
                child: FutureBuilder(
                  future: cubit.getUserInfo(),
                  builder: (context, snap) {
                    return BlocBuilder<HomeCubit, HomeState>(
                      builder: (context, state) {
                        if (state is UserDataLoaded) {
                          final userModel = state.userModel;
                          return Container(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      gapHeightSize15,
                                      UiConstant.normalText("Email :\n${userModel.email}", 14),
                                      gapHeightSize15,
                                      UiConstant.normalText("Name :\n${userModel.name}", 14),
                                      gapHeightSize15,
                                      userModel.skills!.isEmpty
                                          ? Container()
                                          : UiConstant.normalText("Skills :\n${userModel.skills}", 14),
                                      gapHeightSize15,
                                      userModel.experience!.isEmpty
                                          ? Container()
                                          : UiConstant.normalText(
                                        "Experience :\n${userModel.experience}",
                                        14,
                                      ),
                                      gapHeightSize15,
                                      CustomButtonWidget(
                                        text: "Edit profile",
                                        onTap: () {
                                          Navigator.pushNamed(
                                            context,
                                            AppRoutes.editProfilePage,
                                          ).then((value) {
                                            cubit.getUserInfo();
                                          });
                                        },
                                      )
                                    ],
                                  ),
                                ),
                                ClipOval(
                                  child: Image.network(
                                    userModel.profile!,
                                    fit: BoxFit.cover,
                                    height: 120,
                                    width: 120,
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return CircularProgressIndicator.adaptive();
                        }
                      },
                    );
                  }
                )
                ,
              ),
            )),
          )
        ],
      ),
    );
  }
}
