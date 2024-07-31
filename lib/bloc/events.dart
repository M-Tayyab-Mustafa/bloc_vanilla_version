import 'package:flutter/material.dart';

@immutable
abstract class CounterEvents {}

@immutable
class CounterIncrementEvent extends CounterEvents {}

@immutable
class CounterDecrementEvent extends CounterEvents {}
