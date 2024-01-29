import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/user/user_data_model.dart';
import '../../../shared/network/end_points.dart';
import '../../../shared/network/remote/dio_helper.dart';
import 'sign_in_states.dart';

class SignInCubit extends Cubit<SignInStates> {
  SignInCubit(initialState) : super(SignInInitialState());

  static SignInCubit get(context) => BlocProvider.of(context);

  UserDataModel? userDataModel;
  Future<void> userLogin({
    required String username,
    required String password,
  })async {
    emit(SignInLoadingState());
    DioHelper.postData(
      url: LOGIN,
      data: {
        'username': username,
        'password': password,
      },
    ).then((value) {
      debugPrint("object");
      userDataModel = UserDataModel.fromJson(value.data);
      emit(SignInSuccessState(userDataModel!));
    }).catchError((error) {
      emit(SignInErrorState());
      debugPrint('ERROR : ${error.toString()}');
    });
  }



  IconData suffix = Icons.visibility;
  bool isPassword = true;
  void changePassVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility : Icons.visibility_off;
    emit(PassVisState());
  }


}
