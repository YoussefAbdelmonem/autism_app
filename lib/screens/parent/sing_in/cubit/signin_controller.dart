import 'package:autism_project/screens/parent/sing_in/cubit/singin_states.dart';
import 'package:autism_project/shared/network/dio/dio_helper.dart';
import 'package:autism_project/shared/network/end_point.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class LoginCubit extends Cubit<LoginScreenStates>
{
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context)=> BlocProvider.of(context);

void userLogin({
  @required String email,
  @required String password,
})
  {

    emit(LoginLoadingState());
    DioHelper.postData(
        url: login,
        data:
        {
          "email":email,
          "password":password,
        }
    ).then((value) {
      print(value.data);
      emit(LoginSuccessState());

    }).catchError((error){

      emit(LoginErrorState(error.toString()));
      print(error.toString());

    });
  }
}
var emailController=TextEditingController();

var passwordController=TextEditingController();
bool checkbox=false;
var formKey =GlobalKey<FormState>();
bool isPassword=true;
bool valueFirst=false;