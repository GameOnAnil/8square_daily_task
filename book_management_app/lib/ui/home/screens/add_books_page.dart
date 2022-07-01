import 'package:book_management_app/services/providers.dart';
import 'package:dbhelper/models/books.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddBooksPage extends StatefulWidget {
  const AddBooksPage({Key? key, required this.categoryId}) : super(key: key);
  final int categoryId;

  @override
  State<AddBooksPage> createState() => _AddBooksPageState();
}

class _AddBooksPageState extends State<AddBooksPage> {
  late TextEditingController nameController;
  late TextEditingController authorController;
  late TextEditingController priceController;
  final GlobalKey<FormState> _keys = GlobalKey();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    authorController = TextEditingController();
    priceController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    super.dispose();
  }

  void validate(WidgetRef ref, int categoryId) async {
    if (_keys.currentState!.validate()) {
      final book = Book(
          id: null,
          name: nameController.text.trim(),
          author: authorController.text.trim(),
          price: double.parse(priceController.text.trim()),
          categoryId: categoryId);

      try {
        final response = await ref
            .read(bookListNotifierProvider(categoryId))
            .insertBook(book);
        if (response != null) {
          Fluttertoast.showToast(msg: "Insert Successful");
          Navigator.pop(context);
        }
      } catch (e) {
        Fluttertoast.showToast(msg: "Error:$e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Add Books"),
      ),
      body: Form(
        key: _keys,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              TextFormField(
                validator: ((value) {
                  if (value!.isEmpty) {
                    return "Name cannot be empty";
                  }
                  return null;
                }),
                controller: nameController,
                decoration: const InputDecoration(
                  label: Text("Enter Book Name"),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.name,
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                validator: ((value) {
                  if (value!.isEmpty) {
                    return "Author cannot be empty";
                  }
                  return null;
                }),
                controller: authorController,
                decoration: const InputDecoration(
                  label: Text("Enter Book Author"),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.name,
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                validator: ((value) {
                  if (value!.isEmpty) {
                    return "Price cannot be empty";
                  }
                  return null;
                }),
                controller: priceController,
                decoration: const InputDecoration(
                  label: Text("Enter Price In NPR"),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Consumer(builder: (context, ref, child) {
                return SizedBox(
                  height: 50,
                  width: 300,
                  child: ElevatedButton(
                    onPressed: () {
                      validate(ref, widget.categoryId);
                    },
                    child: const Text("Add"),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
