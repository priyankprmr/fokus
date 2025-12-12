import 'package:flutter/foundation.dart' show immutable;

@immutable
class TimerState {
  final Duration remaining;
  final bool isRunning;

  const TimerState({required this.remaining, required this.isRunning});

  TimerState copyWith({Duration? remaining, bool? isRunning}) {
    return TimerState(
      remaining: remaining ?? this.remaining,
      isRunning: isRunning ?? this.isRunning,
    );
  }
}
