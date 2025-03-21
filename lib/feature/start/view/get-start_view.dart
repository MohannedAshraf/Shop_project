// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:ntigradproject/core/resources_manager/my_button.dart';
import 'package:ntigradproject/core/utils/app-colors.dart';
import 'package:ntigradproject/core/utils/app_images.dart';
import 'package:ntigradproject/core/utils/app_strings.dart';
import 'package:ntigradproject/feature/auth/view/login_view.dart';
import 'package:ntigradproject/feature/auth/view/register_view.dart';

class GetStartView extends StatelessWidget {
  const GetStartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Image.asset(
            MyAppImage.getstart,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.43,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,

                colors: [
                  Colors.black.withAlpha(160),
                  Colors.black.withAlpha(0),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Text(
                  AppStrings.getstart1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 34,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                  ),
                ),
              ),
              Text(
                AppStrings.getstart2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
              MyButton(
                newscreen: LoginView(),
                top: 24,
                buttontext: AppStrings.login,
                buttoncolor: MyAppColors.red,
                textcolor: MyAppColors.background,
              ),
              MyButton(
                newscreen: RegisterView(),
                top: 0,
                buttontext: AppStrings.register,
                buttoncolor: MyAppColors.background,
                textcolor: MyAppColors.red,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
