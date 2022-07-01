import 'package:book_management_app/services/providers.dart';
import 'package:dbhelper/models/books.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditBooksAlertDialog extends StatefulWidget {
  final int categoryId;
  final Book book;
  const EditBooksAlertDialog({
    Key? key,
    required this.categoryId,
    required this.book,
  }) : super(key: key);

  @override
  State<EditBooksAlertDialog> createState() => _EditBooksAlertDialogState();
}

class _EditBooksAlertDialogState extends State<EditBooksAlertDialog> {
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

    nameController.text = widget.book.name;
    authorController.text = widget.book.author;
    priceController.text = widget.book.price.toString();
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
          id: widget.book.id,
          name: nameController.text.trim(),
          author: authorController.text.trim(),
          price: double.parse(priceController.text.trim()),
          categoryId: categoryId);

      try {
        final response = await ref
            .read(bookListNotifierProvider(categoryId))
            .updateBooks(book);
        if (response != null) {
          Fluttertoast.showToast(msg: "Update Successful");
          Navigator.pop(context);
        }
      } catch (e) {
        Fluttertoast.showToast(msg: "Error:$e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .5,
        child: AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: Scaffold(
            appBar: AppBar(
              elevation: 0,
              automaticallyImplyLeading: false,
              title: const Text("Edit Books"),
              leading: null,
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.remove))
              ],
            ),
            body: Form(
              key: _keys,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
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
                      return ElevatedButton(
                        onPressed: () {
                          validate(ref, widget.categoryId);
                        },
                        child: const Text("Update"),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
