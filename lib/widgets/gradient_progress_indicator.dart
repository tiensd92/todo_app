import 'package:flutter/material.dart';

class GradientProgressIndicator extends StatelessWidget {
  final double value;
  final Color backgroundColor;
  final LinearGradient gradient;
  final double height;

  GradientProgressIndicator(
      {required this.value,
      this.backgroundColor = Colors.white,
      required this.gradient,
      this.height = 6});

  @override
  Widget build(BuildContext context) {
    final percent = (value * 100).toInt();
    return Container(
      height: 6,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(200),
      ),
      child: Row(
        children: [
          Expanded(
              child: Container(
                decoration: BoxDecoration(
                  gradient: gradient,
                  borderRadius: BorderRadius.circular(200),
                ),
              ),
              flex: percent),
          Expanded(child: Container(), flex: 100 - percent),
        ],
      ),
    );
  }
}
