import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_test/cubits/cubit_a/a_cubit.dart';
import 'package:flutter_demo_test/cubits/cubit_b/b_cubit.dart';
import 'package:flutter_demo_test/screens/home_screen.dart';
import 'package:provider/provider.dart';

import 'observer/my_observer.dart';

void main() {
  BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ACubit()),
        ChangeNotifierProxyProvider<ACubit, BCubit>(
          create: (_) => BCubit(null),
          update: (context, aCubitData, bCubitPrevState) =>
              bCubitPrevState!..updateNumbers(aCubitData.numbers),
        )
      ],
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
