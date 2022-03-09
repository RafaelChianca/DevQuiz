import 'package:DevQuiz/challenge/challenge_page.dart';
import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/home/home_controller.dart';
import 'package:DevQuiz/home/home_state.dart';
import 'package:DevQuiz/home/widgets/appbar/app_bar_widget.dart';
import 'package:DevQuiz/home/widgets/level_button/level_button_widget.dart';
import 'package:DevQuiz/home/widgets/quiz_card_widget/quiz_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.getUser();
    controller.getQuizzes();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.success) {
      return Scaffold(
        // TODO: Try to change appBar to a SliverAppBar
        appBar: AppBarWidget(user: controller.user!),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LevelButtonWidget(
                    label: 'Fácil',
                    onTap: () {},
                  ),
                  LevelButtonWidget(
                    label: 'Médio',
                    onTap: () {},
                  ),
                  LevelButtonWidget(
                    label: 'Difícil',
                    onTap: () {},
                  ),
                  LevelButtonWidget(
                    label: 'Perito',
                    onTap: () {},
                  ),
                ],
              ),
              SizedBox(height: 24),
              Expanded(
                // TODO: Fix scroll showing behind level selector
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: controller.quizzes!
                      .map((e) => QuizCardWidget(
                            title: e.title,
                            completion:
                                "${e.questionsAnswered} de ${e.questions.length}",
                            percentage:
                                e.questionsAnswered / e.questions.length,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => ChallengePage(
                                      questions: e.questions,
                                    ),
                                  ));
                            },
                          ))
                      .toList(),
                ),
              )
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator.adaptive(
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen)),
        ),
      );
    }
  }
}
