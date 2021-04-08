part of 'showing_widget_bloc.dart';

abstract class ShowingWidgetEvent extends Equatable {
  const ShowingWidgetEvent();
}

class ShowWidget extends ShowingWidgetEvent {
  final int lastDaysToHideThis;

  final HandleTime handleTime;

  ShowWidget(this.lastDaysToHideThis, this.handleTime);

  @override
  List<Object> get props => [lastDaysToHideThis, handleTime];
}

class ShowWidget1 extends ShowingWidgetEvent {
  final int lastDaysToHideThis;

  final int? remainingDays;

  ShowWidget1(this.lastDaysToHideThis, this.remainingDays);

  @override
  List<Object?> get props => [lastDaysToHideThis, remainingDays];
}

class CloseStreams extends ShowingWidgetEvent {
  @override
  List<Object> get props => [];
}
