import 'package:atik/model/order_model.dart';
import 'package:atik/service/report_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'report_state.dart';

class ReportCubit extends Cubit<ReportState> {
  ReportCubit()
      : super(
          const ReportState(),
        );

  final ReportService _reportService = ReportService();

  Future<void> onDateChange({required DateTime date}) async {
    emit(
      const ReportState(reportPageStateStatus: ReportPageStateStatus.loading),
    );
    try {
      final response = await _reportService.getOrders(date: date);
      emit(
        ReportState(
          selectedDateTime: date,
          reportPageStateStatus: ReportPageStateStatus.success,
          orders: response,
        ),
      );
    } catch (e) {
      emit(
        const ReportState(reportPageStateStatus: ReportPageStateStatus.error),
      );
    }
  }
}
