part of 'calculation_cubit.dart';

enum CalculationPageStateStatus {
  initial,
  loading,
  success,
  error,
  calculating
}

class CalculationState extends Equatable {
  const CalculationState({
    this.calculationPageStateStatus = CalculationPageStateStatus.initial,
    this.products,
    this.productDetails,
  });

  final CalculationPageStateStatus calculationPageStateStatus;
  final List<BaseProductModel>? products;
  final List<BaseProductDetailModel>? productDetails;

  CalculationState copyWith({
    CalculationPageStateStatus? calculationPageStateStatus,
    List<BaseProductModel>? products,
    List<BaseProductDetailModel>? productDetails,
    List<SelectedProductModel>? selectedProductModel,
  }) {
    return CalculationState(
      calculationPageStateStatus:
          calculationPageStateStatus ?? this.calculationPageStateStatus,
      products: products ?? this.products,
      productDetails: productDetails ?? this.productDetails,
    );
  }

  @override
  List<Object?> get props => [
        calculationPageStateStatus,
        products,
        productDetails,
      ];
}
