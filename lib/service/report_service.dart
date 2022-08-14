import 'package:atik/constants/locator.dart';
import 'package:atik/constants/secure_storage.dart';
import 'package:atik/model/order_model.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';


class ReportService {
  final Dio _dio = getIt<Dio>();
  final SecureStorage _secureStorage = getIt<SecureStorage>();

  Future<List<BaseOrder>> getOrders({required DateTime date}) async {
    final userId = await _secureStorage.findKey('userId');
    final formattedDate = DateFormat('yyyy-MM-dd').format(date).toString();
    try{
      final response =  await _dio.get('/get_orders?user_id=$userId&date=$formattedDate');
      final order = OrderModel.fromJson(response.data as Map<String,dynamic>);
      return order.data;
    }catch(e){
      throw Exception(e);
    }
  }
}