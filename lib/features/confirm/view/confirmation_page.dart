import 'package:atik/constants/contants.dart';
import 'package:atik/constants/total_sum.dart';
import 'package:atik/features/confirm/cubit/confirm_cubit.dart';
import 'package:atik/features/home/cubit/home_cubit.dart';
import 'package:atik/features/recycle/view/recyler_screen.dart';
import 'package:atik/model/selected_product_model.dart';
import 'package:atik/widgets/button_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfirmationPage extends StatelessWidget {
  const ConfirmationPage({Key? key, required this.selectedProducts})
      : super(key: key);
  final List<SelectedProductModel> selectedProducts;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.width;
    final homeCubit = context.watch<HomeCubit>().state;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Constants.whites,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Onay Ekranı",
            style: TextStyle(fontSize: 24, color: Constants.greens),
          ),
          leading: IconButton(
              icon:
                  Icon(Icons.arrow_back, color: Constants.greens, size: 30),
              onPressed: () {
                 Navigator.of(context).pop();
              })),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * 0.1),
        child: Column(
          children: [
             Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network(
                    '${Constants.getBaseUrl()}/${homeCubit.baseMunicipalityModel?.image}',
                    scale: 10,
                  ),

                  Column(
                    children: [
                      Image.asset(
                    "assets/person.png",
                    width: w * 0.13,
                    height: h * 0.12,
                    fit: BoxFit.fill,
                  ),
                      Text(homeCubit.baseMunicipalityModel!.municipalityName.toString(),style: TextStyle(fontWeight: FontWeight.w700,fontSize:w * 0.042,color: Constants.greens),),
                    ],
                  ),
                  

                ],
             ),
            const Divider(thickness: 2,color:Colors.black,),
            Container(
              constraints: BoxConstraints(maxHeight: h * 0.24),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: selectedProducts.length,
                itemBuilder: (context, index) {
                  final product = selectedProducts.elementAt(index);
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 25,
                            child: Text(product.count.toString()),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 25,
                            child: Text(product.productUnit.toString()),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: SizedBox(
                            height: 25,
                            child: AutoSizeText(
                              product.productName.toString(),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: SizedBox(
                            height: 25,
                            child: Text(
                              textAlign: TextAlign.end,
                              '${(product.count * product.productPrice).toDouble().toStringAsFixed(2)} ₺',
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 2),
                  top: BorderSide(width: 2),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Text(
                      'TOPLAM',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: AutoSizeText(
                      textAlign: TextAlign.end,
                      '${findTotalSum(selectedProducts).toStringAsFixed(2)} ₺',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: h * 0.15,
                    child: ButtonWidget(
                      text: "Vazgeç",
                      color: Colors.black,
                      minusWidth:w * 0.65,
                      onPressed: () {
                         Navigator.pushAndRemoveUntil(
            context,
            // ignore: inference_failure_on_instance_creation
            MaterialPageRoute(builder: (context) =>   CalculationPage()),
            (Route<dynamic> route) => false,
          );
                      },
                      color2: Colors.black,
                      isLoading: false,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    height: h * 0.15,
                    child: ButtonWidget(
                      text: "Onayla",
                      color: Constants.greens,
                      minusWidth: w * 0.65,
                      onPressed: ()  {
                        context.read<ConfirmCubit>().onConfirm(
                              context: context,
                              amount: findTotalSum(selectedProducts),
                              list :selectedProducts
                              
                            );
                      },
                      color2: Constants.greens2,
                      isLoading: false,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
/*
 context.read<ConfirmCubit>().onConfirm(
                            context: context,
                            amount: findTotalSum(selectedProducts),
                          ); */