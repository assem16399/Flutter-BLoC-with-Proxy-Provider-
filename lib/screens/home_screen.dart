import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_test/cubits/cubit_a/a_cubit.dart';
import 'package:flutter_demo_test/cubits/cubit_a/a_state.dart';
import 'package:flutter_demo_test/cubits/cubit_b/b_cubit.dart';
import 'package:flutter_demo_test/cubits/cubit_b/b_states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocConsumer<ACubit, AState>(
              listener: (context, aState) {},
              builder: (context, aState) => Text(
                BlocProvider.of<ACubit>(context).numbers.length.toString(),
                style: const TextStyle(fontSize: 40),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: const Text('increase'),
              onPressed: () {
                BlocProvider.of<ACubit>(context).addToNumbers();
              },
            ),
            const SizedBox(
              height: 20,
            ),
            BlocConsumer<BCubit, BState>(
              listener: (context, aState) {},
              builder: (context, aState) => Text(
                BlocProvider.of<BCubit>(context).numbers.length.toString(),
                style: const TextStyle(fontSize: 40),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
