import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/bloc/counter.dart';
import 'package:flutter_bloc_app/bloc/theme_bloc.dart';
import 'package:flutter_bloc_app/bloc/user.dart';

class OtherPage extends StatelessWidget {
  const OtherPage({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeBloc myTheme = context.read<ThemeBloc>();
    Counter myCounter = context.read<Counter>();
    UserBloc myUser = context.read<UserBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Other Page"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          myTheme.changeTheme();
        },
        child: BlocBuilder(
          bloc: myTheme,
          builder: (context, state) {
            return state == true
                ? const Icon(Icons.dark_mode)
                : const Icon(Icons.light_mode);
          },
        ),
      ),
      body: Column(
        children: [
          Center(
            child: BlocBuilder(
              bloc: myCounter,
              builder: (context, state) {
                return Text(
                  "$state",
                  style: const TextStyle(fontSize: 50),
                );
              },
            ),
          ),
          Container(
            height: 400,
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                // Kalu menggunakan Bloc builder akan di build semua

                // BlocBuilder<UserBloc, Map<String, dynamic>>(
                //   bloc: myUser,
                //   builder: (context, state) {
                //     return Text(
                //       "Nama : ${state['name']}",
                //       style: const TextStyle(fontSize: 20),
                //     );
                //   },
                // ),
                // const SizedBox(height: 10),
                // BlocBuilder<UserBloc, Map<String, dynamic>>(
                //   bloc: myUser,
                //   builder: (context, state) {
                //     return Text(
                //       "Umur : ${state['age']} tahun",
                //       style: const TextStyle(fontSize: 20),
                //     );
                //   },
                // ),
                BlocSelector<UserBloc, Map<String, dynamic>, String>(
                  selector: (state) => state["name"],
                  builder: (context, state) {
                    return Text(
                      "Nama : $state",
                      style: const TextStyle(fontSize: 20),
                    );
                  },
                ),
                BlocSelector<UserBloc, Map<String, dynamic>, int>(
                  selector: (state) => state["age"],
                  builder: (context, state) {
                    return Text(
                      "Umur : $state tahun",
                      style: const TextStyle(fontSize: 20),
                    );
                  },
                ),
                const SizedBox(height: 20),
                TextField(
                  onChanged: (value) => myUser.changeName(value),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        myUser.changeAge(myUser.state["age"] - 1);
                      },
                      icon: const Icon(Icons.remove),
                    ),
                    IconButton(
                      onPressed: () {
                        myUser.changeAge(myUser.state["age"] + 1);
                      },
                      icon: const Icon(Icons.add),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
