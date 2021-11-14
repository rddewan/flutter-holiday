import 'package:flutter/material.dart';

@immutable
class NavigationState {
  final int page;

  const NavigationState({required this.page});

  NavigationState copyWith({int? page}) {
    return NavigationState(page: page ?? this.page);
  }
}
