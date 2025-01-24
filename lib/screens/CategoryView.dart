import 'package:flutter/material.dart';

import '../category/news_list_view_builder.dart';

class Categoryview extends StatelessWidget {
  const Categoryview({super.key, required this.category});

  final String category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "News",
            style: TextStyle(),
          ),
          Text(
            "Cloud",
            style: TextStyle(color: Colors.orange),
          ),
        ],
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
    ),
        body: SingleChildScrollView(
            child: NewListViewBuilder(category: category,)));
  }
}