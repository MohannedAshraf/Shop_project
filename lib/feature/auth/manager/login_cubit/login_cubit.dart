import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ntigradproject/feature/auth/data/repo/profile_repo.dart';
import 'package:ntigradproject/feature/auth/manager/login_cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  static LoginCubit get(context) => BlocProvider.of(context);

  LoginCubit._internal() : super(LoginInit());
  static final LoginCubit _instance = LoginCubit._internal();
  factory LoginCubit() => _instance;

  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  ProfileRepo repo = ProfileRepo();
  void onloginPressed() async {
    if (validate()) {
      emit(LoginLoading());
      var response = await repo.login(
        email: email.text,
        password: password.text,
      );
      response.fold(
        (error) {
          emit(LoginError(error));
        },
        (r) {
          emit(LoginSuccess(r));
        },
      );
    }
  }

  bool validate() {
    return formKey.currentState?.validate() ?? false;
  }
}
