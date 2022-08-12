part of 'home_cubit.dart';

enum MainStateStatus { initial, loading, success, error }

class HomeState extends Equatable {

const HomeState({
    this.baseMunicipalityModel,
    this.mainStateStatus = MainStateStatus.initial,
  });

  final MainStateStatus mainStateStatus;
  final BaseMunicipalityModel? baseMunicipalityModel;

 HomeState copyWith({
    MainStateStatus? mainStateStatus,
    BaseMunicipalityModel? baseMunicipalityModel,
  }) {
    return HomeState(
      mainStateStatus: mainStateStatus ?? this.mainStateStatus,
      baseMunicipalityModel:
          baseMunicipalityModel ?? this.baseMunicipalityModel,
    );
  }
  
  @override
  List<Object?> get props => [mainStateStatus, baseMunicipalityModel];
}
