part of 'handle_time_bloc.dart';

abstract class HandleTimeEvent extends Equatable {
  const HandleTimeEvent();
}

class CalculateRemaining extends HandleTimeEvent {
  final DateTime dateTime;

  final bool? paid;
  final Future<bool> Function()? paidFunction;

  CalculateRemaining(this.dateTime, this.paid, this.paidFunction);

  @override
  List<Object?> get props => [dateTime, paid];
}
