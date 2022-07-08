import 'package:cat_api_app/providers/votes_notifier.dart';
import 'package:cat_api_app/ui/home/screens/votes_page/widget/vote_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widget/vote_image.dart';

class VotePage extends StatelessWidget {
  const VotePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const VotesImageWidget(),
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
          Expanded(
            child: VoteButton(
              isLike: false,
              ontap: () => handleVoteUpClicked(context),
            ),
          ),
          Expanded(
            child: VoteButton(
              isLike: true,
              ontap: () => handleVoteUpClicked(context),
            ),
          ),
        ],
      ),
    );
  }

  handleVoteUpClicked(BuildContext context) async {
    final image =
        Provider.of<VotesNotifier>(context, listen: false).randomImage;
    if (image != null) {
      await context.read<VotesNotifier>().voteUp();
    }
  }

  handleVoteDownClicked(BuildContext context) async {
    final image =
        Provider.of<VotesNotifier>(context, listen: false).randomImage;
    if (image != null) {
      await context.read<VotesNotifier>().voteDown();
    }
  }
}
