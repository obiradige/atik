import 'package:atik/constants/locator.dart';
import 'package:atik/constants/secure_storage.dart';
import 'package:atik/model/municipality_model.dart';
import 'package:dio/dio.dart';

class HomeService {
  final _dio = getIt<Dio>();
  final _secureStorage = getIt<SecureStorage>();
  Future<BaseMunicipalityModel> getMunicipality() async {
    final munId = await _secureStorage.findKey("municipalityId");
    try{
      final response = await _dio.get('/get_municipality/?id=$munId');
      final municipalityModel = MunicipalityModel.fromJson(response.data as Map<String,dynamic>);
      return municipalityModel.data;
    }catch(e){
      throw Exception(e);
    }
  }
}