import 'dart:async';
import 'package:atik/constants/locator.dart';
import 'package:atik/constants/secure_storage.dart';
import 'package:atik/constants/size_config.dart';
import 'package:atik/constants/total_sum.dart';
import 'package:atik/features/home/view/home_screen.dart';
import 'package:atik/features/welcome/welcome_screen.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
   SplashPage({Key? key}) : super(key: key);

  final _secureStorage = getIt<SecureStorage>();
  
  @override
  // ignore: library_private_types_in_public_api
  _SplashState createState() =>  _SplashState();
}

class _SplashState extends State<SplashPage> {
  startTime() async {

    var duration = const Duration(seconds: 3);
    return  Timer(duration, () async {
      navigationPageIntro(isUserLoggedIn: await widget._secureStorage.findKey('userId'),);
    });
  }

  @override
  void initState() {
    super.initState();

    
    checkInternetConnection().then((internet) {
      if (internet) {
        // Internet Present Case
        startTime();
      } else {
        // No-Internet Case
        showAlertDialog(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(child:  Image(image: AssetImage('assets/atik_hesapla.png',),width: 300,height: 300,)),
    );
  }

  Future<bool> check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  showAlertDialog(BuildContext context) {
    Widget continueButton = ElevatedButton(
      child: const Text("Retry"),
      onPressed: () {
        Navigator.pop(context);
        checkInternetConnection().then((internet) {
          if (internet) {
            // Internet Present Case
            startTime();
          } else {
            // No-Internet Case
            showAlertDialog(context);
          }
        });
      },
    );
    
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      elevation: 2,
      title: const Text("İnternet bağlantısı yok!"),
      content: const Text("Lütfen interneti açınız"),
      actions: [
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void navigationPageIntro({required isUserLoggedIn}) {

    isUserLoggedIn != null ?  Navigator.push(context,MaterialPageRoute(builder: (context) =>  HomeScreen(), ),) :  Navigator.push(context,MaterialPageRoute(builder: (context) => const WelcomeScreen(), ),);
  }
}