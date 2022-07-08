import 'package:cat_api_app/utils/constants.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: _buildAppBar(),
        body: TabBarView(
          children: [...tabContent],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('Home Page'),
      bottom: TabBar(
        isScrollable: true,
        tabs: tabTitleList,
        // controller: controller,
      ),
    );
  }
}
