import 'package:cat_api_app/providers/votes_notifier.dart';
import 'package:cat_api_app/utils/response_status.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VotePage extends StatelessWidget {
  const VotePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * .5,
            child: _buildImagePart()),
        _buildButtonPart(context),
      ],
    );
  }

  Padding _buildButtonPart(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _voteUpButton(context),
          _voteDownButton(context),
        ],
      ),
    );
  }

  Expanded _voteDownButton(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () async {
            final image =
                Provider.of<VotesNotifier>(context, listen: false).randomImage;

            if (image != null) {
              await context.read<VotesNotifier>().voteDown();
            }
          },
          child: const Text("Down Vote"),
        ),
      ),
    );
  }

  Expanded _voteUpButton(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () async {
            final image =
                Provider.of<VotesNotifier>(context, listen: false).randomImage;
            if (image != null) {
              await context.read<VotesNotifier>().voteUp();
            }
          },
          child: const Text("Up Vote"),
        ),
      ),
    );
  }

  Consumer<VotesNotifier> _buildImagePart() {
    return Consumer<VotesNotifier>(builder: (context, notifier, child) {
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
    });
  }
}
