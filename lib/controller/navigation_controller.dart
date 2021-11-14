

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:holiday/state/navigation_state.dart';

final navigationControllerProvider =
    StateNotifierProvider.autoDispose<NavigationController, NavigationState>(
        (ref) {
  return NavigationController(const NavigationState(page: 0));
});

class NavigationController extends StateNotifier<NavigationState> {
  NavigationController(NavigationState state) : super(state);  

  void setPage(int page) {
    state = state.copyWith(page: page);
  }
}
