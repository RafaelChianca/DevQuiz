import 'package:DevQuiz/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LevelButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  LevelButtonWidget({Key? key, required this.label, required this.onTap})
      : assert(['Fácil', 'Médio', 'Difícil', 'Perito'].contains(label)),
        super(key: key);

  final config = {
    'Fácil': {
      'color': AppColors.levelButtonFacil,
      'borderColor': AppColors.levelButtonBorderFacil,
      'textColor': AppColors.levelButtonTextFacil
    },
    'Médio': {
      'color': AppColors.levelButtonMedio,
      'borderColor': AppColors.levelButtonBorderMedio,
      'textColor': AppColors.levelButtonTextMedio
    },
    'Difícil': {
      'color': AppColors.levelButtonDificil,
      'borderColor': AppColors.levelButtonBorderDificil,
      'textColor': AppColors.levelButtonTextDificil
    },
    'Perito': {
      'color': AppColors.levelButtonPerito,
      'borderColor': AppColors.levelButtonBorderPerito,
      'textColor': AppColors.levelButtonTextPerito
    },
  };

  Color get color => config[label]!['color']!;
  Color get borderColor => config[label]!['borderColor']!;
  Color get textColor => config[label]!['textColor']!;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: borderColor,
      customBorder:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      child: Ink(
        height: 32,
        width: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          color: color,
          border: Border.fromBorderSide(
            BorderSide(color: borderColor),
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: GoogleFonts.notoSans(color: textColor),
          ),
        ),
      ),
    );
  }
}
