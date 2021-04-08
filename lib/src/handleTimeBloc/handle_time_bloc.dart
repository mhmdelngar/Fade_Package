import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fade/src/handleTime.dart';

part 'handle_time_event.dart';

part 'handle_time_state.dart';

class HandleTimeBloc extends Bloc<HandleTimeEvent, HandleTimeState> {
  HandleTimeBloc() : super(HandleTimeInitial());
  HandleTime handleTime = HandleTime();

  @override
  Stream<HandleTimeState> mapEventToState(
    HandleTimeEvent event,
  ) async* {
    if (event is CalculateRemaining) {
      if (event.paidFunction != null) {
        bool paid = await event.paidFunction!();
        handleTime.remainingTime(paid, event.dateTime);
      } else {
        handleTime.remainingTime(event.paid!, event.dateTime);
        print(handleTime.remainingDays);
      }
    }
  }
}
