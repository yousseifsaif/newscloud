import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../models/articleModel.dart';

class ArticlePage extends StatefulWidget {
  final String blogUrl;

  const ArticlePage({super.key, required this.blogUrl, });

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  late final WebViewController _controller;
  Articlemodel? article = Articlemodel(
      image: 'image', tittle: 'tittle', subTittle: 'subTittle', url: '');

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..loadRequest(Uri.parse('https://example.com'));
  }

  @override
  Widget build(BuildContext context) {
    ModalRoute.of(context)?.settings.arguments as Articlemodel?;
    return Scaffold(
      appBar: AppBar(
        title: Text("${article?.tittle}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child:

        WebViewWidget(controller: _controller),

        // child: SingleChildScrollView(
        //   child: Column(
        //     children: [
        //       Image.network("${article?.image}"),
        //       RichText(
        //         text: TextSpan(text: "${article?.subTittle}"),
        //         softWrap: true,
        //         textAlign: TextAlign.center,
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
