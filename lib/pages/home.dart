import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
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
          StreamBuilder(
              initialData: myCounter.init,
              stream: myCounter.stream,
              builder: (context, snapshot) {
                return Text(
                  "${snapshot.data}",
                  style: TextStyle(fontSize: 50),
                );
              }),
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
