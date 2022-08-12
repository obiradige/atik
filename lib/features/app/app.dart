import 'package:atik/features/home/cubit/home_cubit.dart';
import 'package:atik/features/login/cubit/login_cubit.dart';
import 'package:atik/features/login/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Atık Hesapla',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => HomeCubit()..getMunicipalityy())  
      ],child:  LoginScreen()),
    );
  }
}