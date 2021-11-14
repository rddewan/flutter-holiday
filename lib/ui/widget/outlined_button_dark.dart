import 'package:flutter/material.dart';

class OutlinedButtonDark extends StatelessWidget {
  const OutlinedButtonDark({Key? key, required this.onPress,required this.txtLabel,required this.faIcon}) : super(key: key);

  final VoidCallback onPress;
  final Text txtLabel;
  final Icon faIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child:
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
             side: const BorderSide(color: Colors.lightBlueAccent),
             backgroundColor: Colors.lightBlueAccent,
             shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(8.0)
             )
        ),
            onPressed: onPress,
            icon: faIcon,
            label: txtLabel
          ),
    );
  }
}
