import 'package:book_management_app/ui/home/provider/booklist_notifier.dart';
import 'package:dbhelper/dbhelper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dbhelperProvider = Provider<DbHelper>(
  (ref) {
    return DbHelper.instance;
  },
);

final bookListNotifierProvider =
    ChangeNotifierProvider.autoDispose.family(((ref, int categoryId) {
  final dbHelper = ref.watch(dbhelperProvider);
  return BookListNotifer(dbHelper: dbHelper, categoryId: categoryId);
}));
