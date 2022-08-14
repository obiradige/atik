import 'dart:math';

import 'package:atik/model/selected_product_model.dart';
import 'package:connectivity_plus/connectivity_plus.dart';


double _roundDouble(double value, int places) {
  final mod = pow(10.0, places);
  return (value * mod).round().toDouble() / mod;
}

double findTotalSum(List<SelectedProductModel> selectedProducts) {
  var sum = 0.0;
  for (final selectedProduct in selectedProducts) {
    final s =
        _roundDouble(selectedProduct.count * selectedProduct.productPrice, 2);
    sum += s;
  }
  return sum;
}
Future<bool> checkInternetConnection() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  }
  return false;
}