import 'package:atik/constants/locator.dart';
import 'package:atik/constants/secure_storage.dart';
import 'package:atik/model/product_detail_model.dart';
import 'package:atik/model/product_model.dart';
import 'package:dio/dio.dart';

class RecyclerService {
  final _dio = getIt<Dio>();
  final _secureStorage = getIt<SecureStorage>();

    Future<List<BaseProductModel>> getProducts() async {
    final municipalityId = await _secureStorage.findKey('municipalityId');
    final companyId = await _secureStorage.findKey('companyId');
    final location = await _secureStorage.findKey('location');

    try {
      final response = await _dio.get(
        '/get_products?municipality_id=$municipalityId&company_id=$companyId&location=$location',
      );
      final products =
          ProductModel.fromJson(response.data as Map<String, dynamic>).data;

      return products;
    } catch (e) {
      throw Exception(e);
    }
  }
  Future<BaseProductDetailModel> getProductDetail(String productId) async {
    try {
      final response =
          await _dio.get('/get_product_name?product_id=$productId');
      final product =
          ProductDetailModel.fromJson(response.data as Map<String, dynamic>);
      return product.data;
    } catch (e) {
      throw Exception(e);
    }
  }
}