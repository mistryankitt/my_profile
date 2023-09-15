import 'package:my_profile/model/user_model.dart';

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

  List<Object> get props => [userModel];
}
