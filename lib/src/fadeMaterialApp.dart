import 'package:fade/src/handleTimeBloc/handle_time_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Fade extends StatefulWidget {
  final MaterialApp materialApp;
  final DateTime dateTime;
  final bool? paid;
  final Future<bool> Function()? paidFunction;

  Fade(
      {required this.materialApp,
      required this.dateTime,
      this.paid,
      this.paidFunction})
      : assert(paid != null || paidFunction != null);

  @override
  _FadeState createState() => _FadeState();
}

class _FadeState extends State<Fade> {
  bool? paid = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HandleTimeBloc>(
      create: (_) => HandleTimeBloc(),
      child: Builder(builder: (ctx) {
        Future.delayed(Duration.zero).then((value) async {
          if (widget.paidFunction != null) {
            paid = await widget.paidFunction!();
            BlocProvider.of<HandleTimeBloc>(ctx).add(
                CalculateRemaining(widget.dateTime, paid, widget.paidFunction));
          } else {
            paid = widget.paid;
            BlocProvider.of<HandleTimeBloc>(ctx).add(
              CalculateRemaining(
                widget.dateTime,
                paid,
                null,
              ),
            );
          }
        });

        return widget.materialApp;
      }),
    );
  }
}
