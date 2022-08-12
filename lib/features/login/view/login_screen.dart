import 'package:atik/constants/contants.dart';
import 'package:atik/features/login/cubit/login_cubit.dart';
import 'package:atik/widgets/button_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.width;
   
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Constants.whites,
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Constants.greens, size: 30),
              onPressed: () {}),
          backgroundColor: Constants.whites,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Giriş Yapın',
            style: TextStyle(fontSize: 24, color: Constants.greens),
          ),
        ),
        body: Form(
            key: formKey,
            child: Column(
              children: [
                Center(
                  child: SizedBox(
                    width: w * 0.80,
                    child: TextFormField(
                      style: TextStyle(
                          fontSize: w * 0.05, color: Constants.greens),
                      controller: emailController,
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Constants.greens),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Constants.greens),
                          ),
                          label: const Text(
                            "Kullanıcı Adı / Mail",
                            style: TextStyle(color: Colors.black),
                          )),
                      validator: (value) {
                        if (emailController.text.length < 6) {
                          return "En az 6 karakter olmalıdır";
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 30),
                    width: w * 0.80,
                    child: TextFormField(
                      style: TextStyle(
                          fontSize: w * 0.05, color: Constants.greens),
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Constants.greens),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Constants.greens),
                          ),
                          label: const Text(
                            "Şifre",
                            style: TextStyle(color: Colors.black),
                          )),
                      validator: (value) {
                        if (passwordController.text.length < 6) {
                          return "En az 6 karakter olmalıdır";
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: h * 0.01,
                ),
                SizedBox(
                  height: h * 0.15,
                  child: ButtonWidget(
                    text: "Giriş Yap",
                    color: Constants.greens,
                    minusWidth: w * 0.2,
                    isLoading:
                        context.watch<LoginCubit>().state.loginStateStatus ==
                            LoginStateStatus.loading,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.read<LoginCubit>().onLogin(
                              context: context,
                              user: emailController.text,
                              password: passwordController.text,
                            );
                      }
                    },
                    color2: Constants.greens2,
                  ),
                )
              ],
            )));
  }
}
