import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fade/src/handleTime.dart';

part 'showing_widget_event.dart';

part 'showing_widget_state.dart';

class ShowingWidgetBloc extends Bloc<ShowingWidgetEvent, ShowingWidgetState> {
  ShowingWidgetBloc() : super(ShowingWidgetInitial());
  StreamSubscription<int?>? theStream;

  @override
  Stream<ShowingWidgetState> mapEventToState(
    ShowingWidgetEvent event,
  ) async* {
    if (event is ShowWidget) {
      int? remainingDays;
      remainingDays = event.handleTime.remainingDays;
      theStream = event.handleTime.ctrl.stream.listen((e) {
        if (remainingDays != e) {
          remainingDays = e;
          add(ShowWidget1(event.lastDaysToHideThis, remainingDays));
        }
      });

      if (remainingDays == null ||
          !(remainingDays! <= event.lastDaysToHideThis)) {
        yield Visible(true);
      } else {
        yield Visible(true);
        await Future.delayed(Duration(seconds: 1));
        yield Visible(false);
      }
    }
    if (event is ShowWidget1) {
      if (event.remainingDays == null ||
          !(event.remainingDays! <= event.lastDaysToHideThis)) {
        yield Visible(true);
      } else {
        yield Visible(true);
        await Future.delayed(Duration(seconds: 1));
        yield Visible(false);
      }
      theStream?.cancel();
    }
    if (event is CloseStreams) {
      theStream?.cancel();
    }
  }
  @override
  Future<void> close() {
    theStream?.cancel();
    return super.close();
  }
}
