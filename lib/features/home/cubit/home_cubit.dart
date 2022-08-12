import 'package:atik/models/municipality_model.dart';
import 'package:atik/service/home_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  final HomeService _homeService = HomeService();
  Future<void> getMunicipalityy() async {
    emit(const HomeState(mainStateStatus: MainStateStatus.loading));
    try{
      final response = await _homeService.getMunicipality();
      emit(HomeState(mainStateStatus: MainStateStatus.success,baseMunicipalityModel: response));

    }catch (e) {
      emit(
        const HomeState(mainStateStatus: MainStateStatus.error),
      );
    }
  }
  
}
