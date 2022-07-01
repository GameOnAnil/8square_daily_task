import 'package:eight_square_task/screens/question_two.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final key = GlobalKey();
  final emailController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
  }

  bool validateEmail(String email) {
    var emailValidator =
        RegExp("[A-Za-z0-9._]{1,}@[a-z]{3,}[.][A-Za-z]{3,6}\$");
    return emailValidator.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const QuestionTwo()));
              },
              icon: const Icon(Icons.next_plan))
        ],
      ),
      body: Form(
        key: key,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Enter Email"),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  final isValid = validateEmail(emailController.text);
                  if (isValid) {
                    Fluttertoast.showToast(msg: "Valid");
                  } else {
                    Fluttertoast.showToast(msg: "Not Valid");
                  }
                },
                child: const Text('Validate'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
