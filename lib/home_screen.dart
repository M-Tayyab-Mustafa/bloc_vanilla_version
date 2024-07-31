import 'package:bloc_vanilla_version/bloc/bloc.dart';
import 'package:bloc_vanilla_version/bloc/events.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CounterBloc counterBloc = context.read<CounterBloc>();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Counter Count '),
          StreamBuilder(
            stream: counterBloc.stateStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.count.toString());
              } else {
                return Text('Faild to get Data Try tabing button to get');
              }
            },
          )
        ],
      ),
      floatingActionButton: ButtonBar(
        children: [
          FloatingActionButton(
            onPressed: () {
              counterBloc.eventSink.add(CounterIncrementEvent());
            },
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              counterBloc.eventSink.add(CounterDecrementEvent());
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
