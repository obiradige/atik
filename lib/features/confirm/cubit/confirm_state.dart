part of 'confirm_cubit.dart';


enum ConfirmStateStatus { initial, loading, success, error }

class ConfirmState extends Equatable {
  const ConfirmState({this.confirmStateStatus = ConfirmStateStatus.initial});

  final ConfirmStateStatus confirmStateStatus;

  ConfirmState copyWith({
    ConfirmStateStatus? confirmStateStatus,
  }) {
    return ConfirmState(
      confirmStateStatus: confirmStateStatus ?? this.confirmStateStatus,
    );
  }

  @override
  List<Object?> get props => [confirmStateStatus];
}
