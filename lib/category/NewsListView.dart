import 'package:flutter/material.dart';


import '../models/articleModel.dart';
import 'newsLIst.dart';


class Newslistview extends StatelessWidget {
  List<Articlemodel> articles;
  @override
Newslistview({
super.key,required this.articles
});



  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return Padding(

            padding: const EdgeInsets.only(bottom: 22),
            child: Newslist(

              articlemodel: articles[index],
            ),
          );
        });
  }
}
