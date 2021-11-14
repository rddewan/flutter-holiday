import 'package:flutter/material.dart';

class HeaderCardColumn extends StatelessWidget {
  const HeaderCardColumn({Key? key,required this.title,required this.subTitle}) : super(key: key);

  final Text title;
  final Text subTitle;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          title,
          const SizedBox(
            height: 4.0,
          ),
          subTitle          
        ],
      ),
    );
  }
}
