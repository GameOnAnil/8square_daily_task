library dbhelper;

import 'dart:developer';
import 'dart:io';

import 'package:dbhelper/models/books.dart';
import 'package:dbhelper/models/category.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  final String _booksTableName = 'book_table';
  final String _categoryTableName = 'category_table';

  DbHelper._provideConstructor();
  static final DbHelper instance = DbHelper._provideConstructor();

  static Database? _database;
  Future<Database> get database async => _database ?? await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'book.db');
    return await openDatabase(
      path,
      version: 2,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(
      '''CREATE TABLE $_categoryTableName
      (id INTEGER PRIMARY KEY, 
      title TEXT,
      image TEXT,
      color INTEGER,
      textColor INTEGER)
      ''',
    );
    await db.execute('''CREATE TABLE $_booksTableName
        (id INTEGER PRIMARY KEY AUTOINCREMENT, 
        name TEXT,
        author TEXT,
        price INTEGER,
        category_id INTEGER,
        FOREIGN KEY(category_id) REFERENCES $_categoryTableName(id))''');

    dummyCategoryList.map((category) async {
      await insertCategory(category);
    }).toList();
  }

  /* FOR BOOKS*/
  Future<int?> insertBook(Book book) async {
    try {
      final db = await instance.database;
      final response = await db.insert(_booksTableName, book.toMap());
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<int?> updateBooks(Book books) async {
    try {
      final db = await instance.database;
      final response = await db.update(
        _booksTableName,
        books.toMap(),
        where: "id=?",
        whereArgs: [books.id!],
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Book>> getAllBooks() async {
    final db = await instance.database;
    final mapResponse = await db.query(_booksTableName);
    final list = mapResponse.map((e) => Book.fromMap(e)).toList();
    return list;
  }

  Future<List<Book>> getBooksByCategory(int categoryId) async {
    Database db = await instance.database;
    var result = await db.query(_booksTableName,
        orderBy: 'id', where: "category_id=?", whereArgs: [categoryId]);
    List<Book> bookList =
        result.isNotEmpty ? result.map((e) => Book.fromMap(e)).toList() : [];
    return bookList;
  }

  Future<int?> deleteBook(int bookId) async {
    try {
      final db = await instance.database;
      log("delet:$bookId");
      final response = await db.delete(
        _booksTableName,
        where: "id=?",
        whereArgs: [bookId],
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

/* FOR CATEGORY*/
  Future<void> insertCategory(Category category) async {
    final db = await instance.database;
    await db.insert(_categoryTableName, category.toMap());
  }

  Future<List<Category>> readAllCategory() async {
    final db = await instance.database;
    final mapResponse = await db.query(_categoryTableName);
    final list = mapResponse.map((e) => Category.fromMap(e)).toList();
    return list;
  }
}
