import 'package:book_management_app/services/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchWidget extends StatefulWidget {
  final String text;
  final String hintText;
  final int categoryId;
  final WidgetRef ref;
  const SearchWidget({
    Key? key,
    required this.text,
    required this.hintText,
    required this.categoryId,
    required this.ref,
  }) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final textController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    textController.dispose();
  }

  void searchBook(String value) {
    widget.ref.read(bookListNotifierProvider(widget.categoryId)).search(value);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: textController,
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            label: Text(widget.hintText),
            border: const OutlineInputBorder()),
        onChanged: searchBook,
      ),
    );
  }
}
