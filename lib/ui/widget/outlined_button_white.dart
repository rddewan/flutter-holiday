import 'package:flutter/material.dart';

class OutlinedButtonLight extends StatelessWidget {
  const OutlinedButtonLight(
      {Key? key,
      required this.onPressed,
      required this.txtLabel,
      required this.faIcon})
      : super(key: key);

  final VoidCallback onPressed;
  final Text txtLabel;
  final Icon faIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: OutlinedButton.icon(
          style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.lightBlueAccent),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0))),
          onPressed: onPressed,
          icon: faIcon,
          label: txtLabel
      )
    );
  }
}
