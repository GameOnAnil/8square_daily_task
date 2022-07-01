import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QuestionTwo extends StatefulWidget {
  const QuestionTwo({Key? key}) : super(key: key);

  @override
  State<QuestionTwo> createState() => _QuestionTwoState();
}

class _QuestionTwoState extends State<QuestionTwo> {
  void findMatching() {
    setState(() {
      for (var first in firstList) {
        var hasFirst = secondList.contains(first);
        var isAdded = finalList.contains(first);
        if (!hasFirst && !isAdded) {
          finalList.add(first);
        }
      }
      for (var second in secondList) {
        var hasSecond = firstList.contains(second);
        var isAdded = finalList.contains(second);
        if (!hasSecond && !isAdded) {
          finalList.add(second);
        }
      }
    });
  }

  var firstList = [];
  var secondList = [];
  var finalList = [];
  final firstController = TextEditingController();
  final secondController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Second Question")),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              finalList.toString(),
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: Colors.red,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: firstController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Enter first array"),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: secondController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Enter Second array"),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
            ),
            ElevatedButton(
              onPressed: () {
                finalList = [];
                firstList = [];
                secondList = [];

                firstList = firstController.text.split("");
                secondList = secondController.text.split("");
                findMatching();
              },
              child: const Text("Find"),
            )
          ],
        ),
      ),
    );
  }
}
