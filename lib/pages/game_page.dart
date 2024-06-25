import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// import '../components/answer_box.dart';
// import '../components/question_box.dart';
import '../provider/app_provider.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  var answerWidth = 150.0;

  List<Map> questions = [
    {
      'question': 'ما اسم ابو عبد الله',
      'answers': ['ابو عبد الله', 'حمزة', 'احمد', 'علي'],
      'correctAnswer': 'حمزة',
    },
    {
      'question': 'من مطور هذا التطبيق',
      'answers': ['ابو عبد الله', 'تيم باور power team', 'لا احد', 'حمزة'],
      'correctAnswer': 'تيم باور power team',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.comingSoon),
            centerTitle: true,
          ),
          body: Center(
            child: Text(
              AppLocalizations.of(context)!.comingSoon,
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
          // body: Padding(
          //   padding: const EdgeInsets.all(12.0),
          //   child: Center(
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         // title
          //         Container(
          //           width: 300,
          //           padding: const EdgeInsets.all(12),
          //           child: QuestionBox(questionTitle: questions[0]['question']),
          //         ),

          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             /// answer 1
          //             Container(
          //               width: answerWidth,
          //               padding: const EdgeInsets.all(12),
          //               child: AnswerBox(
          //                 onAnswer: () {

          //                 },
          //                 answer: questions[0]['answers'][0],
          //               ),
          //             ),
          //             // answer 2
          //             Container(
          //               width: answerWidth,
          //               padding: const EdgeInsets.all(12),
          //               child: AnswerBox(
          //                 onAnswer: () {},
          //                 answer: questions[0]['answers'][1],
          //               ),
          //             ),
          //           ],
          //         ),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             // answer 3
          //             Container(
          //               width: answerWidth,
          //               padding: const EdgeInsets.all(12),
          //               child: AnswerBox(
          //                 onAnswer: () {},
          //                 answer: questions[0]['answers'][2],
          //               ),
          //             ),
          //             // answer 4
          //             Container(
          //               width: answerWidth,
          //               padding: const EdgeInsets.all(12),
          //               child: AnswerBox(
          //                 onAnswer: () {},
          //                 answer: questions[0]['answers'][3],
          //               ),
          //             ),
          //           ],
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        );
      },
    );
  }
}
