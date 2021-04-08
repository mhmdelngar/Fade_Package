import 'package:fade/src/handleTimeBloc/handle_time_bloc.dart';
import 'package:fade/src/showingWidget/showing_widget_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContainerF extends StatelessWidget {
  final Widget child;

  final int lastDaysToHideThis;

  ContainerF({required this.child, required this.lastDaysToHideThis});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => BlocProvider<ShowingWidgetBloc>(
          create: (context) => ShowingWidgetBloc(),
          child: _ShowingAndHiding(
            lastDaysToHideThis: lastDaysToHideThis,
            child: child,
          )),
    );
  }
}

class _ShowingAndHiding extends StatefulWidget {
  final Widget child;

  final int lastDaysToHideThis;

  _ShowingAndHiding({required this.child, required this.lastDaysToHideThis});

  @override
  _ShowingAndHidingState createState() => _ShowingAndHidingState();
}

class _ShowingAndHidingState extends State<_ShowingAndHiding> {
  @override
  void initState() {
    Future.delayed(Duration.zero).then((value) {
      BlocProvider.of<ShowingWidgetBloc>(context).add(ShowWidget(
          widget.lastDaysToHideThis,
          BlocProvider.of<HandleTimeBloc>(context).handleTime));
    });
    super.initState();
  }

  @override
  void dispose() {
    BlocProvider.of<ShowingWidgetBloc>(context).add(CloseStreams());
    BlocProvider.of<ShowingWidgetBloc>(context).close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowingWidgetBloc, ShowingWidgetState>(
        builder: (context, state) {
      if (state is Visible) {
        return AnimatedSwitcher(
            key: ValueKey(1),
            duration: Duration(milliseconds: 1300),
            child: state.visible
                ? widget.child
                : Container(
                    key: ValueKey(2),
                  ));
      } else {
        return AnimatedSwitcher(
            key: ValueKey(1),
            duration: Duration(milliseconds: 1300),
            child: widget.child);
      }
    });
  }
}
