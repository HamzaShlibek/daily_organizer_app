import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:toolkit_app/models/button_model.dart';

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  var input = '';
  var output = '';
  var operation = '';
  var hideInput = false;
  var outputSize = 3.0;

  void onButtonClick(value) {
    if (value == "AC") {
      input = "";
      output = "";
    } else if (value == "DEL") {
      if (input.isNotEmpty) {
        input = input.substring(0, input.length - 1);
      }
    } else if (value == "=") {
      if (input.isNotEmpty) {
        var userInput = input.replaceAll("x", "*");
        Parser p = Parser();
        Expression expression = p.parse(userInput);
        ContextModel cm = ContextModel();
        var finalValue = expression.evaluate(EvaluationType.REAL, cm);
        output = finalValue.toString();
        if (output.endsWith(".0")) {
          output = output.substring(0, output.length - 2);
        }
        // input = output;
        hideInput = false;
        outputSize = 52;
      }
    } else {
      input = input + value;
      hideInput = false;
      outputSize = 34;
    }

    setState(() {});
  }

  final List<List<String>> buttons = [
    ['AC', '^', '%', '/'],
    ['7', '8', '9', 'x'],
    ['4', '5', '6', '-'],
    ['1', '2', '3', '+'],
    ['0', '.', 'DEL', '='],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: Stack(
                    children: [
                      Card(
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                hideInput ? "" : input,
                                style: const TextStyle(
                                  fontSize: 38,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                output,
                                style: TextStyle(
                                  fontSize: outputSize,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground
                                      .withOpacity(0.7),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.only(start: 6, top: 8),
                        child: IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.arrow_back),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // calculator buttons
              Localizations.override(
                context: context,
                locale: const Locale('en'),
                child: Builder(builder: (context) {
                  return SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * .66,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            rowOfNumbers(
                              context,
                              buttonModels: List.generate(
                                4,
                                (index) => ButtonModel(
                                  onPressed: () =>
                                      onButtonClick(buttons[0][index]),
                                  child: calculatorText(
                                      context, buttons[0][index]),
                                ),
                              ),
                            ),
                            rowOfNumbers(
                              context,
                              buttonModels: List.generate(
                                4,
                                (index) => ButtonModel(
                                  onPressed: () =>
                                      onButtonClick(buttons[1][index]),
                                  child: calculatorText(
                                      context, buttons[1][index]),
                                ),
                              ),
                            ),
                            rowOfNumbers(
                              context,
                              buttonModels: List.generate(
                                4,
                                (index) => ButtonModel(
                                  onPressed: () =>
                                      onButtonClick(buttons[2][index]),
                                  child: calculatorText(
                                      context, buttons[2][index]),
                                ),
                              ),
                            ),
                            rowOfNumbers(
                              context,
                              buttonModels: List.generate(
                                4,
                                (index) => ButtonModel(
                                  onPressed: () =>
                                      onButtonClick(buttons[3][index]),
                                  child: calculatorText(
                                      context, buttons[3][index]),
                                ),
                              ),
                            ),
                            rowOfNumbers(
                              context,
                              buttonModels: List.generate(
                                4,
                                (index) => ButtonModel(
                                  onPressed: () =>
                                      onButtonClick(buttons[4][index]),
                                  child: calculatorText(
                                      context, buttons[4][index]),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget rowOfNumbers(
    BuildContext context, {
    required List<ButtonModel> buttonModels,
  }) =>
      Expanded(
        child: Row(
          children: [
            calculatorButton(
              onPressed: buttonModels[0].onPressed,
              child: buttonModels[0].child,
            ),
            const SizedBox(width: 8),
            calculatorButton(
              onPressed: buttonModels[1].onPressed,
              child: buttonModels[1].child,
            ),
            const SizedBox(width: 8),
            calculatorButton(
              onPressed: buttonModels[2].onPressed,
              child: buttonModels[2].child,
            ),
            const SizedBox(width: 8),
            calculatorButton(
              onPressed: buttonModels[3].onPressed,
              child: buttonModels[3].child,
            ),
          ],
        ),
      );

  Widget calculatorText(
    BuildContext context,
    String text,
  ) =>
      Text(
        text,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: Theme.of(context).colorScheme.primary,
        ),
      );

  Widget calculatorButton({
    required void Function() onPressed,
    required Widget child,
  }) {
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onPressed,
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
