import 'dart:math';
import 'package:atik/constants/locator.dart';
import 'package:atik/constants/secure_storage.dart';
import 'package:atik/model/selected_product_model.dart';
import 'package:dio/dio.dart';

class ConfirmationService {
  final Dio _dio = getIt.get<Dio>(instanceName: 'macellanDio');
  final SecureStorage _secureStorage = getIt<SecureStorage>();

  Future<dynamic> confirmUser({
    required String amount,
    required List<SelectedProductModel> list,
  }) async {
    try {
      final referenceCode = await _secureStorage.findKey('pinCode');
      // ignore: inference_failure_on_function_invocation
    
      final response = await _dio.post(
        '/integration/deposit/cash/read-qr',
        data: {
          'amount': amount,
          'reference_code': '08$referenceCode',
        },
      );
      if(response.data['data']['status'] == "success")
      {
      Map isFull = {};
      Map isFull2 = {};
      List bir = [];

      var firstName = response.data['data']['user']['first_name'];
      var lastName = response.data['data']['user']['last_name'];
      var email = response.data['data']['user']['email'];
      var phone = response.data['data']['user']['phone'];
      for (var element in list) {
        Map<String, dynamic> element2 = {
          "product_name": element.productName,
          "product_field": element.count,
          "product_price": element.productPrice,
          "product_id": element.id,
        };
        bir.add(element2);

      //   isFull.addAll({'product_name': element2});
      //   isFull2.addAll({'product_id': element2});
      // print(isFull);
      // print(isFull2);

      }
      for(var element3 in bir){
        print("2");
        isFull.addAll({'product_name': element3});
        isFull2.addAll({'product_id': element3});
       
      }

       await Future.wait({
         sendDataOrder(isFull, isFull2, amount, firstName, lastName, email, phone)
       });
      }
     
      
      return response;
    } catch (e) {
      if (e is DioError) {}
    }
  }

  Future<void> sendDataOrder(Map isFull, Map isFull2, String amount,
      String firstName, String secondName, String email, String phone) async {
    
  final _dio2 = getIt<Dio>();
    const chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random rnd = Random();
    String getRandomString(int length) =>
        String.fromCharCodes(Iterable.generate(
            length, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
    String orderKey = getRandomString(14);

    
    final id = await _secureStorage.findKey('userId');
    final response = await _dio2.post(
      'api/v1/orders/',
      data: {
        "user_id": "2",
        "order_key": "jae12JKMn",
        "products": {"CAM":{"product_name":"CAM","product_field":12,"product_id":"1","product_price":2.4}},
        "products_test": {"CAM":{"product_name":"CAM","product_field":12,"product_id":"1","product_price":2.4}},
        "price": 1,
        "address": "Arapzade",
        "customer_info": {
          "name": "furkan",
          "surname": "erdogan",
          "email": "furkan@anibalbilisim.com",
          "phone": "00000000000"
        }
      },
    );
    print(response.data);
  }
}
