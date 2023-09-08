import 'package:casureco/utilities/constant.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.onTap,
    required this.label,
    super.key,
  });

  final VoidCallback onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        margin: const EdgeInsets.symmetric(horizontal: 25.0),
        decoration: BoxDecoration(
          color: blue,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              color: white,
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}
