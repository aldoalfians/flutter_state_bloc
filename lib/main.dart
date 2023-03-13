import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class CounterCubit extends Cubit<int> {
  int initialData;
  int? current;
  int? next;

  CounterCubit({this.initialData = 0}) : super(initialData);

  void tambahData() {
    emit(state + 1);
  }

  void kurangData() {
    emit(state - 1);
  }

  // Observer Cubit "Fitur bloc untuk memantau data"

  // - Perubahan state "Onchange"
  @override
  void onChange(Change<int> change) {
    // TODO: implement onChange
    super.onChange(change);
    print(change);
    current = change.currentState;
    next = change.nextState;
  }

  // - Error OnError
  @override
  void onError(Object error, StackTrace stackTrace) {
    // TODO: implement onError
    super.onError(error, stackTrace);
  }
}

class HomePage extends StatelessWidget {
  CounterCubit myCounter = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cubit App"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder(
            initialData: myCounter.initialData,
            stream: myCounter.stream,
            builder: (context, snapshot) {
              return Center(
                child: Column(
                  children: [
                    Text(
                      "Data : ${snapshot.data}",
                      style: const TextStyle(fontSize: 38),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Next : ${myCounter.next}",
                      style: const TextStyle(fontSize: 38),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Current : ${myCounter.current}",
                      style: const TextStyle(fontSize: 38),
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: myCounter.kurangData,
                icon: const Icon(Icons.remove),
              ),
              IconButton(
                onPressed: myCounter.tambahData,
                icon: const Icon(Icons.add),
              )
            ],
          )
        ],
      ),
    );
  }
}
