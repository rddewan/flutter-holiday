import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:holiday/state/network_state.dart';


final networkControllerProvider =
    StateNotifierProvider.autoDispose<NetworkController, NetworkState>((ref) {
  
  return NetworkController(
      const NetworkState(isConnected: AsyncValue.loading()));
});

class NetworkController extends StateNotifier<NetworkState> {
  NetworkController(NetworkState state) : super(state);

  Future<void> getNetworkConnectionStatus() async {
    const channel = MethodChannel('rdewan.dev/network_helper');
    final result = await channel.invokeMethod('getNetworkStatus');

    state =  state.copyWith(isConnected: AsyncValue.data(result));
  }
}
