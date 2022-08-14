import 'package:atik/model/product_detail_model.dart';
import 'package:atik/model/product_model.dart';
import 'package:atik/model/selected_product_model.dart';
import 'package:atik/service/recycler_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'calculation_state.dart';

class CalculationCubit extends Cubit<CalculationState> {
  CalculationCubit() : super(const CalculationState());

  final RecyclerService _calculationService = RecyclerService();

  Future<void> getProducts() async {
    emit(
      const CalculationState(
        calculationPageStateStatus: CalculationPageStateStatus.loading,
      ),
    );
    final productDetails = <BaseProductDetailModel>[];
    try {
      final products = await _calculationService.getProducts();

      await Future.forEach(
        products,
        (BaseProductModel product) async {
          final productDetail =
              await _calculationService.getProductDetail(product.productId);
          productDetails.add(productDetail);
        },
      );

      emit(
        CalculationState(
          calculationPageStateStatus: CalculationPageStateStatus.success,
          products: products,
          productDetails: productDetails,
        ),
      );
    } catch (e) {
      emit(
        const CalculationState(
          calculationPageStateStatus: CalculationPageStateStatus.error,
        ),
      );
    }
  }
}
