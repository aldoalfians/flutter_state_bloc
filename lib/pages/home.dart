import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/bloc/counter.dart';

class HomePage extends StatelessWidget {
  Counter myCounter = Counter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc Builder"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Using package flutter bloc "bloc builder"
          BlocBuilder<Counter, int>(
            bloc: myCounter,
            // buildwhen ini mengembalikan condition boolean untuk ngebuild di properti builder
            // buildWhen: (previous, current) {
            //   if (current % 2 == 0) {
            //     return true;
            //   } else {
            //     return false;
            //   }
            // },
            builder: (context, state) {
              return Text(
                "${state}",
                style: TextStyle(fontSize: 50),
              );
            },
          ),
          // StreamBuilder(
          //   initialData: myCounter.init,
          //   stream: myCounter.stream,
          //   builder: (context, snapshot) {
          //     return Text(
          //       "${snapshot.data}",
          //       style: TextStyle(fontSize: 50),
          //     );
          //   },
          // ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: myCounter.decrement,
                icon: Icon(Icons.remove),
              ),
              IconButton(
                onPressed: myCounter.increment,
                icon: Icon(Icons.add),
              ),
            ],
          )
        ],
      ),
    );
  }
}
