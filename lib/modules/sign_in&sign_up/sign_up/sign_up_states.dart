

import '../../../models/user/user_data_model.dart';

abstract class SignUpStates {}

class SignUpInitialState extends SignUpStates {}

class SignUpLoadingState extends SignUpStates {}

class SignUpSuccessState extends SignUpStates {
  final UserDataModel userDataModel;

  SignUpSuccessState(this.userDataModel);
}

class RegPassVisState extends SignUpStates {}

class SignUpErrorState extends SignUpStates {}
