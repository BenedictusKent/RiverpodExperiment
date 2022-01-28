import 'dart:developer';
import 'package:riverpod_experiment/database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final questionProvider = FutureProvider<String>((ref) async {
  return ref.read(databaseProvider).getQuestionData();
});

final counterController =
    StateNotifierProvider<CounterNotifier, int>((ref) => CounterNotifier());

class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(0);

  void increment() {
    state += 1;
  }

  void decrement() {
    state -= 1;
  }

  void equal() {
    state = Database.one + Database.two;
  }
}
