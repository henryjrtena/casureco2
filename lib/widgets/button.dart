import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.onTap,
    required this.label,
    super.key,
  });

  final VoidCallback onTap;
  final String label;

  @override
  Widget build(BuildContext context) => FilledButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 50.0),
        ),
        onPressed: onTap,
        child: Text(
          label,
          style: GoogleFonts.montserrat(
            textStyle: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
      );
}
