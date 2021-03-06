import 'package:dev_quiz/core/app_colors.dart';
import 'package:dev_quiz/core/app_images.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:dev_quiz/shared/widgets/progress_indicator/progress_indicator.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
  final String title;
  final String completion;
  final double percentage;
  final VoidCallback onTap;

  const QuizCardWidget({
    Key? key,
    required this.title,
    required this.completion,
    required this.percentage,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      customBorder:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Ink(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
              width: 40,
              child: Image.asset(AppImages.blocks),
            ),
            SizedBox(height: 20),
            Text(title, style: AppTextStyles.heading15),
            SizedBox(height: 20),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      completion,
                      style: AppTextStyles.body11,
                    ),
                  ),
                  SizedBox(width: 21),
                  Expanded(
                    flex: 2,
                    child: ProgressIndicatorWidget(value: percentage),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
