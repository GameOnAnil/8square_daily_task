import 'package:book_management_app/services/providers.dart';
import 'package:book_management_app/ui/home/widgets/edit_books_alert_dialog.dart';
import 'package:dbhelper/models/books.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomBookTile extends StatefulWidget {
  final int categoryId;
  final Book book;
  const CustomBookTile({
    Key? key,
    required this.book,
    required this.categoryId,
  }) : super(key: key);

  @override
  State<CustomBookTile> createState() => _CustomBookTileState();
}

class _CustomBookTileState extends State<CustomBookTile> {
  bool isDollor = true;

  void handleOnClicked(int categoryId, Book book) {
    showDialog(
        context: context,
        builder: (context) {
          return EditBooksAlertDialog(
            categoryId: categoryId,
            book: book,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => handleOnClicked(widget.categoryId, widget.book),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
        child: SizedBox(
          height: 100,
          child: Card(
            elevation: 4,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/book.png",
                    fit: BoxFit.cover,
                    width: 60,
                    height: 60,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.book.name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "Author: ${widget.book.author}",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              isDollor
                                  ? "Price: \$ ${(widget.book.price * 0.0080).toStringAsFixed(2)}"
                                  : "Price: Rs. ${widget.book.price.toStringAsFixed(2)}",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Expanded(
                              child: SizedBox(),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isDollor = !isDollor;
                                });
                              },
                              child: Row(
                                children: [
                                  Text(
                                    isDollor ? "USD" : "NPR",
                                    style: const TextStyle(
                                        color: Colors.deepPurple,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Icon(
                                    Icons.arrow_downward,
                                    size: 20,
                                    color: Colors.deepPurple,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Consumer(builder: (context, ref, child) {
                    return IconButton(
                        onPressed: () async {
                          await ref
                              .read(bookListNotifierProvider(widget.categoryId))
                              .deleteBook(widget.book.id!);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ));
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
