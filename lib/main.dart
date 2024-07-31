import 'package:bloc_vanilla_version/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bloc/bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Provider<CounterBloc>(
        create: (context) => CounterBloc(),
        child: const HomeScreen(),
      ),
    );
  }
}
