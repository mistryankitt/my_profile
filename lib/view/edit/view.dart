import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_profile/generated/assets.dart';
import 'package:my_profile/model/user_model.dart';
import 'package:my_profile/utils/size.dart';
import 'package:my_profile/utils/ui_const.dart';
import 'package:my_profile/widgets/custom_textfield_widget.dart';
import 'package:rive/rive.dart';

import 'cubit.dart';
import 'state.dart';

class EditPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => EditCubit(),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final cubit = BlocProvider.of<EditCubit>(context);

    return WillPopScope(
      onWillPop: () async {
        cubit.showDialogM();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Edit Profile"),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ActionChip(
                label: Text("Save"),
                onPressed: () {
                  cubit.updateProfile();
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
                  child: FutureBuilder<UserModel>(
                    future: cubit.getUserInfo(),
                    builder: (context, snapshot) {

                      if(snapshot.data == null){
                        return CircularProgressIndicator.adaptive();
                      }
                      return Container(
                        height: 400.h,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipOval(
                                  child: Image.network(
                                snapshot.data!.profile!,
                                fit: BoxFit.cover,
                                height: 120,
                                width: 120,
                              )),
                              gapHeightSize15,
                              CTextFieldWidget(
                                hintText: "Email",
                                myControllers: cubit.emailController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "email can't be empty";
                                  }
                                },
                              ),
                              gapHeightSize15,
                              CTextFieldWidget(
                                hintText: "Name",
                                myControllers: cubit.nameController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "name can't be empty";
                                  }
                                },
                              ),
                              gapHeightSize15,
                              CTextFieldWidget(
                                hintText: "Skills",
                                myControllers: cubit.skillsController,
                              ),
                              gapHeightSize15,
                              CTextFieldWidget(
                                hintText: "Experience",
                                myControllers: cubit.experienceController,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )),
            )
          ],
        ),
      ),
    );
  }
}
