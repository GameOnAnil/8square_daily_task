import 'package:cat_api_app/models/ramdom_image.dart';
import 'package:cat_api_app/services/api_service.dart';
import 'package:cat_api_app/ui/home/widgets/error_text_widget.dart';
import 'package:cat_api_app/ui/home/widgets/progress_indicator.dart';
import 'package:flutter/material.dart';

class SearchPageData extends StatelessWidget {
  const SearchPageData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiService().getRandomImageList(10),
      builder: (context, AsyncSnapshot<List<RandomImage>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const AppProgressIndicator();
        }
        if (snapshot.hasError) {
          return ErrorTextWidget(error: snapshot.error.toString());
        }
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemCount: snapshot.data?.length,
          itemBuilder: ((context, index) {
            return Image.network(
              snapshot.data![index].url,
              fit: BoxFit.cover,
            );
          }),
        );
      },
    );
  }
}
