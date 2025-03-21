import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ntigradproject/core/resources_manager/default-appbar.dart';
import 'package:ntigradproject/core/utils/app-colors.dart';
import 'package:ntigradproject/core/utils/app_icons.dart';
import 'package:ntigradproject/core/utils/app_strings.dart';
import 'package:ntigradproject/feature/auth/manager/login_cubit/login_cubit.dart';
import 'package:ntigradproject/feature/auth/manager/login_cubit/login_state.dart';
import 'package:ntigradproject/feature/auth/view/widget/default_textform.dart';
import 'package:ntigradproject/feature/home/view/home_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(leadingicon: Icon(Icons.arrow_back_ios)),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            AppStrings.welcome,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 45),
          MyTextFormField(
            controller: LoginCubit.get(context).email,
            bottommargin: 20,
            labeltext: AppStrings.email,
            icon: MyAppIcons.email,
            validator: (String? text) {
              String error;
              if (text != null) {
                if (text.isNotEmpty) {
                  final RegExp emailRegex = RegExp(
                    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                  );
                  if (emailRegex.hasMatch(text)) {
                    return null;
                  } else {
                    error = 'invalid email ';
                  }
                } else {
                  error = 'enter email';
                }
              } else {
                error = 'you must enter email';
              }
              return error;
            },
          ),
          MyTextFormField(
            controller: LoginCubit.get(context).password,
            validator: (String? text) {
              String error;
              if (text != null) {
                if (text.isNotEmpty) {
                  if (text.length >= 6) {
                    return null;
                  } else {
                    error = 'Password must be more than 5';
                  }
                } else {
                  error = 'Password must be not empty';
                }
              } else {
                error = 'You must assign Password';
              }
              return error;
            },
            bottommargin: 10,
            labeltext: AppStrings.password,
            icon: MyAppIcons.password,
            endicon: Icon(Icons.remove_red_eye_outlined),
          ),
          SizedBox(height: 56),
          BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccess) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Login Success')));
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeView()),
                );
              } else if (state is LoginError) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.error)));
              }
            },
            builder: (context, state) {
              if (state is LoginLoading) {
                return CircularProgressIndicator();
              }
              return Container(
                width: double.infinity,
                height: 55,
                margin: EdgeInsets.symmetric(horizontal: 29),
                decoration: BoxDecoration(
                  color: MyAppColors.red,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    AppStrings.login,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: MyAppColors.background,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
