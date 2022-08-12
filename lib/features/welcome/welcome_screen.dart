import 'package:atik/constants/contants.dart';
import 'package:atik/features/login/view/login_screen.dart';
import 'package:atik/widgets/button_widgets.dart';
import 'package:flutter/material.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: h * 2,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: h * 0.1,
              ),
              SizedBox(
                  width: w * 0.6,
                  height: h * 0.4,
                  child: Image.asset(
                    "assets/atik_hesapla.png",
                    fit: BoxFit.contain,
                  )),
              
              SizedBox(
              child: Text("Hoşgeldiniz",style: TextStyle(fontSize: w * 0.113,fontWeight: FontWeight.w300),),
              ),
              SizedBox(
                height: h * 0.1,
              ),
              SizedBox(
                  height: h * 0.15,
                  child: ButtonWidget(
                    text: "Kullanıcı Girişi",
                    color: Constants.greens,
                    minusWidth: w * 0.3,
                    isLoading: false,
                    onPressed: () {
                      Navigator.push(
                          context,
                          // ignore: inference_failure_on_instance_creation
                          MaterialPageRoute(builder: (context) =>  LoginScreen()),
                        );
                    },
                    color2: Constants.greens2,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}