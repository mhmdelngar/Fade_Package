part of 'showing_widget_bloc.dart';

abstract class ShowingWidgetState extends Equatable {
  const ShowingWidgetState();
}

class ShowingWidgetInitial extends ShowingWidgetState {
  @override
  List<Object> get props => [];
}

class Visible extends ShowingWidgetState {
  final bool visible;

  Visible(this.visible);

  @override
  List<Object> get props => [visible];
}
