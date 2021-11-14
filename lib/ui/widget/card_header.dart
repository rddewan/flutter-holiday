import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:holiday/controller/holiday_controller.dart';
import 'package:holiday/ui/widget/header_card_column.dart';
import 'package:holiday/ui/widget/outlined_button_dark.dart';
import 'package:holiday/ui/widget/outlined_button_white.dart';



class CardHeader extends ConsumerWidget {
  const CardHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
  return ref.watch(holidayControllerProvider).holiday.when(
    data: (holiday) {
      return Stack(
        children: [
          Container(height: 170,color: const Color(0xFFB3E5FC)),
          Padding(
          padding: const EdgeInsets.only(top: 100,left: 16,right: 16,bottom: 16),
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Text(
                    "My holiday",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  IntrinsicHeight(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        HeaderCardColumn(
                          title: Text('${holiday.totalDay}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w900)),
                          subTitle: const Text("Total",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600)),
                        ),
                        const VerticalDivider(
                          color: Colors.black45,
                          thickness: 0.4,
                          indent: 5,
                          endIndent: 5,
                        ),
                        HeaderCardColumn(
                          title: Text('${holiday.totalDayUsed}',
                              style: const TextStyle(
                                  color: Colors.lightBlue,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w900)),
                          subTitle: const Text("Used",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600)),
                        ),
                        const VerticalDivider(
                          color: Colors.black45,
                          thickness: 0.4,
                          indent: 5,
                          endIndent: 5,
                        ),
                        HeaderCardColumn(
                          title: Text('${holiday.totalDayLeft}',
                              style: const TextStyle(
                                  color: Colors.orange,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w900)),
                          subTitle: const Text("Left",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600)),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      OutlinedButtonDark(
                        onPress: () => {},
                        faIcon: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        txtLabel: const Text("Leave",
                            style: TextStyle(
                                color: Colors.white, fontSize: 16.0)),
                      ),
                      OutlinedButtonLight(
                        onPressed: () => {},
                        faIcon: const Icon(Icons.switch_right_sharp),
                        txtLabel: const Text("Switch",
                            style: TextStyle(
                                color: Colors.lightBlueAccent,
                                fontSize: 16.0)),
                      ),
                    ],                    
                  ),                   
                ],
              ),
            ),
          ),
        ),               
      ],        
    );
    },
    error: (e, s) {
      return const SizedBox();
    },
    loading: () => const Center(child: SizedBox()));
  } 
  
}
