import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/bloc/counter.dart';
import 'package:flutter_bloc_app/pages/home.dart';
import 'package:flutter_bloc_app/pages/other.dart';

class AppRouter {
  final Counter myCounter = Counter();

  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider.value(
              value: myCounter,
              child: HomePage(),
            );
          },
        );
      case "/other":
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider.value(
              value: myCounter,
              child: OtherPage(),
            );
          },
        );
    }
  }
}
