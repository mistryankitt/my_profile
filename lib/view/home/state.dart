import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_profile/model/user_model.dart';
import 'package:my_profile/service/service_locator.dart';
import 'package:my_profile/view/home/cubit.dart';

class HomeState {


  HomeState init() {
    return HomeState();
  }

  HomeState clone() {
    return HomeState();
  }



}

class UserDataLoaded extends HomeState {
  final UserModel userModel;

  UserDataLoaded(this.userModel);

  @override
  List<Object> get props => [userModel];
}
