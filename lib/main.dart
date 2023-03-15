import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/bloc/counter.dart';
import 'package:flutter_bloc_app/pages/home.dart';
import 'package:flutter_bloc_app/pages/other.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Counter myCounter = Counter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (context) => BlocProvider.value(
              value: myCounter,
              child: HomePage(),
            ),
        "/other": (context) => BlocProvider.value(
              value: myCounter,
              child: OtherPage(),
            ),
      },
    );
  }
}
