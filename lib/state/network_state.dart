import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class NetworkState {
  final AsyncValue<bool> isConnected;

  const NetworkState({
    required this.isConnected
    }
  );

  NetworkState copyWith({AsyncValue<bool>? isConnected}) {
    return NetworkState(isConnected: isConnected ?? this.isConnected);
  }
}
