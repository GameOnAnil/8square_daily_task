import 'package:book_management_app/services/providers.dart';
import 'package:book_management_app/ui/home/widgets/custom_book_tile.dart';
import 'package:book_management_app/ui/home/widgets/search_widget.dart';
import 'package:dbhelper/models/books.dart';
import 'package:dbhelper/models/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class BookListPage extends ConsumerWidget {
  final Category category;
  const BookListPage({required this.category, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookList = ref.watch(bookListNotifierProvider(category.id!)).bookList;
    final isLoading =
        ref.watch(bookListNotifierProvider(category.id!)).isLoading;
    if (isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    } else {
      return hasData(isLoading, bookList, ref, context);
    }
  }

  Scaffold hasData(bool isLoading, List<Book> bookList, WidgetRef ref,
      BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(category.title),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.sort),
            itemBuilder: ((context) => [
                  PopupMenuItem(
                    child: const Text("Sort By Name"),
                    onTap: () {
                      ref
                          .read(bookListNotifierProvider(category.id!))
                          .sortByName();
                    },
                  ),
                  PopupMenuItem(
                    child: const Text("Sort By Author"),
                    onTap: () {
                      ref
                          .read(bookListNotifierProvider(category.id!))
                          .sortByAuthor();
                    },
                  ),
                  PopupMenuItem(
                    child: const Text("Sort By Price"),
                    onTap: () {
                      ref
                          .read(bookListNotifierProvider(category.id!))
                          .sortByPrice();
                    },
                  ),
                ]),
          ),
        ],
      ),
      body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SearchWidget(
                categoryId: category.id!,
                ref: ref,
                text: "",
                hintText: "Book Name",
              ),
              Expanded(
                  child: (bookList.isNotEmpty)
                      ? _listView(bookList)
                      : _listEmpty()),
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addBook', arguments: category.id);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _listEmpty() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: double.infinity,
          height: 300,
          child: Lottie.asset("assets/json/booksearch.json", fit: BoxFit.cover),
        ),
        const Center(
          child: Text(
            "Please Add Book +",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        const SizedBox(
          height: 200,
        ),
      ],
    );
  }

  ListView _listView(List<Book> bookList) {
    return ListView.builder(
      itemCount: bookList.length,
      itemBuilder: ((context, index) {
        final currentItem = bookList[index];
        return CustomBookTile(
          book: currentItem,
          categoryId: category.id!,
        );
      }),
    );
  }
}
