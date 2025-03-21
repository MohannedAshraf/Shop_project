import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ntigradproject/core/utils/app-colors.dart';
import 'package:ntigradproject/feature/auth/manager/login_cubit/login_cubit.dart';
import 'package:ntigradproject/feature/auth/view/login_view.dart';

import 'package:ntigradproject/feature/auth/view/register_view.dart';
import 'package:ntigradproject/feature/home/view/final_home_view.dart';
import 'package:ntigradproject/feature/home/view/home_view.dart';
import 'package:ntigradproject/feature/start/view/splash_view.dart';

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
        home: FinalHomeView(),
      ),
    );
  }
}
