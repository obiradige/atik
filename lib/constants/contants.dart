import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class Constants {


  static Color greens2 = const Color(0xFF95F719);
  static Color greens = const Color(0xFF41B009 );
  static Color oranges = const Color(0xFFF2A027);
  static Color whites = const Color(0xFFFFFFFF);
  static Color amaranth = const Color(0xFFE52B50);

  static String getBaseUrl() => 'https://anibalbilisim.com/sifiratik';

  Future<bool> checkInternetConnection() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  }
  return false;
}
  
}