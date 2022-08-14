import 'package:atik/constants/contants.dart';
import 'package:atik/constants/main_button.dart';
import 'package:atik/constants/recycle_list.dart';
import 'package:atik/features/confirm/view/confirmation_page.dart';
import 'package:atik/features/home/cubit/home_cubit.dart';
import 'package:atik/features/recycle/cubit/calculation_cubit.dart';
import 'package:atik/model/product_detail_model.dart';
import 'package:atik/model/product_model.dart';
import 'package:atik/model/selected_product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculationPage extends StatelessWidget {
  CalculationPage({super.key});

  final FocusScopeNode _node = FocusScopeNode();
  final _formKey = GlobalKey<FormState>();
  

  final List<SelectedProductModel> _values = [];

  @override
  Widget build(BuildContext context) {
    final calculationCubit = context.watch<CalculationCubit>().state;
    final homeCubit = context.watch<HomeCubit>().state;
    double h = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
            
              if (calculationCubit.calculationPageStateStatus ==
                  CalculationPageStateStatus.loading)
                const SizedBox(
                  height: 200,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              else
              SizedBox(
              height: h * 0.02,
            ),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  SizedBox(),
                  Text(
                    "Atık Türü",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  Text("Birim Fiyatı",
                      style: TextStyle(color: Colors.black, fontSize: 16)),
                ],
              ),
            ),
            SizedBox(
              height: h * 0.01,
            ),
                Expanded(
                  child: Form(
                    key: _formKey,
                    child: FocusScope(
                      node: _node,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: calculationCubit.products?.length ?? 0,
                        itemBuilder: (context, index) {
                          final product =
                              calculationCubit.products!.elementAt(index);
                          final productDetail = calculationCubit
                              .productDetails!
                              .firstWhere((d) => d.id == product.productId);
                          return RecycleListTile(
                            node: _node,
                            onChangeText: (count) => _onUpdate(
                              count: count,
                              product: product,
                              productDetail: productDetail,
                            ),
                            product: product,
                            productDetail: productDetail,
                            isFirstItem: index == 0,
                            isLastItem: index ==
                                (calculationCubit.products!.length + 1),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              MainButton(
                text: 'Hesapla',
                onPressed: () {
                  
                  if (_values.isNotEmpty) {
                    FocusScope.of(context).unfocus();
                    Future.delayed(const Duration(milliseconds: 200), () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ConfirmationPage(selectedProducts: _values),
                        ),
                      );
                    }).then((value) => _formKey.currentState!.reset());
                  }
                },
                color: Constants.greens,
                color2: Constants.greens,
                isLoading: calculationCubit.calculationPageStateStatus ==
                    CalculationPageStateStatus.calculating,
              ),
              const SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }

  void _onUpdate({
    required String count,
    required BaseProductModel product,
    required BaseProductDetailModel productDetail,
  }) {
    var foundId = -1;
    for (final sp in _values) {
      if (sp.id == product.id) {
        foundId = int.parse(product.id);
        break;
      }
    }
    if (foundId != -1) {
      _values.removeWhere((sp) => foundId == int.parse(sp.id));
    }

    if (count != '') {
      _values.add(
        SelectedProductModel(
          id: product.id,
          count: double.parse(count),
          productPrice: double.parse(product.price),
          productName: productDetail.productName,
          productUnit: productDetail.productUnit,
        ),
      );
    }
  }
}
