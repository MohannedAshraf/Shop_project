import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ntigradproject/feature/auth/manager/login_cubit/login_cubit.dart';
import 'package:ntigradproject/feature/home/view/home_view.dart';

import 'package:ntigradproject/feature/profile/view/main_profile.dart';
import 'package:ntigradproject/feature/profile/view/my_profile_view.dart';
import 'package:ntigradproject/feature/profile/view/settings_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ), // ✅ توفير LoginCubit هنا
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SettingsView(),
      ),
    );
  }
}
