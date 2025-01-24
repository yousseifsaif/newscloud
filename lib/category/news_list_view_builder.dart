
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../Services/newsService.dart';
import '../models/articleModel.dart';
import 'NewsListView.dart';

class NewListViewBuilder extends StatefulWidget {
  const NewListViewBuilder({
    super.key,required this.category
  });
final String category;
  @override
  State<NewListViewBuilder> createState() => _NewListViewBuilderState();
}

class _NewListViewBuilderState extends State<NewListViewBuilder> {
  @override
  var future;
  @override
  void initState() {
    super.initState();
   future= NewsService(Dio()).getGeneral(category: widget.category);
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Articlemodel>>
      (future:future,
     builder: (context,snapshot)
    {
    if (snapshot.hasData) {
    return
    Newslistview(articles: snapshot.data??[]);
    }else if(snapshot.hasError){return const Center(child: Text('Oops There was an ERROR , Try again'),);}
    else
      {return const Center(child: CircularProgressIndicator(),);}



    },
    );
  }
}
