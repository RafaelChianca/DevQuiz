import 'package:dev_quiz/challenge/widgets/answer/answer_widget.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:dev_quiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final VoidCallback onSelected;

  const QuizWidget({
    Key? key,
    required this.question,
    required this.onSelected,
  }) : super(key: key);

  @override
  State<QuizWidget> createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int selectedIndex = -1;

  answer(int index) => widget.question.answers[index];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.question.title,
          style: AppTextStyles.heading,
        ),
        SizedBox(height: 24),
        for (var i = 0; i < widget.question.answers.length; i++)
          AnswerWidget(
            answer: answer(i),
            isSelected: selectedIndex == i,
            onTap: () {
              if (selectedIndex == -1) {
                selectedIndex = i;
                setState(() {});
                Future.delayed(Duration(seconds: 1))
                    .then((value) => widget.onSelected());
              }
            },
          ),
      ],
    );
  }
}
