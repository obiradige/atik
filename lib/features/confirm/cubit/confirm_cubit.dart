import 'package:atik/features/confirm/view/payment_result.dart';
import 'package:atik/model/selected_product_model.dart';
import 'package:atik/service/confirmation_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'confirm_state.dart';

class ConfirmCubit extends Cubit<ConfirmState> {
  ConfirmCubit() : super(const ConfirmState());

  final ConfirmationService _confirmationService = ConfirmationService();

  Future<void> onConfirm({
    required BuildContext context,
    required double amount, required List<SelectedProductModel> list,
  }) async {
    emit(const ConfirmState(confirmStateStatus: ConfirmStateStatus.loading));
    try {
      await _confirmationService.confirmUser(
        amount: amount.toString(),
        list : list
      );
      emit(const ConfirmState(confirmStateStatus: ConfirmStateStatus.success));
      // ignore: use_build_context_synchronously
      await Navigator.of(context).pushAndRemoveUntil(
        // ignore: inference_failure_on_instance_creation
        MaterialPageRoute(
          builder: (context) => PaymentResult(
            totalPayment: amount,
          ),
        ),
        (Route<dynamic> route) => false,
      );
    } catch (e) {
      emit(const ConfirmState(confirmStateStatus: ConfirmStateStatus.error));
    }
  }
}