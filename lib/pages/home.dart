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
          BlocListener<Counter, int>(
            bloc: myCounter,
            listener: (context, state) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Success"),
                  duration: Duration(milliseconds: 30),
                ),
              );
            },
            // bloc builder ini di bungkus oleh bloc listener unutk melisten di dalam listener
            child: BlocBuilder<Counter, int>(
              bloc: myCounter,
              builder: (context, state) {
                return Text(
                  "${state}",
                  style: TextStyle(fontSize: 50),
                );
              },
            ),
          ),

          // Using package flutter bloc "bloc builder"
          // BlocBuilder<Counter, int>(
          // bloc: myCounter,
          // buildwhen ini mengembalikan condition boolean untuk ngebuild di properti builder
          // buildWhen: (previous, current) {
          //   if (current % 2 == 0) {
          //     return true;
          //   } else {
          //     return false;
          //   }
          // },
          // builder: (context, state) {
          // return Text(
          // "${state}",
          //style: TextStyle(fontSize: 50),
          //);
          //},
          //),

          // using stram builder
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
