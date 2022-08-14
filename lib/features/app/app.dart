import 'package:atik/features/confirm/cubit/confirm_cubit.dart';
import 'package:atik/features/home/cubit/home_cubit.dart';
import 'package:atik/features/login/cubit/login_cubit.dart';
import 'package:atik/features/recycle/cubit/calculation_cubit.dart';
import 'package:atik/features/reports/cubit/report_cubit.dart';
import 'package:atik/features/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => HomeCubit()..getMunicipalityy()),
        BlocProvider(create: (context) => CalculationCubit()..getProducts()),
        BlocProvider(create: (context) => ConfirmCubit()),
        BlocProvider(create: (context) => ReportCubit())
      
      ],
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        home:   SplashPage()
      ),
    );
  }
}