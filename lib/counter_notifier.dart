import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterNotifier extends StateNotifier<int> {
  // The value passed into the super constructor is the initial state, in this case, zero.
  CounterNotifier() : super(0);

  void increment() {
    // Reassigning state
    // Could also be written as `state = state + 1;`.
    // Notifies all listeners about the state change.
    state++;
  }
}
