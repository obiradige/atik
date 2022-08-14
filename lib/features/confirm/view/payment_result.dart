import 'package:atik/constants/contants.dart';
import 'package:atik/features/home/cubit/home_cubit.dart';
import 'package:atik/features/home/view/home_screen.dart';
import 'package:atik/widgets/button_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class PaymentResult extends StatelessWidget {
 PaymentResult({ Key? key, required this.totalPayment }) : super(key: key);
  final double totalPayment;
  final NumberFormat priceFormat = NumberFormat.decimalPattern('en_us');
    
  @override
  Widget build(BuildContext context){
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.width;
   
    final homeCubit = context.watch<HomeCubit>().state;
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
          elevation: 0.1,
          centerTitle: true,
          title: Text(
            '${homeCubit.baseMunicipalityModel?.municipalityName}',
            style: TextStyle(color: Constants.greens),
          ),
          leading: Center(
              child: Image.network(
                  '${Constants.getBaseUrl()}/${homeCubit.baseMunicipalityModel?.image}')),
        ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Container(
              width: w * 0.58,
              height: h * 0.30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    "assets/person.png",
                    width: w * 0.18,
                    height: h * 0.14,
                    fit: BoxFit.fill,
                  ),
                  AutoSizeText(
                    "${homeCubit.baseMunicipalityModel?.municipalityName}",
                   
                  )
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              width: w * 0.58,
              height: h * 0.7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    "assets/success.png",
                    width:w * 0.18,
                    height: h * 0.12,
                    fit: BoxFit.fill,
                  ),
                  const AutoSizeText(
                    "Teşekkürler",
                   
                  ),
                   AutoSizeText(
                    ''
                   
                  ),
                  AutoSizeText(
                        '${priceFormat.format(totalPayment)} ₺',
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w700,
                          color: Constants.greens,
                        ),
                      ),
                  const AutoSizeText(
                    "yüklendi",
                  ),
                  Container(
                      width: w * 0.45,
                      height: h * 0.087,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Constants.greens2),
                      child: Center(
                        child: Text(
                          "Yükleme Başarılı",
                          style: TextStyle(
                              fontSize: w * 0.052, color: Colors.white),
                        ),
                      ))
                ],
              ),
            ),
          ),
          SizedBox(
            height: h * 0.15,
            child: ButtonWidget(
              text: "Ana Menüye Dön",
              color: Constants.greens,
              minusWidth: w * 0.38,
              onPressed: ()  {
                Navigator.pushAndRemoveUntil(
            context,
            // ignore: inference_failure_on_instance_creation
            MaterialPageRoute(builder: (context) =>   HomeScreen()),
            (Route<dynamic> route) => false,
          );
              },
              color2: Constants.greens2, isLoading: false,
            ),
          )
        ],
      ),
    );
  }
}