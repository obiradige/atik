
import 'package:atik/model/product_detail_model.dart';
import 'package:atik/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RecycleListTile extends StatelessWidget {
  const RecycleListTile({
    super.key,
    required this.node,
    required this.onChangeText,
    required this.product,
    required this.productDetail,
    required this.isFirstItem,
    required this.isLastItem,
  });

  final FocusScopeNode node;
  final void Function(String) onChangeText;
  final BaseProductModel product;
  final BaseProductDetailModel productDetail;
  final bool isFirstItem;
  final bool isLastItem;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.width;
    return Container(
      height: h * 0.15,
      padding: const EdgeInsets.fromLTRB(0, 10, 20, 10),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: Image(
                height: h* 0.092,
                width: w * 0.085,
                color: Colors.orange,
                image: NetworkImage(
                  'https://anibalbilisim.com/sifiratik/${productDetail.productImage}',
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
             
              margin: const EdgeInsets.only(right: 5),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: const BoxDecoration(
                border: Border.symmetric(
                  vertical: BorderSide(),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    productDetail.productName,
                    maxLines: 1,
                    style: TextStyle(fontSize: w * 0.03),
                  ),
                  TextFormField(
                    key: Key(product.id),
                    autofocus: isFirstItem,
                    decoration: InputDecoration.collapsed(
                      hintText: '0.0 ${productDetail.productUnit}',
                      hintStyle: TextStyle(fontSize: w * 0.03)
                    ),
                    onChanged: onChangeText,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp('[1-9]+[.,]{0,1}[0-9]*'),
                      ),
                      TextInputFormatter.withFunction((oldValue, newValue) {
                        if (newValue.text.contains(',')) {
                          final a = newValue.text.replaceAll(',', '.');
                          return newValue.copyWith(text: a);
                        }
                        final afterDot = newValue.text.split('.')[1];
                        final beforeDot = newValue.text.split('.')[0];
                        if (afterDot.length > 2) {
                          return oldValue;
                        }

                        if (beforeDot.length > 3) {
                          return oldValue;
                        }

                        return newValue;
                      }),
                    ],
                    onEditingComplete: () =>
                        !isLastItem ? node.nextFocus() : node.unfocus(),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              height: 30,
              child: Center(
                child: Text(
                  '${product.price} TL',
                  style: TextStyle(fontSize: w * 0.03),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
