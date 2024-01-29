
import '../../../models/user/user_data_model.dart';

abstract class SignInStates {}

class SignInInitialState extends SignInStates {}

class SignInLoadingState extends SignInStates {}

class SignInSuccessState extends SignInStates {
  final UserDataModel userDataModel;

  SignInSuccessState(this.userDataModel);
}

class PassVisState extends SignInStates {}

class SignInErrorState extends SignInStates {}
