import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ntigradproject/core/utils/app-colors.dart';
import 'package:ntigradproject/feature/auth/manager/login_cubit/login_cubit.dart';
import 'package:ntigradproject/feature/order/view/canceled_view.dart';
import 'package:ntigradproject/feature/order/view/order_complete_view.dart';
import 'package:ntigradproject/feature/order/view/order_details_view.dart';

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
        theme: ThemeData(scaffoldBackgroundColor: MyAppColors.background),
        debugShowCheckedModeBanner: false,
        home: OrderCompleteView(),
      ),
    );
  }
}
