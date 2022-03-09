import 'package:DevQuiz/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextButtonWidget extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final VoidCallback onTap;

  const NextButtonWidget({
    Key? key,
    required this.label,
    required this.backgroundColor,
    required this.borderColor,
    required this.textColor,
    required this.onTap,
  }) : super(key: key);

  NextButtonWidget.green({required String label, required VoidCallback onTap})
      : this.label = label,
        this.backgroundColor = AppColors.darkGreen,
        this.borderColor = AppColors.green,
        this.textColor = AppColors.white,
        this.onTap = onTap;

  NextButtonWidget.white({required String label, required VoidCallback onTap})
      : this.label = label,
        this.backgroundColor = AppColors.white,
        this.borderColor = AppColors.border,
        this.textColor = AppColors.grey,
        this.onTap = onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 48,
        child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: backgroundColor,
              primary: textColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              side: BorderSide(
                color: borderColor,
              )),
          onPressed: onTap,
          child: Text(
            label,
            style: GoogleFonts.notoSans(
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
