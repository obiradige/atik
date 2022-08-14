part of 'report_cubit.dart';

enum ReportPageStateStatus { initial, loading, success, error }

class ReportState extends Equatable {
  const ReportState({
    this.selectedDateTime,
    this.reportPageStateStatus = ReportPageStateStatus.initial,
    this.orders,
  });

  final ReportPageStateStatus reportPageStateStatus;
  final DateTime? selectedDateTime;
  final List<BaseOrder>? orders;

  ReportState copyWith({
    ReportPageStateStatus? reportPageStateStatus,
    DateTime? selectedDateTime,
    List<BaseOrder>? orders,
  }) {
    return ReportState(
      selectedDateTime: selectedDateTime ?? this.selectedDateTime,
      reportPageStateStatus:
          reportPageStateStatus ?? this.reportPageStateStatus,
      orders: orders ?? this.orders,
    );
  }

  @override
  List<Object?> get props => [reportPageStateStatus, selectedDateTime, orders];
}
