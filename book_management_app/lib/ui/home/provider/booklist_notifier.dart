import 'dart:developer';

import 'package:dbhelper/dbhelper.dart';
import 'package:dbhelper/models/books.dart';
import 'package:flutter/material.dart';

class BookListNotifer extends ChangeNotifier {
  List<Book> bookList = [];
  List<Book> oldList = [];
  final DbHelper dbHelper;
  bool isLoading = false;
  final int categoryId;
  bool isSortByName = true;

  BookListNotifer({required this.dbHelper, required this.categoryId}) {
    getBooksByCategory(categoryId);
  }

  void sortByName() {
    isSortByName = true;
    bookList.sort((a, b) => a.name.compareTo(b.name));
    notifyListeners();
  }

  void sortByAuthor() {
    isSortByName = true;
    bookList.sort((a, b) => a.author.compareTo(b.author));
    notifyListeners();
  }

  void sortByPrice() {
    isSortByName = false;
    bookList.sort((a, b) => a.price.compareTo(b.price));
    notifyListeners();
  }

  Future<void> getBooks() async {
    try {
      isLoading = true;
      notifyListeners();
      final response = await dbHelper.getAllBooks();
      isLoading = false;
      bookList = response;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      log(e.toString());
      notifyListeners();
    }
  }

  Future<void> getBooksByCategory(int categoryId) async {
    try {
      isLoading = true;
      notifyListeners();
      final response = await dbHelper.getBooksByCategory(categoryId);
      isLoading = false;
      bookList = response;
      if (isSortByName) {
        bookList.sort((a, b) => a.name.compareTo(b.name));
      } else {
        bookList.sort((a, b) => a.price.compareTo(b.price));
      }
      oldList = bookList;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      log(e.toString());
      notifyListeners();
    }
  }

  Future<int?> insertBook(Book book) async {
    try {
      final response = await dbHelper.insertBook(book);
      if (response != null) {
        await getBooksByCategory(categoryId);
      }
      return response;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<int?> updateBooks(Book book) async {
    try {
      final response = await dbHelper.updateBooks(book);
      if (response != null) {
        await getBooksByCategory(categoryId);
      }
      return response;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<int?> deleteBook(int bookId) async {
    try {
      final response = await dbHelper.deleteBook(bookId);
      if (response != null) {
        await getBooksByCategory(categoryId);
      }
      return response;
    } catch (e) {
      rethrow;
    }
  }

  void search(String value) {
    final List<Book> newList = [];
    oldList.map((e) {
      final matched = e.name.contains(value);
      if (matched) {
        newList.add(e);
      }
    }).toList();
    bookList = newList;
    notifyListeners();
  }
}
