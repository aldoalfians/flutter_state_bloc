import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/bloc/counter.dart';

class DataWidget extends StatelessWidget {
  const DataWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 200,
      color: Colors.red,
      child: Center(
        child: BlocBuilder(
          bloc: BlocProvider.of<Counter>(context),
          builder: (context, state) {
            return Text(
              "$state",
              style: const TextStyle(fontSize: 50, color: Colors.white),
            );
          },
        ),
      ),
    );
  }
}
