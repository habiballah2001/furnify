import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/user/user_data_model.dart';
import '../../../shared/network/end_points.dart';
import '../../../shared/network/local/cache_helper.dart';
import '../../../shared/network/remote/dio_helper.dart';
import 'sign_up_states.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitialState());

  static SignUpCubit get(context) => BlocProvider.of(context);

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  UserDataModel userDataModel = UserDataModel();

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(RegPassVisState());
  }

  void userRegister({
    required String username,
    required String first_name,
    required String last_name,
    required String password,
    required String password2,
    required String email,
    required String phone,
    required String address,
    required int city,

  }) async{
    emit(SignUpLoadingState());
    DioHelper.postData(
      url: REGISTERATION,
      data: {
          "username": username,
          "email": email,
          "first_name": first_name,
          "last_name": last_name,
          "password": password,
          "password2": password2,
          "phone": phone,
          "address": address,
          "city": city.toString()
      },

    ).then((value) {
      userDataModel = UserDataModel.fromJson(value.data);
      debugPrint('User Data : ${value.data}');
      saveUserData();
      emit(SignUpSuccessState(userDataModel));
    }).catchError((error) {
      emit(SignUpErrorState());
      debugPrint('sign up ERROR : ${error.toString()}');
debugPrint("==========>${CacheHelper.getData(key: "token")}");
    });
  }
  saveUserData(){
    CacheHelper.saveData(key: "token", value:userDataModel.token );
  }

}
