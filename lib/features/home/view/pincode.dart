import 'package:atik/constants/contants.dart';
import 'package:atik/constants/locator.dart';
import 'package:atik/constants/secure_storage.dart';
import 'package:atik/features/recycle/view/recyler_screen.dart';
import 'package:atik/widgets/button_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class PinCode extends StatelessWidget {
  PinCode({
    Key? key,
  }) : super(key: key);
  final pinCodeForm = GlobalKey<FormState>();
  TextEditingController pincodeController = TextEditingController();
  final _secureStorage = getIt<SecureStorage>();
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Constants.greens, size: 30),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        backgroundColor: Constants.whites,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Kod Ekranı',
          style: TextStyle(fontSize: 24, color: Constants.greens),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            key: pinCodeForm,
            child: TextFormField(
              maxLength: 14,
              autofocus: true,
              keyboardType: TextInputType.number,
              controller: pincodeController,
              style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.5),
              textAlign: TextAlign.center,
              cursorColor: Colors.black,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ],
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding:
                      EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                  hintText: "Kodu Giriniz"),
              validator: (value) {
                if (value!.length != 14) {
                  return "14 haneli karakteri giriniz";
                }
                return null;
              },
            ),
          ),
          SizedBox(
            height: h * 0.041,
          ),
          SizedBox(
            height: h * 0.15,
            child: ButtonWidget(
              text: "Gönder",
              minusWidth: w * 0.3,
              color: Constants.greens,
              color2: Constants.greens2,
              onPressed: () async {
                var valid = pinCodeForm.currentState!.validate();
                if (valid) {
                  await _secureStorage.storeKey(
                      key: 'pinCode', value: pincodeController.text);

                  // ignore: use_build_context_synchronously
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CalculationPage(),
                    ),
                  );
                }
              },
              isLoading: false,
            ),
          )
        ],
      ),
    );
  }
}
