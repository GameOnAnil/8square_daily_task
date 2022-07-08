import 'package:authentication/services/auth_sevice.dart';
import 'package:book_management_app/services/providers.dart';
import 'package:book_management_app/ui/home/screens/book_list_page.dart';
import 'package:book_management_app/ui/home/widgets/grid_custom_tile.dart';
import 'package:dbhelper/models/category.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  final User userCredential;
  const HomePage({required this.userCredential, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Text(
          "Category",
          style:
              TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                ref.read(authServiceProvider).signOut();
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.black,
              ))
        ],
      ),
      body: Column(
        children: [
          FutureBuilder(
              future: ref.read(dbhelperProvider).readAllCategory(),
              builder: (context, AsyncSnapshot<List<Category>> snapshot) {
                if (snapshot.hasError) {
                  return const Center(
                    child: Text("ERROR"),
                  );
                }
                if (snapshot.hasData) {
                  return Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        final currentItem = snapshot.data![index];
                        return GestureDetector(
                          onTap: (() => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => BookListPage(
                                          category: currentItem,
                                        ))),
                              )),
                          child: GridCustomTile(
                              image: currentItem.image,
                              bgColor: Color(currentItem.color),
                              txtColor: Color(currentItem.textColor),
                              title: currentItem.title),
                        );
                      },
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }),
        ],
      ),
    );
  }
}
