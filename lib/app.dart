import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/bloc/theme_bloc.dart';
import 'package:flutter_bloc_app/config/app_router.dart';
import 'package:flutter_bloc_app/pages/home.dart';

class App extends StatelessWidget {
  final router = AppRouter();

  @override
  Widget build(BuildContext context) {
    ThemeBloc myTheme = context.read<ThemeBloc>();
    return BlocBuilder(
      bloc: myTheme,
      builder: (context, state) {
        return MaterialApp(
          theme: state == true ? ThemeData.light() : ThemeData.dark(),
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
      },
    );
  }
}
