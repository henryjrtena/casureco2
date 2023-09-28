import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
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

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    required this.onTap,
    required this.label,
    super.key,
  });

  final VoidCallback onTap;
  final String label;

  @override
  Widget build(BuildContext context) => OutlinedButton(
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
