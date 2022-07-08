import 'package:cat_api_app/providers/votes_notifier.dart';
import 'package:cat_api_app/utils/response_status.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VotesImageWidget extends StatelessWidget {
  const VotesImageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .5,
      child: Consumer<VotesNotifier>(builder: (context, notifier, child) {
        final status = notifier.status;
        if (status == Status.success) {
          return Image.network(notifier.randomImage!.url);
        }
        if (status == Status.failure) {
          return Center(
            child: Text(notifier.error),
          );
        }
        if (status == Status.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        return Container();
      }),
    );
  }
}
