import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ntigradproject/core/resources_manager/default-appbar.dart';
import 'package:ntigradproject/core/utils/app-colors.dart';
import 'package:ntigradproject/core/utils/app_icons.dart';
import 'package:ntigradproject/core/utils/app_strings.dart';
import 'package:ntigradproject/feature/auth/manager/login_cubit/login_cubit.dart';
import 'package:ntigradproject/feature/auth/manager/login_cubit/login_state.dart';
import 'package:ntigradproject/feature/auth/view/login_view.dart';
import 'package:ntigradproject/feature/auth/view/widget/default_textform.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(leadingicon: Icon(Icons.arrow_back_ios)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            AppStrings.createacc,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 45),
          MyTextFormField(
            validator: (String? text) {
              String error;
              if (text != null) {
                if (text.isNotEmpty) {
                  final RegExp nameRegex = RegExp(r'^[a-zA-Z ]+$');
                  if (nameRegex.hasMatch(text)) {
                    return null;
                  } else {
                    error = 'name must be in English';
                  }
                } else {
                  error = '  enter Name';
                }
              } else {
                error = '  you must assighn Name';
              }
              return error;
            },
            bottommargin: 10,
            labeltext: AppStrings.fullname,
            icon: MyAppIcons.user,
          ),
          MyTextFormField(
            validator: (String? text) {
              String error;
              if (text != null) {
                if (text.isNotEmpty) {
                  final RegExp phoneRegex = RegExp(
                    r'^(010|011|012|015)[0-9]{8}$',
                  );
                  if (phoneRegex.hasMatch(text)) {
                    return null;
                  } else {
                    error = 'Invalid phone number.';
                  }
                } else {
                  error = ' enter phone number ';
                }
              } else {
                error = '  you must assighn phone number ';
              }
              return error;
            },

            bottommargin: 10,
            labeltext: AppStrings.phone,
            icon: MyAppIcons.call,
          ),
          MyTextFormField(
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
            bottommargin: 10,
            labeltext: AppStrings.email,
            icon: MyAppIcons.email,
          ),
          MyTextFormField(
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
          MyTextFormField(
            bottommargin: 21,
            labeltext: AppStrings.confirmpass,
            icon: MyAppIcons.password,
            endicon: Icon(Icons.remove_red_eye_outlined),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    AppStrings.registertext1,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: MyAppColors.textcolor,
                    ),
                  ),
                  Text(
                    AppStrings.register,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: MyAppColors.red,
                    ),
                  ),
                  Text(
                    AppStrings.registertext2,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: MyAppColors.textcolor,
                    ),
                  ),
                ],
              ),
              Text(
                AppStrings.registertext3,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: MyAppColors.textcolor,
                ),
              ),
            ],
          ),
          SizedBox(height: 28),

          BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccess) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Login Success')));
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginView()),
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
                    AppStrings.register,
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
