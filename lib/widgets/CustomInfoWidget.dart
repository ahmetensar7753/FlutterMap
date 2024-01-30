// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:map_app/constants/colors.dart';

class YourCustomWidget extends StatelessWidget {
  Color color;
  Color color2;
  String data;
  YourCustomWidget({
    super.key,
    this.color = Colors.red,
    this.color2 = Colors.red,
    this.data = '',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 40,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              color.withOpacity(1),
              color2.withOpacity(1),
            ],
          ),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(5))),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Text(
            data,
            style: const TextStyle(
              decoration: TextDecoration.none,
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.normal,
              fontSize: 16,
              color: MyColor.white,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
