import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/bloc/counter.dart';
import 'package:flutter_bloc_app/pages/other.dart';
import 'package:flutter_bloc_app/widget/data_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Counter myCounter = BlocProvider.of<Counter>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // anonymous route
          // Navigator.of(context).push(
          //   MaterialPageRoute(builder: (context) {
          //     return BlocProvider.value(
          //       value: myCounter,
          //       child: const OtherPage(),
          //     );
          //   }),
          // );

          // route using name
          Navigator.of(context).pushNamed("/other");
        },
        child: const Icon(Icons.arrow_forward),
      ),
      appBar: AppBar(
        title: const Text("Bloc Provider"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Material(
                color: Colors.blue,
                child: InkWell(
                  onTap: () {
                    myCounter.decrement();
                  },
                  child: const SizedBox(
                    height: 100,
                    width: 70,
                    child: Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              DataWidget(),
              Material(
                color: Colors.blue,
                child: InkWell(
                  onTap: () {
                    myCounter.increment();
                  },
                  child: const SizedBox(
                    height: 100,
                    width: 70,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
