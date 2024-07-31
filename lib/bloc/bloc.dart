import 'dart:async';

import 'package:bloc_vanilla_version/bloc/events.dart';
import 'package:bloc_vanilla_version/bloc/state.dart';

class CounterBloc {
  CounterBloc() {
    _incrementOrDecrement();
  }
  StreamController<CounterEvents> _eventStreamController = StreamController();
  StreamController<CounterStates> _stateStreamController = StreamController();
  Sink<CounterEvents> get eventSink => _eventStreamController.sink;
  Stream<CounterStates> get stateStream => _stateStreamController.stream;
  CounterStates counterStates = const CounterStates(count: 0);
  _incrementOrDecrement() {
    _stateStreamController.sink.add(counterStates);
    _eventStreamController.stream.listen(_lisning);
  }

  _lisning(CounterEvents event) {
    if (event is CounterIncrementEvent) {
      counterStates = CounterStates(count: counterStates.count + 1);
      _stateStreamController.sink.add(counterStates);
    } else {
      counterStates = CounterStates(count: counterStates.count - 1);
      _stateStreamController.sink.add(counterStates);
    }
  }
}
