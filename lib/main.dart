import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/bloc/counter.dart';
import 'package:flutter_bloc_app/config/app_router.dart';
import 'package:flutter_bloc_app/pages/home.dart';
import 'package:flutter_bloc_app/pages/other.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Counter myCounter = Counter();

  final router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // routes: {
      //   "/": (context) => BlocProvider.value(
      //         value: myCounter,
      //         child: HomePage(),
      //       ),
      //   "/other": (context) => BlocProvider.value(
      //         value: myCounter,
      //         child: OtherPage(),
      //       ),
      // },

      // Using Generate route access
      onGenerateRoute: router.generateRoute,
    );
  }
}
