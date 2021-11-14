import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:holiday/controller/network_controller.dart';
import 'package:holiday/ui/widget/card_header.dart';
import 'package:holiday/ui/widget/holiday_list.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (BuildContext context, WidgetRef ref, _) {
      loadNetworkController(ref);
      var result = ref.watch(networkControllerProvider).isConnected;
      return result.when(
          data: (result) {
            if (result) {              
              return Column(
                children: const [CardHeader(), HolidayList()],
              );
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: 8, right: 8),
                    child: Text("Sorry no internet connection!."),
                  ),
                )
              ],
            );
          },
          error: (e, s) {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: Text('Error: ${e.toString()}')),
                  ],
                ),
              ),
            );
          },
          loading: () => const Padding(
              padding: EdgeInsets.all(38.0),
              child: Center(child: CircularProgressIndicator())));
    });
  }
 
  void loadNetworkController(WidgetRef ref) async {
    await ref
        .read(networkControllerProvider.notifier)
        .getNetworkConnectionStatus();
  }
}
