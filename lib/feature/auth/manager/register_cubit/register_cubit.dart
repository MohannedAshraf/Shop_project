import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ntigradproject/feature/auth/data/repo/profile_repo.dart';
import 'package:ntigradproject/feature/auth/manager/register_cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  static RegisterCubit get(context) => BlocProvider.of(context);
  RegisterCubit._internal() : super(RegisterInit());
  static final RegisterCubit _instance = RegisterCubit._internal();
  factory RegisterCubit() => _instance;
  ProfileRepo repo = ProfileRepo();

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  void onRegister() async {
    if (validate()) {
      emit(RegisterLoading());
      var response = await repo.register(
        username: username.text,
        password: password.text,
        email: email.text,
        phone: phone.text,
      );
      response.fold(
        (error) {
          emit(RegisterError(error));
        },
        (r) {
          emit(RegisterSuccess(r!));
        },
      );
    }
  }

  bool validate() {
    return formKey.currentState?.validate() ?? false;
  }
}
